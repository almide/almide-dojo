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
src/main.almd        Harness — written in Almide, of course (the daily Almide lane)
src/cellstate.almd   The cell states, the rates and the verdicts BOTH lanes speak
src/msr/             The cross-language lane: neutral task model, language plugins, runner
msr/                 Its task set (task-set.json), behavior texts, reference solutions
tasks/               Task bank (prompts + tests + metadata)
runs/                Per-day results, committed to git (runs/msr/ for the cross-language lane)
dashboards/          Static site for visualizing trends (GitHub Pages)
almide-pin.toml      Which Almide compiler commit we evaluate against
malicious-hints.md   Incident log of hint texts that misled models
Makefile             `make msr`, `make msr-verify`, `make msr-probe`, `make test`
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
(`CF_ACCOUNT_ID` + `CLOUDFLARE_API_KEY` + `CLOUDFLARE_EMAIL`, `ANTHROPIC_API_KEY`,
`OPENAI_API_KEY`, `OPENROUTER_API_KEY`; see the header of `src/main.almd`). An
unprefixed `claude-*` is the Anthropic Messages API, not the CLI; the Claude
Code CLI is `cli:claude` (`claude -p`, no API key, the CLI's own model and
sampling — a convenience for smoke runs, not a scorecard provider):

```bash
# single task
almide run src/main.almd -- fizzbuzz anthropic:claude-sonnet-5

# all tasks, writes runs/YYYY-MM-DD/<model-slug>/summary.md (+ one .md per task)
almide run src/main.almd -- all cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast
```

Exit codes of `all`, in the order they are decided: **2** no task reached the
model (no key, network down) — nothing is written, because a 0/N row with zero
attempts would poison the trend line; **3** the run is `not-comparable`, some
planned task was never answered so the published rate is an interval (the
summary *is* written and committed, carrying its own refusal); **1** some
measured task failed — that is the measurement; **0** every planned task
reached the model and passed. A single task exits 2 when the model was never
answered for it, the same code `all` uses for "nothing was measured".

### The denominator is the planned task count, and every task has a state

