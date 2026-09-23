# MSR cross-language run 2026-09-22 [pinned sampling, certified]

> **Verdict: `comparable` — every language saw the same complete task set, and the bank discriminated**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **planned tasks**: 21 (msr/task-set.json rev 2026-09-22.1) — every rate below has this as its denominator
- **retries**: 3
- **condition**: effects=shipped
- **manifest**: manifest.json next to this file (`verdict`, and the per-cell states in results.json)

| language | toolchain | reached | absent | final pass (of 21) | 1-shot (of 21) | retries |
|---|---|---|---|---|---|---|
| Almide | almide 0.62.0 | 21/21 | 0 | 11/21 (52%) | 10/21 (47%) | 32 |
| Rust | rustc 1.98.1 (48a229cea 2026-09-01) | 21/21 | 0 | 17/21 (80%) | 15/21 (71%) | 14 |
| Go | go version go1.27.1 linux/amd64 | 21/21 | 0 | 16/21 (76%) | 3/21 (14%) | 29 |
| TypeScript | Version 7.0.2; v22.23.2 | 21/21 | 0 | 19/21 (90%) | 17/21 (80%) | 8 |
| Zig | 0.16.0 | 21/21 | 0 | 5/21 (23%) | 5/21 (23%) | 48 |
| Gleam | gleam 1.18.1; v22.23.2 | 21/21 | 0 | 5/21 (23%) | 0/21 (0%) | 57 |
| MoonBit | moon 0.1.20260920 (914d7da 2026-09-20) | 21/21 | 0 | 1/21 (4%) | 1/21 (4%) | 60 |

## Per task

| task | Almide | Rust | Go | TypeScript | Zig | Gleam | MoonBit |
|---|---|---|---|---|---|---|---|
| `clamp` | pass | pass | pass@1 | pass | pass | pass@1 | FAIL |
| `count-vowels` | pass@2 | pass | pass | pass | pass | FAIL | FAIL |
| `factorial` | pass | pass | pass@1 | pass | pass | pass@2 | pass |
| `fibonacci` | pass | pass | pass@1 | pass | pass | pass@2 | FAIL |
| `fizzbuzz` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `gcd` | pass | pass | pass@1 | pass | FAIL | pass@2 | FAIL |
| `is-palindrome` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `is-prime` | FAIL | pass | pass@1 | pass@1 | FAIL | FAIL | FAIL |
| `list-sum` | pass | pass | pass@1 | pass | pass | FAIL | FAIL |
| `remove-duplicates` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `repeat-string` | pass | pass | pass@1 | pass | FAIL | pass@2 | FAIL |
| `string-reverse` | FAIL | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `sum-digits` | FAIL | pass | FAIL | pass | FAIL | FAIL | FAIL |
| `title-case` | FAIL | FAIL | FAIL | pass | FAIL | FAIL | FAIL |
| `anagram-check` | FAIL | pass | FAIL | pass | FAIL | FAIL | FAIL |
| `balanced-parens` | FAIL | FAIL | pass | FAIL | FAIL | FAIL | FAIL |
| `caesar-cipher` | FAIL | FAIL | pass@2 | pass | FAIL | FAIL | FAIL |
| `flatten-nested` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `roman-numeral` | FAIL | pass@1 | FAIL | FAIL | FAIL | FAIL | FAIL |
| `run-length-encoding` | FAIL | FAIL | FAIL | pass | FAIL | FAIL | FAIL |
| `matrix-ops` | FAIL | pass@1 | pass | pass@1 | FAIL | FAIL | FAIL |

Cell states (almide/almide#1963): `pass` / `pass@N` / `FAIL` = `measured`; `not-run` = planned, but the model was never answered (see `reason` in results.json); `n/t` = `harness-limitation`, the toolchain is not on this machine. A rate printed as `a–b%` has `not-run` cells: the true rate is somewhere in that interval, and the row is not comparable with a complete one.
