# The contract-preserving modification bank

The classic Dojo bank asks a model to WRITE a program from a prompt. It saturated:
every language scores 20/20 on it, so it cannot tell Almide apart from anything
(almide/almide#1963). This bank asks a model to MODIFY an already-correct program
under a contract it can read but cannot weaken, and scores the edit against an
oracle it never sees. It is the measurement leg of the contract-relative survival
arc (almide/almide#1998); the language-side legs are the declaration /
refusal / challenge links in the compiler's contract ledger (almide/almide#1994)
and the `scoped` ownership contract (almide/almide#1997).

## What survival means here

For a task `t = (baseline, requested change Δ, protected observations F, visible
suite V)` and an edit `e`, the edit SURVIVES when every conjunct holds:

```text
S = compiles ∧ passes V ∧ implements Δ (hidden) ∧ preserves F (hidden) ∧ native == wasm
```

No partial credit: compiling is not survival, passing the happy path is not
survival, and a compiler refusal is not survival — it becomes useful only when
the repair survives within the retry budget. This is the point of the bank:

```text
1 = Pr(survive) + Pr(reject) + Pr(accept but violate)
```

Moving an edit from the third term to the second does not raise the score.
Only a successful repair does, so diagnostic quality is on the critical path and
is reported separately (refusal-to-repair rate) rather than credited.

## Task anatomy

```text
tasks/bank/<family>/<name>/
  baseline.almd   the program the model is asked to edit — correct BEFORE the edit
  prompt.md       the requested change, and the Preserve section (the contract)
  tests.almd      the visible suite: the requirement in its minimal form
  hidden.almd     the oracle: adversarial inputs + untouched behaviour; NEVER shown
  solution.almd   a reference patch (a correct edit must exist)
  wrong.almd      a plausible wrong patch: compiles, passes tests.almd, fails hidden.almd
  meta.toml       kind = "modify", family = "dojo:<slug>", contracts, resource_oracle
```

The model receives `prompt.md` followed by `baseline.almd` as "Current program",
and returns the whole file. Hidden tests conceal INPUTS and combinations, never
requirements: everything the oracle checks is stated in words under Preserve.

`scripts/check-bank.sh` keeps every task honest, with a real compile per leg:

| check | proves |
|---|---|
| baseline + tests FAILS | the edit is required; "do nothing" cannot score |
| solution + tests and solution + hidden PASS | a correct edit exists |
| wrong + tests PASSES | the wrong patch is plausible: it fools the visible suite |
| wrong + hidden FAILS | the bank discriminates |
| solution on `--target wasm` PASSES | cross-target agreement is scorable |
| family slug = directory = a row of `bank/families.txt` | the family exists on both sides |
| no two baselines of a family are near-duplicates (`scripts/bank_dedup.almd`) | each task is an independent cluster, not a renaming |

The near-duplicate check reduces every `baseline.almd` to its token shape
(identifiers → `ID`, numbers → `NUM`, strings → `STR`; keywords, types and
stdlib calls kept) and refuses a same-family pair whose token 6-gram Jaccard
similarity reaches the calibrated threshold (60%; the seeds top out at 26%, a
renamed copy scores 94%). It always runs over the whole bank.

While authoring, check one task in seconds:
`bash scripts/check-bank.sh tasks/bank/<family>/<name>` (several task or family
dirs may be named), or `BANK_ONLY=<family>/<name>,<family> bash scripts/check-bank.sh`.

`bank/families.txt` is the pinned copy of the compiler repo's
`scripts/lib/dojo-families.txt`; the compiler's contract ledger names a family in
a contract's `challenge` array, and this file is what that link resolves to.

## The eight families

| family | requested edit (seed) | protected observation |
|---|---|---|
| `fallible-producer` | reject a new invalid input mid-list | exact old messages, first-error order, explicit propagation |
| `early-recovery` | recover one error kind, propagate the rest | recovery by kind not position; other errors keep their text |
| `representation-change` | a scalar field becomes a domain value | rendering for every sign, ordering, tie rule at every old caller |
| `port-evolution` | a second adapter selected at runtime | old adapter and generic caller unchanged; a miss stays a miss |
| `scope-escape` | summarize a temporary tree | no tree storage survives the call (resource) |
| `callback-retention` | a deferred report | the closure captures the summary, not the input (resource) |
| `nested-scopes` | a batch of temporary analyses | inner cleanup keeps outer data; repeats do not accumulate (resource) |
| `helper-extraction` | extract a helper | a pure refactor: no new accepted or rejected inputs (+ allocation routing, resource) |

Four families protect a RESOURCE observation. The resource oracle
(`scripts/resource-oracle.sh`, almide-dojo#5) is the third oracle beside
behaviour and cross-target:

- A resource task ships `probe.almd`, an `effect fn main` that drives the
  task's boundary `__K__` times and keeps every result live, and
  `wrong_resource.almd`, a plausible patch that passes the visible tests AND the
  hidden oracle and differs only in what it keeps or allocates.
- The probe is appended to the program and run at two scales
  (`resource_scales`) on both targets with the compiler's allocation counters
  armed (`ALMIDE_ALLOC_COUNT` native, `ALMIDE_WASM_ALLOC_COUNT` wasm). The
  metric is `peak` (native peak / wasm `heap_end`: live storage) or `allocs`
  (allocation count: routing).
- Bound: `candidate_growth <= reference_growth * resource_factor_pct / 100 +
  resource_slack` on every target, the reference being the task's own
  `solution.almd` measured by the same compiler in the same run — growth, not
  level, so the probe's fixed costs cancel; the reference, not a pinned number,
  so a compiler change moves both sides. This is almide-dojo#5's
  `live_payload <= A * largest_batch + B` form. It is an allocator figure, not
  RSS, and the counter lines never reach the behaviour oracle.
- A violation is scored like a silent violation: the model is told only that a
  resource listed under Preserve changed, and may repair within the budget.
- A compiler that prints no counter line cannot judge a resource task: those
  cells are `harness-limitation` (not asked, not scored) and the run is
  `not-comparable`. The gate reports the resource leg off;
  `BANK_REQUIRE_RESOURCE=1` makes that an error.

| family | metric | `wrong_resource.almd` |
|---|---|---|
| `callback-retention` | peak | the closure computes the summary when it runs, so it captures `xs` |
| `nested-scopes` | peak | every group sorted up front, all sorted copies live at once |
| `helper-extraction` | allocs | the helper trims the line first (`int.parse` already accepts the whitespace) |
| `scope-escape` | — | `pending` (below) |

`scope-escape` stays `resource_oracle = "pending"`. Its observation is
outstanding ownership AT the `diagnose` return, and `diagnose -> String` makes
a model-side escape unrepresentable; what is left to observe is the compiler
honouring the boundary, which needs a per-boundary read of the live set on a
side channel — almide/almide#2581. The process-end totals above cannot express
it.

Every family also needs positive counterexamples to over-restriction (repeated
reads inside a scope, legitimate long-lived outputs created outside it). A
checker that rejects everything must score badly; that is what the visible
suite plus `solution.almd` enforce.

## Scoring a run

`almide run src/main.almd -- bank <model>` runs every bank task through the
ordinary fix loop (budget: `DEFAULT_MAX_RETRIES`) and writes
`runs/<date>/<model>/bank-summary.md` with, on top of the classic table:

- **survived**: the conjunction above, per task.
- **silent violations (final / any attempt)**: compiled, visible-green,
  hidden-red. The model is told only that the hidden oracle rejected the change
  and to re-read Preserve; the oracle's detail never reaches it or the report.
- **target divergences**: native and wasm disagree. A compiler finding: the
  attempt is scored as failed and NOT retried, so a "repair" that happens to
  dodge a compiler bug cannot be scored as writability.

Report first-attempt survival and the budget curve separately. Two execution
modes are planned: independent edits (each from the reviewed predecessor) and
accumulating edits (prefix survival, a failed prefix counts as failed at every
later horizon).

## Controls

| configuration | measures |
|---|---|
| Almide with declarations and checks | the full design |
| Almide with the declarations erased, requirements in prose | the value of the declaration |
| the same with terse diagnostics | the repair contribution of diagnostic quality |
| other languages, reviewed idiomatic implementations | whether the advantage survives beyond an Almide ablation |

Compiler mutants (drop a release, exempt module functions, skip cleanup on `!`)
live in a companion lane in the compiler repo. They validate the compiler and are
not samples of this bank.

## Saturation and scale

If every compared language reaches at least 98% on the stratum a comparative
claim is made for, the run returns `INCONCLUSIVE_BANK_SATURATED`: the bank is
valid as a regression suite and invalid as ranking evidence. Freeze difficulty on
a separate calibration set; reserve hidden tasks; never tune hidden tasks after
seeing a ranking. A strengthened bank is a new version — it cannot retroactively
improve an old score, and existing tasks are never edited (Dojo rule).

| | pilot | published comparison |
|---|---|---|
| independent task clusters | 400 | 800 |
| model families | 3 | 4 |
| repetitions per task × model × language | 3 | 3 |

800 is the planning size for a 10-point paired difference at roughly 80% power
under the worst-case variance bound. Renamings, seeds and repeated edits to one
baseline do not add independent clusters. Four model families do not establish
anything about all present or future models; report each family separately.

## Status

Seeded 2026-09-07 with one task per family (8), gate green on both targets.
The pilot floor is 400 clusters; the seeds fix the format and the gate, not the
number.
