# MSR cross-language run 2026-09-22

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 21 (msr/task-set.json rev 2026-09-22.1)
- **retries**: 3
- **condition**: effects=shipped
- **manifest**: manifest.json next to this file

| language | toolchain | tasks | final pass | 1-shot pass | retries |
|---|---|---|---|---|---|
| Almide | almide 0.62.0 | 21 | 10/21 (47%) | 7/21 | 39 |
| Rust | rustc 1.98.1 (48a229cea 2026-09-01) | 21 | 16/21 (76%) | 14/21 | 17 |
| Go | go version go1.27.1 linux/amd64 | 21 | 15/21 (71%) | 2/21 | 34 |
| TypeScript | Version 7.0.2; v22.23.2 | 21 | 17/21 (80%) | 16/21 | 13 |
| Zig | 0.16.0 | 21 | 7/21 (33%) | 5/21 | 46 |
| Gleam | gleam 1.18.1; v22.23.2 | 21 | 4/21 (19%) | 0/21 | 58 |
| MoonBit | moon 0.1.20260920 (914d7da 2026-09-20) | 21 | 1/21 (4%) | 1/21 | 60 |

## Per task

| task | Almide | Rust | Go | TypeScript | Zig | Gleam | MoonBit |
|---|---|---|---|---|---|---|---|
| `clamp` | pass | pass | pass@1 | pass | pass | pass@1 | FAIL |
| `count-vowels` | pass@3 | pass | pass@1 | pass | pass | FAIL | FAIL |
| `factorial` | pass | pass | pass@1 | pass | pass | pass@2 | pass |
| `fibonacci` | pass | pass | pass@1 | pass | pass | pass@2 | FAIL |
| `fizzbuzz` | pass@2 | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `gcd` | pass | pass | pass@1 | pass | FAIL | pass@2 | FAIL |
| `is-palindrome` | FAIL | pass | pass@1 | pass | pass@3 | FAIL | FAIL |
| `is-prime` | FAIL | pass | pass | FAIL | FAIL | FAIL | FAIL |
| `list-sum` | FAIL | pass | pass@1 | pass | pass | FAIL | FAIL |
| `remove-duplicates` | pass | pass@1 | FAIL | pass | FAIL | FAIL | FAIL |
| `repeat-string` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `string-reverse` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `sum-digits` | FAIL | pass | pass@2 | pass@1 | FAIL | FAIL | FAIL |
| `title-case` | FAIL | FAIL | FAIL | pass | FAIL | FAIL | FAIL |
| `anagram-check` | FAIL | pass | FAIL | pass | FAIL | FAIL | FAIL |
| `balanced-parens` | FAIL | FAIL | pass | FAIL | pass@1 | FAIL | FAIL |
| `caesar-cipher` | FAIL | FAIL | pass@3 | pass | FAIL | FAIL | FAIL |
| `flatten-nested` | pass@1 | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `roman-numeral` | FAIL | pass@1 | FAIL | pass | FAIL | FAIL | FAIL |
| `run-length-encoding` | FAIL | FAIL | FAIL | FAIL | FAIL | FAIL | FAIL |
| `matrix-ops` | FAIL | FAIL | FAIL | FAIL | FAIL | FAIL | FAIL |

`pass@N` = passed after N retries; `n/m` = language not measured; `unreached` = the model was never called (harness error).
