# 2026-08-02 — async task bank, first MSR round (claim-5 material)

First measurement of the fan v2 / deterministic-time task bank (6 tasks added
in 09fb90d) against the `worktree-stage1-charge-probe` compiler build, provider
`cli:claude` (Claude Code CLI, no API key). Retry cap 3.

## Result: 6/6 pass (MSR-with-retry 100%, first-attempt 2/6)

| Task | Tier | Pass | Retries | Notes |
|---|---|---|---|---|
| bounded-total | basic | ✓ | 0 | |
| settle-health | intermediate | ✓ | 0 | |
| deadline-guard | basic | ✓ | 1 | |
| any-candidates | intermediate | ✓ | 1 | |
| race-strategies | intermediate | ✓ | 2 | passed after MH-003 fix |
| budget-units | basic | ✓ | 3 | passed after MH-003/004/005 + 2 compiler-bug fixes |

## The dogfood loop paid for itself — findings fed back into the compiler

The two initially-failing tasks were **not** model weaknesses; every failure
traced to a diagnostic gap or a real compiler bug, each fixed in
`almide/almide` between rounds:

1. **MH-003** — the pre-Wave-1 thunk spelling `fan.bounded(b, () => w)` parsed
   into a misleading `Missing ')'`; now a dedicated migration hint. race-strategies
   passed immediately after.
2. **MH-005** — `import compute` said "Create compute.almd"; now
   "'compute' is auto-available — Remove the import line" (also `duration`, `fan`).
3. **MH-004** — unwrap-family over an already-auto-`?`-propagated value got a
   generic E005; now "nothing to unwrap … apply `?? <default>` to the producing call".
4. **Checker hole** (almide fb095282) — `match r { some(v) => …, _ => … }` over a
   plain Int subject sailed through the checker to a backend wall; now a typed
   error naming auto-`?` and pointing at `??`.
5. **Codegen bug** (almide 3078f557) — a **let-bound** budget
   (`let b = compute.ms(ms); fan.bounded(b) { … }`) failed wasm validation
   (time-type tag reached MIR layout as a heap pointer). The winning attempt-4
   solution compiles *only because of this fix*. The same dig opened the
   metered-effect-fn call path on the native leg (5 bricks, `wasm_runtime_test`
   75/75 three-way corpus green).

Round-4 convergence trace for budget-units: import hints fired (attempts 1–2) →
thunk hint fired (attempt 2) → scalar-subject pattern errors fired (attempt 3) →
canonical `fan.bounded(budget) { count_to(n) } ?? -1` (attempt 4, PASS).

## Harness fix

`datetime.format(ts, "YYYY-MM-DD")` passed unknown tokens through literally —
reports landed in a literal `runs/YYYY-MM-DD/` directory. Pattern corrected to
`%Y-%m-%d` (strftime vocabulary); prior reports moved here.
