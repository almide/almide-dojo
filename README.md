# Almide Dojo

> Daily modification-survival-rate (MSR) measurement for [Almide](https://github.com/almide/almide).

**📊 Live dashboard: <https://almide.github.io/almide-dojo/>**

Almide's existence rests on one metric: **how often LLM-written code survives modification**. Almide Dojo makes that measurement continuous — and feeds the failures back as a backlog for improving Almide's compiler diagnostics and stdlib.

## The metric that matters

The headline is **final pass rate after up to 3 retries** — i.e. *did the model converge to a passing solution given diagnostic feedback*. 1-shot rate is informational only; the real signal is whether the diagnostic loop is good enough for the model to recover. Anything that improves retry-success — clearer diagnostics, better hints, smarter retry prompts, fixed compiler bugs — counts as a win.

## What the dashboard shows

- **Pass rate over time** — per model (final pass after retries; this is the headline)
- **Failure breakdown by category** — `parse-error` / `type-error` / `name-error` / `import-error` / `runtime-error` / `wrong-output` / `unknown` per model. The categories tell you *why* the retry loop didn't converge.
- **Top diagnostic codes** — which `error[E0xx]` codes are most often blocking LLMs even after 3 retries (drives the diagnostic-improvement backlog in `almide/almide`)
- **Pass rate by Almide feature × model** — heatmap over `tasks/*/meta.toml` `tags`, surfacing which language features each model handles vs. trips on
- **Per-task results** with category, code, and retry count

## What happens here

Every day (once Phase 2 is live):

1. LLMs are given tasks from `tasks/` via `prompt.md`
2. Their output is compiled with a pinned Almide compiler
3. If compilation fails, the diagnostic is fed back and the model retries (up to N times)
4. Successful solutions are tested against `tests.almd`
5. Results land in `runs/YYYY-MM-DD/`

The signal we care about:

- **1-shot success rate** — did the LLM compile without any retry?
- **N-shot success rate** (N = 2, 3, 5)
- **Average retry count per task**
- **Diagnostics that helped** (LLM fixed its code after reading the hint)
- **Malicious hints** — diagnostics that led the LLM astray

## Structure

```
almide.toml          Package manifest (the harness itself is an Almide package)
src/main.almd        Harness — written in Almide, of course
tasks/               Task bank (prompts + tests + metadata)
runs/                Per-day results, committed to git
dashboards/          Static site for visualizing trends (GitHub Pages)
almide-pin.toml      Which Almide compiler commit we evaluate against
malicious-hints.md   Incident log of hint texts that misled models
```

The harness is deliberately written in Almide itself — Dojo is the first place that dogfoods Almide for a non-trivial I/O-heavy program (HTTP, fs, process, json). Every line of the harness is another data point for the language it tests.

## Running the harness

Install the compiler named in `almide-pin.toml` (the run's identity — every
`summary.md` is stamped with `almide --version`, and a summary measured with
another version is not comparable):

```bash
PIN=$(sed -nE 's/^ref *= *"([^"]+)".*/\1/p' almide-pin.toml)
curl -fsSL https://raw.githubusercontent.com/almide/almide/main/tools/install.sh | sh -s -- "$PIN"
almide --version   # must print the pin
```

Model specs are `provider:model`; the provider's key comes from the environment
(`CF_ACCOUNT_ID` + `CLOUDFLARE_API_KEY`, `ANTHROPIC_API_KEY`, `OPENAI_API_KEY`,
`OPENROUTER_API_KEY`; see the header of `src/main.almd`):

```bash
# single task
almide run src/main.almd -- fizzbuzz anthropic:claude-sonnet-5

# all tasks, writes runs/YYYY-MM-DD/<model-slug>/summary.md (+ one .md per task)
almide run src/main.almd -- all cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast
```

Exit codes of `all`: 0 every task passed, 1 some tasks failed (the summary is
still written — that is the measurement), 2 no task reached the model (no key,
network down): nothing is written, because a 0/N row with zero attempts would
poison the trend line.

### Nightly vs. by hand

The [Daily MSR Run](.github/workflows/daily.yml) measures the **Cloudflare
models only** and commits `runs/<date>/…` to `main`; the repo holds Cloudflare
credentials and nothing else — by decision, **no Anthropic or OpenAI key is in
CI**, so an `anthropic:`/`openai:` spec passed to a `workflow_dispatch` is red.

Anthropic / OpenAI rows (for example the Sonnet 5 row the almide README
scorecard cites, almide/almide#1617) are measured **locally** with the pinned
compiler and committed by hand:

```bash
ANTHROPIC_API_KEY=... almide run src/main.almd -- all anthropic:claude-sonnet-5
git add runs/$(date -u +%Y-%m-%d)/anthropic_claude-sonnet-5/
git commit -m "Record the $(date -u +%Y-%m-%d) full-bank MSR run for Sonnet 5 against $PIN"
```

The committed `summary.md` carries the model, the `compiler` stamp, the task
count and the pass counts; the README row then cites `almide-dojo@<that sha>`.

## Task bank (31 tasks)

**Basic** (15 tasks, < 20 LOC) — single function, core language features:
`fizzbuzz`, `factorial`, `fibonacci`, `gcd`, `is-prime`, `is-palindrome`, `string-reverse`, `sum-digits`, `count-vowels`, `clamp`, `max-of-list`, `list-sum`, `title-case`, `repeat-string`, `remove-duplicates`

**Intermediate** (10 tasks, 20–80 LOC) — multiple functions, stdlib composition:
`caesar-cipher`, `roman-numeral`, `run-length-encoding`, `word-count`, `balanced-parens`, `anagram-check`, `binary-search`, `flatten-nested`, `partition-list`, `zip-with`

**Advanced** (6 tasks, > 80 LOC) — custom ADTs, pattern matching, error handling:
`expression-eval`, `custom-linked-list`, `result-pipeline`, `mini-json-query`, `matrix-ops`, `red-black-tree`

## Current phase

**Phase 3** — 31-task bank with three difficulty tiers, harness searches across `basic/`, `intermediate/`, `advanced/` directories. Next: add GitHub Actions daily workflow, build the dashboards.

See [`docs/roadmap/active/almide-dojo.md`](https://github.com/almide/almide/blob/main/docs/roadmap/active/almide-dojo.md) in the main Almide repo for the full roadmap.

## License

MIT — see [LICENSE](./LICENSE).
