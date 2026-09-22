# MSR cross-language run 2026-09-22 [glm full]

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **tasks**: 21 (msr/task-set.json rev 2026-09-22.1)
- **retries**: 3
- **condition**: effects=shipped
- **manifest**: manifest.json next to this file

| language | toolchain | tasks | final pass | 1-shot pass | retries |
|---|---|---|---|---|---|
| Almide | almide 0.62.0 | 15 | 15/15 (100%) (6 task(s) never reached the model) | 15/15 | 0 |
| Rust | rustc 1.98.1 (48a229cea 2026-09-01) | 21 | 21/21 (100%) | 21/21 | 0 |
| Go | go version go1.27.1 linux/amd64 | 20 | 20/20 (100%) (1 task(s) never reached the model) | 20/20 | 0 |
| TypeScript | Version 7.0.2; v22.23.2 | 21 | 21/21 (100%) | 21/21 | 0 |
| Zig | 0.16.0 | 19 | 19/19 (100%) (2 task(s) never reached the model) | 18/19 | 2 |
| Gleam | gleam 1.18.1; v22.23.2 | 20 | 20/20 (100%) (1 task(s) never reached the model) | 18/20 | 2 |
| MoonBit | moon 0.1.20260920 (914d7da 2026-09-20) | 17 | 17/17 (100%) (4 task(s) never reached the model) | 16/17 | 1 |

## Per task

| task | Almide | Rust | Go | TypeScript | Zig | Gleam | MoonBit |
|---|---|---|---|---|---|---|---|
| `clamp` | pass | pass | pass | pass | pass | pass | pass |
| `count-vowels` | pass | pass | pass | pass | pass | pass@1 | pass@1 |
| `factorial` | pass | pass | pass | pass | pass | pass | pass |
| `fibonacci` | pass | pass | pass | pass | pass | pass | pass |
| `fizzbuzz` | pass | pass | pass | pass | pass | pass | pass |
| `gcd` | pass | pass | pass | pass | pass | pass | pass |
| `is-palindrome` | pass | pass | pass | pass | pass | pass | pass |
| `is-prime` | unreached | pass | pass | pass | pass@2 | pass | pass |
| `list-sum` | pass | pass | pass | pass | pass | pass | pass |
| `remove-duplicates` | pass | pass | pass | pass | pass | pass | pass |
| `repeat-string` | pass | pass | pass | pass | pass | pass | pass |
| `string-reverse` | pass | pass | pass | pass | pass | pass | unreached |
| `sum-digits` | pass | pass | pass | pass | pass | pass | pass |
| `title-case` | pass | pass | pass | pass | pass | pass | unreached |
| `anagram-check` | pass | pass | pass | pass | pass | pass | unreached |
| `balanced-parens` | unreached | pass | pass | pass | pass | pass | pass |
| `caesar-cipher` | unreached | pass | pass | pass | pass | unreached | pass |
| `flatten-nested` | pass | pass | pass | pass | pass | pass | pass |
| `roman-numeral` | unreached | pass | pass | pass | pass | pass | pass |
| `run-length-encoding` | unreached | pass | unreached | pass | unreached | pass@1 | unreached |
| `matrix-ops` | unreached | pass | pass | pass | unreached | pass | pass |

`pass@N` = passed after N retries; `n/m` = language not measured; `unreached` = the model was never called (harness error).
