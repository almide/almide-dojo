# Dojo Rules

## What this repo is

Almide Dojo is the **daily MSR measurement ground**. Every day, LLMs are asked to write Almide code against a task bank. Results, diagnostics that helped, and diagnostics that misled are all recorded here.

## Harness language

**The harness is written in Almide itself** (`src/main.almd`). Do not rewrite it in another language. Dojo is the first non-trivial I/O-heavy dogfood of Almide (HTTP + fs + process + json), and that is load-bearing — the harness itself is also MSR data.

If a stdlib limitation makes the harness painful to write, **file an issue upstream in `almide/almide` and fix it there**, don't work around it here.

## Task contribution rules

When adding a new task:

1. Create a directory under `tasks/<difficulty>/<task-name>/`
2. The task name uses `kebab-case`
3. Required files:
   - `prompt.md` — instruction given to the LLM
   - `tests.almd` — test blocks using `assert_eq` / `assert`
   - `meta.toml` — difficulty, expected_loc, timeout_sec
4. The LLM will be given `prompt.md` only. It must not see `tests.almd`.
5. The combined test+solution must compile and pass on the pinned Almide version.

## Difficulty levels

- `basic/` — single function, < 20 LOC expected
- `intermediate/` — multiple functions or small module, 20 - 80 LOC
- `advanced/` — multi-file project, > 80 LOC

## Modifying existing tasks

Do NOT modify existing tasks retroactively — it breaks the MSR trend line.
Instead, add a new task alongside, and deprecate the old one once the history is long enough.

## Malicious hints

When a diagnostic Hint text leads a model astray, log it in `malicious-hints.md`.
Each entry feeds back into `almide/almide`'s diagnostic improvement backlog.

## Commit message rules

- Write commit messages in **English only** (to match `almide/almide` convention)
- No prefix (no `feat:`, `fix:`, etc.)
- One concise line

## Run output rules

- Raw model outputs (full generated source, full diagnostics) go under `runs/YYYY-MM-DD/raw/` and are NOT committed (see `.gitignore`)
- Summarized metrics (`summary.md`, per-task pass/fail + retry count) ARE committed so trends can be read from git history
- Every run is measured with the compiler in `almide-pin.toml`; `summary.md` is stamped with `almide --version`, and a summary that was measured with another version is not committed
- The nightly workflow measures the Cloudflare models only. **No Anthropic or OpenAI key goes into CI secrets** (maintainer ruling). An Anthropic / OpenAI row is measured locally — `ANTHROPIC_API_KEY=... almide run src/main.almd -- all anthropic:claude-sonnet-5` with the pinned compiler — and its `runs/<date>/<model-slug>/summary.md` is committed by hand (README: Running the harness)
- The cross-language lane (`make msr`, `src/msr/`, almide/almide#2146) writes `runs/msr/<date>/<model-slug>[-<label>]/{manifest.json, results.json, table.md}`. **`--label` is part of the path**, so a run labelled `smoke` cannot replace the unlabelled measurement for the same model on the same day — it used to be able to, and on 2026-09-22 a one-task smoke did exactly that to a 21-task run. Published cross-language numbers follow the order in almide/almide#2146 (task set #1963 → repair schema #2149 → `almide survive` #2147 → this lane re-measures); until then no table from this lane goes into a README scorecard
- Adding a task to the cross-language set means: a line in `msr/task-set.json` (`include`, with the type reason), `msr/specs/<task>.md`, and a reference solution under `msr/reference/<language>/` for every plugin; `scripts/check-task-set.sh` and `make msr-verify` (CI) gate both. A task whose signature leaves the Int/Bool/String/List subset goes in `exclude` with its reason
