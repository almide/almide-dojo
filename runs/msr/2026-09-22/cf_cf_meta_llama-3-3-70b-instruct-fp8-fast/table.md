# MSR cross-language run 2026-09-22

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 21 (msr/task-set.json rev 2026-09-22.1)
- **retries**: 3
- **condition**: effects=shipped
- **manifest**: manifest.json next to this file

| language | toolchain | tasks | final pass | 1-shot pass | retries |
|---|---|---|---|---|---|
| Almide | almide 0.62.0 | 21 | 18/21 (85%) | 11/21 | 20 |
| Rust | rustc 1.98.1 (48a229cea 2026-09-01) | 21 | 21/21 (100%) | 21/21 | 0 |
| Go | go version go1.27.1 linux/amd64 | 21 | 19/21 (90%) | 10/21 | 16 |
| TypeScript | Version 7.0.2; v22.23.2 | 21 | 21/21 (100%) | 21/21 | 0 |
| Zig | 0.16.0 | 21 | 12/21 (57%) | 5/21 | 39 |
| Gleam | gleam 1.18.1; v22.23.2 | 21 | 4/21 (19%) | 0/21 | 58 |
| MoonBit | moon 0.1.20260920 (914d7da 2026-09-20) | 21 | 10/21 (47%) | 5/21 | 43 |

## Per task

| task | Almide | Rust | Go | TypeScript | Zig | Gleam | MoonBit |
|---|---|---|---|---|---|---|---|
| `clamp` | pass | pass | pass | pass | pass | pass@1 | pass |
| `count-vowels` | pass | pass | pass@1 | pass | pass | FAIL | pass@3 |
| `factorial` | pass | pass | pass | pass | pass | FAIL | pass |
| `fibonacci` | pass | pass | pass@1 | pass | pass | FAIL | pass |
| `fizzbuzz` | pass@1 | pass | pass | pass | FAIL | FAIL | FAIL |
| `gcd` | pass | pass | pass | pass | pass@1 | pass@1 | pass |
| `is-palindrome` | pass | pass | pass@1 | pass | pass@1 | FAIL | pass@3 |
| `is-prime` | FAIL | pass | pass | pass | pass@1 | FAIL | FAIL |
| `list-sum` | pass | pass | pass | pass | pass | FAIL | pass |
| `remove-duplicates` | pass | pass | pass@1 | pass | pass@2 | FAIL | FAIL |
| `repeat-string` | pass | pass | pass | pass | FAIL | FAIL | FAIL |
| `string-reverse` | pass | pass | pass@1 | pass | pass@3 | pass@3 | FAIL |
| `sum-digits` | pass@1 | pass | pass | pass | FAIL | FAIL | FAIL |
| `title-case` | pass@1 | pass | pass | pass | pass@1 | FAIL | pass@1 |
| `anagram-check` | pass@1 | pass | pass@1 | pass | pass@3 | FAIL | FAIL |
| `balanced-parens` | FAIL | pass | pass@2 | pass | FAIL | FAIL | FAIL |
| `caesar-cipher` | pass@3 | pass | pass | pass | FAIL | FAIL | FAIL |
| `flatten-nested` | pass | pass | pass@1 | pass | FAIL | pass@2 | pass@2 |
| `roman-numeral` | FAIL | pass | pass@1 | pass | FAIL | FAIL | pass@1 |
| `run-length-encoding` | pass@2 | pass | FAIL | pass | FAIL | FAIL | FAIL |
| `matrix-ops` | pass@2 | pass | FAIL | pass | FAIL | FAIL | FAIL |

`pass@N` = passed after N retries; `n/m` = language not measured; `unreached` = the model was never called (harness error).
