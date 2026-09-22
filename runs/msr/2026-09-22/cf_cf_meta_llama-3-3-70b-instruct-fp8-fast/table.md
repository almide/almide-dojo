# MSR cross-language run 2026-09-22 [smoke]

> **Verdict: `inconclusive-saturated` — a valid comparison that separates nothing: do not quote this table as evidence**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **no**
> - every language reached 98% or better of the cells it measured, so no cell separates one language from another and the table is not evidence of anything about the languages (INCONCLUSIVE_BANK_SATURATED, almide-dojo#3 / almide/almide#1963 — the bank is at its ceiling; rebuilding it is that issue's work, saying so is this one's)

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **planned tasks**: 1 (msr/task-set.json rev 2026-09-22.1) — every rate below has this as its denominator
- **retries**: 3
- **condition**: effects=shipped
- **manifest**: manifest.json next to this file (`verdict`, and the per-cell states in results.json)

| language | toolchain | reached | absent | final pass (of 1) | 1-shot (of 1) | retries |
|---|---|---|---|---|---|---|
| Almide | almide 0.62.0 | 1/1 | 0 | 1/1 (100%) | 1/1 (100%) | 0 |
| Rust | rustc 1.98.1 (48a229cea 2026-09-01) | 1/1 | 0 | 1/1 (100%) | 1/1 (100%) | 0 |

## Per task

| task | Almide | Rust |
|---|---|---|
| `gcd` | pass | pass |

Cell states (almide/almide#1963): `pass` / `pass@N` / `FAIL` = `inconclusive-saturated` (every measured cell in this run passed, so no cell discriminates); `not-run` = planned, but the model was never answered (see `reason` in results.json); `n/t` = `harness-limitation`, the toolchain is not on this machine. A rate printed as `a–b%` has `not-run` cells: the true rate is somewhere in that interval, and the row is not comparable with a complete one.