The daily lane speaks **the same four cell states as the cross-language lane**
(`src/cellstate.almd` is one module, imported by both) over its own
`tasks × one model` grid — *measured*, *inconclusive-saturated*, *not-run*,
*harness-limitation*, defined in the table [below](#the-denominator-is-the-planned-task-count-and-every-cell-has-a-state).
A task the model was never answered for — an HTTP read timeout, the empty
completion `src/llm.almd` refuses, a missing credential — is **`not-run`, not
a zero** (almide-dojo#17). It used to be recorded as `RunResult { success:
false }`, so a network event was published in `summary.md`'s `passed/total`
line as a model result.

Every rate in `summary.md` therefore has the **planned** task count as its
denominator, and a run with `not-run` tasks prints its rate as an interval —
`26/38 (68%–100%)` — because the true rate is bounded below by "every absent
task would have failed" and above by "every one would have passed". A complete
run's interval collapses to a point, which is exactly when it is quotable.
`summary.md` carries, above the numbers:

- the run's **verdict** (`comparable` / `inconclusive-saturated` /
  `not-comparable` / `nothing-measured` — the same four ids the cross lane
  stamps), and
- a **Never asked** table naming every absent task with what the transport
  actually said, verbatim, plus `- **cells**:` with the four counts and
  `- **http timeout (s)**:`, the deadline the absences are absences *because*
  of.

The daily job publishes the summary to the job step summary first and then
re-derives the refusal from the summary's own `reached` / `tasks` numbers: a
`not-comparable` run **fails the job**, after its results are committed. A
refused run is evidence; it is just not a scorecard number.
`inconclusive-saturated` — this model passed ≥ 98 % of the tasks it was asked,
so the bank is at its ceiling — is a `::warning::` and not a failure, for the
same reason it is in the other lane.

There is deliberately **no `verdict` subcommand here**, unlike the cross lane:
that one re-derives a verdict from a `results.json` this lane does not write,
and adding one would mean publishing a second artifact that a reader of
`summary.md` would not open. What the cross lane gets from re-derivation, this
lane gets from the workflow recomputing the refusal out of the published
numbers rather than trusting the banner.

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

The committed `summary.md` carries the model, the `compiler` stamp, the HTTP
read timeout, the planned task count, the four cell-state counts and the pass
rate; the README row then cites `almide-dojo@<that sha>`. **Quote the rate as
`summary.md` prints it**: if it is an interval, the interval is the number —
some tasks were never asked and the point would be a claim the run cannot
support. A `not-comparable` run is not a scorecard row at all.

The [Cross-language MSR Run](.github/workflows/msr-cross.yml) is the second
scheduled lane: **weekly** (Mondays 05:00 UTC) and on `workflow_dispatch`, on
the same Cloudflare models, committing `runs/msr/<date>/<model-slug>[-<label>]/` to
`main`. It is weekly rather than daily because one cross-language run is ~500
model calls and seven toolchain installs against the daily lane's 21 calls,
and the number it feeds — the almide README scorecard — is gated at 90 days
by almide/almide's `scripts/check-readme-numbers.sh`; weekly re-measures it
twelve times inside that window. Dispatching it with an `anthropic:` or
`openai:` spec is refused in the `plan` job, by name, before anything runs.
Each language's toolchain install is `continue-on-error`, so a broken setup
action downgrades that language to `not measured: <tool> missing` instead of
deleting the whole table; the job then asserts #2146's victory condition
(Almide first, at least five languages measured under one manifest, at least
one task that actually reached the model).

### Cross-language lane: `git clone && make msr`

The second lane (almide/almide#2146) asks the same model the same tasks in
seven languages — **Almide first**, then Rust, Go, TypeScript, Zig, Gleam,
MoonBit — with the same prompt modulo the language name and its syntax
notes, the same retry budget, judged by each language's own toolchain, and
writes one manifest per run. A third party reproduces the table with:

```bash
git clone https://github.com/almide/almide-dojo && cd almide-dojo
CF_ACCOUNT_ID=... CLOUDFLARE_API_KEY=... CLOUDFLARE_EMAIL=... make msr   # Cloudflare Workers AI
# or  ANTHROPIC_API_KEY=... make msr
# or  MODEL=cli:claude make msr    with a logged-in `claude` CLI, no key at all
```

Every measured call is pinned at **seed `20260922`** and temperature 0, so a
third party asks for the same sampling this repo's runs asked for — the
constant is `SEED` in `src/llm.almd`, not a flag, precisely so it cannot
differ between their run and ours. What the provider did with the request is
a separate question the manifest answers honestly: `seed_sent` says the field
reached the request body, never that the model honoured it. Whether a given
model honours a seed is empirical — run the same (model, seed, task set)
twice and compare — and no text-generation API reports it back. A provider
that takes no seed (the `cli:` ones) records `seed_sent: false` and a null
seed, so an unpinned run never looks like a pinned one.

**No Anthropic key is required**, by ruling and by construction: the lane
that produces the published number runs on CI, on the Cloudflare models
(below). Cloudflare's Global API Key auth needs all three variables — a
partial set is refused by name before any task runs, because Cloudflare
answers a bad credential with HTTP 200 and a body carrying no completion,
and an empty completion scored against the oracle looks exactly like a model
that cannot write the language. `src/llm.almd` refuses an empty completion
outright: it becomes a harness error, which is recorded as `unreached` and
rolled up as "not measured", never as a 0%.

`make msr` installs the compiler named in `almide-pin.toml` (refusing any
other version), puts a pinned `tsc` on PATH when there is none, picks the
model from whichever provider key the environment holds (`MODEL=` overrides;
OpenAI / OpenRouter keys need an explicit `MODEL=`), runs every language
whose toolchain is on PATH, and prints the table. It installs no language
toolchain: a language whose compiler is missing is a row that says
`not measured: <tool> missing` — never dropped, never counted as a failure —
so the table is a function of the machine, stated in the manifest.

```
runs/msr/<date>/<model-slug>[-<label>]/
  manifest.json   the verdict (below), model, provider, what was REQUESTED
                  (temperature, seed) beside what the provider actually put ON
                  THE WIRE (`temperature_sent` / `seed_sent` and the values,
                  null when unsent) — measured by a preflight call with the
                  run's own options, not described from this end,
                  the HTTP read timeout the run ran under, retries, task-set revision
                  + sha256, per-language toolchain versions and prompt hashes, compiler
                  pin + version, harness commit, every planned condition and the
                  effect A/B's verdict and arms (`conditions`, `effect_ab`; see below)
  results.json    EVERY planned (task, language, condition) cell, with its typed state, pass/fail,
                  retries, the reason an absent cell is absent, and the kind of each
                  failed attempt
  table.md        the verdict, then the multi-language table (summary + per-task grid),
                  then the effect A/B (its verdict, both Almide arms side by side, per task)
  raw/            every attempt's sources and logs (gitignored)
```

### The denominator is the planned task count, and every cell has a state

A percentage over the subset a language happened to reach reads exactly like
one over the whole set — `15/15 (100%)` and `21/21 (100%)` side by side are
carried away as equal, and the caveat in the row is not what travels. So the
denominator of every rate in the table is the **planned** task count, always,
and every cell of the planned `tasks x languages` grid carries one of four
states — the vocabulary [almide/almide#1963](https://github.com/almide/almide/issues/1963)
item 4 asks for. The four partition the grid, and `manifest.verdict.cells`
prints the four counts so a reader can add them up. The states, the 98 %
threshold, the interval rate and the four verdict ids live in
`src/cellstate.almd` and are the **same four in the daily lane**, over its
`tasks × one model` grid — one vocabulary, because two copies of one is how
two lanes stop meaning the same thing by it:

| state | means | in the table |
|---|---|---|
| `measured` | the model answered and the language's own toolchain judged it, in a run where at least one measured cell **failed** — only such a cell carries discriminating information | `pass` / `pass@N` / `FAIL` |
| `inconclusive-saturated` | judged exactly like `measured`, and passed, but every language reached ≥ 98 % of the cells it measured: the bank is at its ceiling and the cell separates nothing (`INCONCLUSIVE_BANK_SATURATED`, [almide-dojo#3](https://github.com/almide/almide-dojo/issues/3)) | `pass` / `pass@N`, under a verdict banner |
| `not-run` | planned, and the model was never answered for it: an HTTP timeout, an empty completion, a missing credential. Not a failure and not a zero; `reason` says which | `not-run` |
| `harness-limitation` | not measurable in this configuration at all — the language's toolchain is not on the machine. Not a failure and not a zero | `n/t` |

A row with `not-run` cells prints its rate as an interval — `15/21 (71%–100%)`
— because the true rate is bounded below by "every absent cell would have
failed" and above by "every absent cell would have passed". A complete row's
interval collapses to a point, which is exactly when it is comparable with
another complete row.

**The run's verdict.** `manifest.verdict.id` and the first lines of `table.md`
carry one of:

- `comparable` — every language whose toolchain was present saw the same,
  complete task set, and the bank discriminated. This is the only verdict
  under which the table is a comparison.
- `inconclusive-saturated` — a valid comparison that separates nothing.
- `not-comparable` — the languages saw different task counts, so the rows
  share no denominator. **This run is not a comparison and must not be quoted
  as one.**
- `nothing-measured` — no cell reached the model.

`almide run src/msr/run.almd -- verdict <run-dir>` re-derives the verdict from
a written run's own artifacts (no model call, no key) and exits non-zero for
`not-comparable` / `nothing-measured`; it also refuses a manifest whose stamped
verdict its own results contradict. CI runs it on every cross-language run,
after publishing the table to the job summary, and a `not-comparable` run
fails the job — the results are still committed, carrying their own refusal,
because a refused run is evidence; it is just not a comparison.
`inconclusive-saturated` is a `::warning::` and not a failure: it is a true
statement about the task bank rather than a harness fault, it holds every week
until #1963 delivers a discriminating bank, and a gate that is red by design
on every run stops being read.

**The HTTP read timeout.** Both lanes set `ALMIDE_HTTP_TIMEOUT_SECS=140`
(derived in `.github/workflows/msr-cross.yml`, recorded per run in the
manifest). The compiler's default for this client is 30 s, and because the
transport is non-streaming that is a deadline on the *whole* completion, not
on the first byte — a reasoning model that writes a scratchpad before its
answer exceeds it routinely, and every cell it costs is a `not-run` that
shrinks the denominator.

Other entry points: `make msr-probe` (which languages this machine can
measure), `make msr-verify` (the reference solutions through every available
plugin, no model and no key — CI's gate; a language named in `LANGUAGES=`
whose toolchain is missing fails the gate rather than being skipped), and
narrower runs:
`make msr TASKS=gcd,fizzbuzz LANGUAGES=almide,rust LABEL=smoke`. A run
labelled `smoke` is for proving the pipeline; it is not a number.

**The task subset.** `msr/task-set.json` names the 21 bank tasks whose
functions are pure over `Int`, `Bool`, `String` and lists of those, with an
`assert_eq(call, literal)` oracle — the types every plugin language spells
one way, so nothing but syntax differs between languages. The other 17 bank
tasks are listed there with the reason each is out (`Option`/`Map`/`Result`
returns, function arguments, user-defined ADTs, and the Almide-only effect
tasks). The oracle cases are read from each task's own `tests.almd` — the
same cases the daily lane scores — and the behavior text is
`msr/specs/<task>.md`, the prompt's Behavior section without the Almide
stdlib notes. `scripts/check-task-set.sh` (CI) keeps every bank task decided
one way or the other, with a spec and a reference solution per language.

**What "same conditions" means here, exactly.** One system prompt per
language: `You are writing <Language>. Output ONLY source code, no fences or
prose.` followed by that language's notes — a sentence or two for the
mainstream languages, and for Almide the daily lane's full system prompt
(`src/prompts.almd`), so the two lanes ask for Almide identically. The
manifest records each language's `notes_bytes` and prompt hashes so the
asymmetry is visible — and it is a real one: Almide's notes are a stdlib
cheatsheet (~13 KB) where the others get ~120 bytes of file-shape rules,
because a model has read the others' documentation and not ours. One of its
lines names `string.run_length_encode`, which is one task in the set. Whether
that stays, shrinks, or is mirrored by a cheatsheet per language is the
maintainer's call before any number is published. No plugin runs an auto-fixer (`almide fix` is the daily
lane's convenience; here every language is judged on the model's file as
written) and no diagnostic hints are appended to the retry prompt. The retry
prompt is the same text for every language.

**The effect-declaration A/B (almide-dojo#2).** Every run carries it as a
second condition unless `--conditions shipped` (`make msr CONDITIONS=shipped`,
the workflow's `conditions` input) leaves it out:

| condition | languages | what changes |
|---|---|---|
| `shipped` (A) | every language | nothing — the cross-language grid itself |
| `unmentioned` (B) | Almide only | the Almide notes lose every sentence that teaches the effect discipline (`prompts.without_effect_notes`: the pure-calls-`effect fn` rule, the `effect fn`-only `while` form, and the `list.for_each` (effect fn) clause) |

Model, sampling (temperature, seed), user prompt, signatures, retry template
and budget, task set, oracle and the compiler are the same in both arms. B
runs task by task right after A's cell for the same task, so provider drift
lands on both arms; the other languages have no effect system to remove, so
the A/B costs one more Almide pass over the task set (~1/7 more calls on a
seven-language run). The manifest names every planned condition
(`conditions[]`, with the Almide prompt hashes each arm sent and the changed
lines verbatim) and the A/B's own verdict and arms (`effect_ab`); every cell in
`results.json` carries its `condition`; `table.md` puts the two arms side by
side, per task, under their own verdict. The B arm never enters the
cross-language verdict or rows.

What B is **not**: dojo#2's other arm, a compiler with effect enforcement
relaxed to warnings. The pinned release has no such switch, so both arms are
judged by the same enforcing compiler. And the cross-language task set is
pure (no task signature carries an effect annotation to strip), so this A/B
measures whether teaching the effect discipline changes how often a model's
code survives when the code needs no effects — the cost side of the effect
system. Whether effect declarations make *effectful* edits survive needs the
effect-bearing tasks (Almide-only) and that relaxed build, and stays open in
dojo#2.

## Task bank (31 tasks)

**Basic** (15 tasks, < 20 LOC) — single function, core language features:
`fizzbuzz`, `factorial`, `fibonacci`, `gcd`, `is-prime`, `is-palindrome`, `string-reverse`, `sum-digits`, `count-vowels`, `clamp`, `max-of-list`, `list-sum`, `title-case`, `repeat-string`, `remove-duplicates`

**Intermediate** (10 tasks, 20–80 LOC) — multiple functions, stdlib composition:
`caesar-cipher`, `roman-numeral`, `run-length-encoding`, `word-count`, `balanced-parens`, `anagram-check`, `binary-search`, `flatten-nested`, `partition-list`, `zip-with`

**Advanced** (6 tasks, > 80 LOC) — custom ADTs, pattern matching, error handling:
`expression-eval`, `custom-linked-list`, `result-pipeline`, `mini-json-query`, `matrix-ops`, `red-black-tree`

## The contract-preserving bank (`tasks/bank/`, 8 seed tasks)

The 31-task bank above saturates: every language scores 20/20 on it, so it no
longer discriminates. The second bank asks a model to **modify** an already-correct
program under a stated contract and scores the edit against a hidden oracle on
both targets — no partial credit, and a compiler refusal counts only when the
repair survives within the retry budget. Eight edit families, one seed each;
`scripts/check-bank.sh` refuses any task whose plausible wrong patch is not caught.
Spec: [docs/bank.md](./docs/bank.md). Run: `almide run src/main.almd -- bank <model>`.

**The `almide survive` A/B** ([almide/almide#2147](https://github.com/almide/almide/issues/2147)):
`bank <model> --conditions control,survive` (or `BANK_CONDITIONS`, or the Bank
Pilot's `conditions` input) re-asks every bank task with each proposed edit gated
by `almide survive` before it is applied, and writes
`runs/<date>/<model>/survive-ab[-<label>]/{manifest.json, table.md}` with both
arms' mean attempts per task and #2147's ≥ 20 % criterion. It needs a pinned
release that has `almide survive` and refuses otherwise; it never gates the
bank's own verdict. Definitions: [docs/bank.md](./docs/bank.md#the-almide-survive-ab).

## Current phase

**Phase 3** — 31-task bank with three difficulty tiers, harness searches across `basic/`, `intermediate/`, `advanced/` directories. Next: add GitHub Actions daily workflow, build the dashboards.

See [`docs/roadmap/active/almide-dojo.md`](https://github.com/almide/almide/blob/main/docs/roadmap/active/almide-dojo.md) in the main Almide repo for the full roadmap.

## License

MIT — see [LICENSE](./LICENSE).
