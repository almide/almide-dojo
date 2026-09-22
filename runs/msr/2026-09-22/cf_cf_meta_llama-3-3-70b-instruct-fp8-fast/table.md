# MSR cross-language run 2026-09-22 [pinned sampling, certified]

> **Verdict: `comparable` — every language saw the same complete task set, and the bank discriminated**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **planned tasks**: 21 (msr/task-set.json rev 2026-09-22.1) — every rate below has this as its denominator
- **retries**: 3
- **condition**: effects=shipped
- **manifest**: manifest.json next to this file (`verdict`, and the per-cell states in results.json)

| language | toolchain | reached | absent | final pass (of 21) | 1-shot (of 21) | retries |
|---|---|---|---|---|---|---|
| Almide | almide 0.62.0 | 21/21 | 0 | 19/21 (90%) | 12/21 (57%) | 16 |
| Rust | rustc 1.98.1 (48a229cea 2026-09-01) | 21/21 | 0 | 21/21 (100%) | 20/21 (95%) | 1 |
| Go | go version go1.27.1 linux/amd64 | 21/21 | 0 | 21/21 (100%) | 13/21 (61%) | 10 |
| TypeScript | Version 7.0.2; v22.23.2 | 21/21 | 0 | 21/21 (100%) | 21/21 (100%) | 0 |
| Zig | 0.16.0 | 21/21 | 0 | 13/21 (61%) | 5/21 (23%) | 36 |
| Gleam | gleam 1.18.1; v22.23.2 | 21/21 | 0 | 3/21 (14%) | 0/21 (0%) | 59 |
| MoonBit | moon 0.1.20260920 (914d7da 2026-09-20) | 21/21 | 0 | 8/21 (38%) | 7/21 (33%) | 41 |

## Per task

| task | Almide | Rust | Go | TypeScript | Zig | Gleam | MoonBit |
|---|---|---|---|---|---|---|---|
| `clamp` | pass | pass | pass | pass | pass | pass@1 | pass |
| `count-vowels` | pass | pass | pass@1 | pass | pass | FAIL | FAIL |
| `factorial` | pass | pass | pass | pass | pass | FAIL | pass |
| `fibonacci` | pass | pass | pass | pass | pass | FAIL | pass |
| `fizzbuzz` | pass@1 | pass | pass | pass | pass@2 | FAIL | FAIL |
| `gcd` | pass | pass | pass | pass | pass@1 | pass@1 | pass |
| `is-palindrome` | pass | pass | pass@1 | pass | pass@1 | pass@3 | FAIL |
| `is-prime` | pass@1 | pass | pass | pass | pass@1 | FAIL | pass |
| `list-sum` | pass | pass | pass | pass | pass | FAIL | pass |
| `remove-duplicates` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `repeat-string` | pass | pass | pass | pass | FAIL | FAIL | FAIL |
| `string-reverse` | pass | pass | pass@1 | pass | pass@2 | FAIL | FAIL |
| `sum-digits` | pass@2 | pass | pass | pass | FAIL | FAIL | pass |
| `title-case` | pass@1 | pass@1 | pass@2 | pass | pass@2 | FAIL | FAIL |
| `anagram-check` | pass@1 | pass | pass | pass | FAIL | FAIL | FAIL |
| `balanced-parens` | FAIL | pass | pass | pass | FAIL | FAIL | FAIL |
| `caesar-cipher` | pass | pass | pass | pass | FAIL | FAIL | FAIL |
| `flatten-nested` | pass | pass | pass@1 | pass | pass@1 | FAIL | FAIL |
| `roman-numeral` | pass@3 | pass | pass@1 | pass | FAIL | FAIL | pass@2 |
| `run-length-encoding` | FAIL | pass | pass@2 | pass | FAIL | FAIL | FAIL |
| `matrix-ops` | pass@1 | pass | pass | pass | pass@2 | FAIL | FAIL |

Cell states (almide/almide#1963): `pass` / `pass@N` / `FAIL` = `measured`; `not-run` = planned, but the model was never answered (see `reason` in results.json); `n/t` = `harness-limitation`, the toolchain is not on this machine. A rate printed as `a–b%` has `not-run` cells: the true rate is somewhere in that interval, and the row is not comparable with a complete one.
