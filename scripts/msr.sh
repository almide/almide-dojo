#!/usr/bin/env bash
# The `make msr` driver: pin the compiler, put the pinned TypeScript on PATH,
# pick a model spec from whichever provider key the environment holds, run
# the cross-language lane. Every language whose toolchain is absent is
# reported by the lane as "not measured: <tool> missing" — nothing here
# installs a language toolchain, so a third party's table is a function of
# what their machine has, stated in the manifest.
#
# Usage: scripts/msr.sh <run|verify|probe|compiler> <model> <languages> <tasks> <label> <out>
set -euo pipefail

cd "$(dirname "$0")/.."

cmd="${1:-run}"
model="${2:-}"
languages="${3:-}"
tasks="${4:-}"
label="${5:-}"
out="${6:-}"

# ── The pinned compiler is the run's identity ──
pin=$(sed -nE 's/^ref *= *"([^"]+)".*/\1/p' almide-pin.toml)
[ -n "$pin" ] || { echo "almide-pin.toml has no [compiler] ref" >&2; exit 1; }
want="almide ${pin#v}"
export PATH="$HOME/.local/bin:$PATH"
if ! command -v almide >/dev/null 2>&1 || [ "$(almide --version)" != "$want" ]; then
  echo "installing the pinned compiler $pin (tools/install.sh)" >&2
  curl -fsSL https://raw.githubusercontent.com/almide/almide/main/tools/install.sh | sh -s -- "$pin" >&2
fi
got=$(almide --version)
[ "$got" = "$want" ] || { echo "almide-pin.toml says $pin but the installed binary is '$got'" >&2; exit 1; }
[ "$cmd" = "compiler" ] && exit 0

# ── TypeScript: a pinned tsc, installed under .msr-tools/ when PATH has none ──
if ! command -v tsc >/dev/null 2>&1 && command -v npm >/dev/null 2>&1; then
  ts_version=$(sed -nE 's/^typescript *= *"([^"]+)".*/\1/p' msr/toolchains.toml)
  if [ ! -x .msr-tools/node_modules/.bin/tsc ]; then
    echo "installing typescript@$ts_version into .msr-tools/ (tsc is not on PATH)" >&2
    mkdir -p .msr-tools
    (cd .msr-tools && npm install --no-audit --no-fund --silent "typescript@$ts_version" >&2) || true
  fi
  [ -x .msr-tools/node_modules/.bin/tsc ] && export PATH="$PWD/.msr-tools/node_modules/.bin:$PATH"
fi
# MoonBit installs to ~/.moon/bin and Zig via Homebrew; put both on PATH when present.
[ -d "$HOME/.moon/bin" ] && export PATH="$HOME/.moon/bin:$PATH"
[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:$PATH"

# ── The model: MODEL, else whichever provider key the environment holds ──
# Cloudflare's Global API Key auth needs all three variables. A partial set
# used to select the cf: spec anyway and fail at the wire; name the missing
# one here instead, because a Cloudflare auth failure comes back as HTTP 200
# with no completion (see src/llm.almd).
cf_missing=""
for v in CF_ACCOUNT_ID CLOUDFLARE_API_KEY CLOUDFLARE_EMAIL; do
  eval "val=\${$v:-}"
  [ -n "$val" ] || cf_missing="$cf_missing $v"
done
if [ "$cmd" = "run" ] && [ -z "$model" ]; then
  if [ -n "${CLOUDFLARE_API_KEY:-}" ] || [ -n "${CF_ACCOUNT_ID:-}" ]; then
    [ -z "$cf_missing" ] || { echo "cloudflare: missing$cf_missing (Global API Key auth needs CF_ACCOUNT_ID, CLOUDFLARE_API_KEY and CLOUDFLARE_EMAIL)" >&2; exit 2; }
    model="cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast"
  elif [ -n "${ANTHROPIC_API_KEY:-}" ]; then
    model="anthropic:claude-sonnet-5"
  elif command -v claude >/dev/null 2>&1; then
    model="cli:claude"
  else
    cat >&2 <<'EOF'
no model: set MODEL=provider:model, or export one of these and the default spec is used
  CF_ACCOUNT_ID + CLOUDFLARE_API_KEY + CLOUDFLARE_EMAIL   -> cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast
  ANTHROPIC_API_KEY                                       -> anthropic:claude-sonnet-5
  a logged-in `claude` CLI on PATH (no key)               -> cli:claude
OPENAI_API_KEY / OPENROUTER_API_KEY work too, with an explicit MODEL=openai:<model> / MODEL=openrouter:<model>.
EOF
    exit 2
  fi
  echo "model: $model (from the environment; pass MODEL= to choose)" >&2
fi

# An explicit cf:/cloudflare: MODEL gets the same completeness check.
case "$model" in
  cf:*|cloudflare:*)
    [ -z "$cf_missing" ] || { echo "cloudflare: MODEL=$model but missing$cf_missing (Global API Key auth needs CF_ACCOUNT_ID, CLOUDFLARE_API_KEY and CLOUDFLARE_EMAIL)" >&2; exit 2; }
    ;;
esac

args=()
case "$cmd" in
  run)    args=(run "$model") ;;
  verify) args=(verify) ;;
  probe)  args=(probe) ;;
  *) echo "unknown command $cmd" >&2; exit 2 ;;
esac
[ -n "$languages" ] && args+=(--languages "$languages")
[ -n "$tasks" ] && args+=(--tasks "$tasks")
[ -n "$label" ] && args+=(--label "$label")
[ -n "$out" ] && args+=(--out "$out")

exec almide run src/msr/run.almd -- "${args[@]}"
