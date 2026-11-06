# MSR cross-language run 2026-11-06

> **Verdict: `comparable` — every language saw the same complete task set, and the bank discriminated**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **planned tasks**: 21 (msr/task-set.json rev 2026-09-22.1) — every rate below has this as its denominator
- **retries**: 3
- **conditions**: `shipped` (every language), `unmentioned` (Almide only — the effect-declaration A/B below)
- **manifest**: manifest.json next to this file (`verdict`, and the per-cell states in results.json)

| language | toolchain | reached | absent | final pass (of 21) | 1-shot (of 21) | retries |
|---|---|---|---|---|---|---|
| Almide | almide 0.69.0 (release, 39f128a2d) | 21/21 | 0 | 17/21 (80%) | 11/21 (52%) | 19 |
| Rust | rustc 1.99.1 (58cf8f9c3 2026-10-13) | 21/21 | 0 | 20/21 (95%) | 20/21 (95%) | 3 |
| Go | go version go1.27.3 linux/amd64 | 21/21 | 0 | 21/21 (100%) | 13/21 (61%) | 10 |
| TypeScript | Version 7.0.2; v24.22.2 | 21/21 | 0 | 21/21 (100%) | 21/21 (100%) | 0 |
| Zig | 0.16.0 | 21/21 | 0 | 12/21 (57%) | 5/21 (23%) | 38 |
| Gleam | gleam 1.18.1; v24.22.2 | 21/21 | 0 | 4/21 (19%) | 0/21 (0%) | 59 |
| MoonBit | moon 0.1.20261102 (ea07287 2026-11-02) | 21/21 | 0 | 11/21 (52%) | 8/21 (38%) | 34 |

## Per task

| task | Almide | Rust | Go | TypeScript | Zig | Gleam | MoonBit |
|---|---|---|---|---|---|---|---|
| `clamp` | pass | pass | pass | pass | pass | pass@1 | pass |
| `count-vowels` | pass | pass | pass@1 | pass | pass | FAIL | pass |
| `factorial` | pass | pass | pass | pass | pass | FAIL | pass |
| `fibonacci` | pass | pass | pass | pass | pass | FAIL | pass |
| `fizzbuzz` | pass@1 | pass | pass | pass | pass@2 | FAIL | FAIL |
| `gcd` | pass | pass | pass | pass | pass@1 | pass@1 | pass |
| `is-palindrome` | pass | pass | pass@1 | pass | pass@2 | pass@3 | pass |
| `is-prime` | pass@1 | pass | pass | pass | pass@1 | FAIL | pass@1 |
| `list-sum` | pass | pass | pass | pass | pass | FAIL | pass |
| `remove-duplicates` | pass | pass | pass@1 | pass | FAIL | FAIL | FAIL |
| `repeat-string` | pass | pass | pass | pass | FAIL | pass@3 | FAIL |
| `string-reverse` | pass | pass | pass@1 | pass | pass@2 | FAIL | FAIL |
| `sum-digits` | pass@2 | pass | pass | pass | FAIL | FAIL | pass |
| `title-case` | pass@1 | FAIL | pass@2 | pass | pass@2 | FAIL | FAIL |
| `anagram-check` | pass@1 | pass | pass | pass | FAIL | FAIL | FAIL |
| `balanced-parens` | FAIL | pass | pass | pass | FAIL | FAIL | FAIL |
| `caesar-cipher` | FAIL | pass | pass | pass | FAIL | FAIL | FAIL |
| `flatten-nested` | pass | pass | pass@1 | pass | FAIL | FAIL | pass@2 |
| `roman-numeral` | FAIL | pass | pass@1 | pass | FAIL | FAIL | pass@1 |
| `run-length-encoding` | FAIL | pass | pass@2 | pass | FAIL | FAIL | FAIL |
| `matrix-ops` | pass@1 | pass | pass | pass | pass@1 | FAIL | FAIL |

Cell states (almide/almide#1963): `pass` / `pass@N` / `FAIL` = `measured`; `not-run` = planned, but the model was never answered (see `reason` in results.json); `n/t` = `harness-limitation`, the toolchain is not on this machine. A rate printed as `a–b%` has `not-run` cells: the true rate is somewhere in that interval, and the row is not comparable with a complete one.

## Effect-declaration A/B (almide-dojo#2) — Almide only

> **A/B verdict: `comparable`** — certified as a comparison: **yes**; the bank discriminated: **yes**

Arm A is the Almide row above (the same cells). Arm B re-asks the same 21 tasks with the only change being the Almide notes; the pinned compiler still enforces effects in both arms, and the other languages have no effect system to remove.

| arm | what the model is told | reached | final pass (of 21) | 1-shot (of 21) | retries |
|---|---|---|---|---|---|
| Almide · `shipped` | the Almide notes as every run sends them, which teach the effect discipline | 21/21 | 17/21 (80%) | 11/21 (52%) | 19 |
| Almide · `unmentioned` | the same notes with every effect sentence removed (prompts.without_effect_notes); signatures, user prompt, retry prompt, model, sampling and the compiler unchanged | 21/21 | 18/21 (85%) | 11/21 (52%) | 20 |

| task | `shipped` | `unmentioned` |
|---|---|---|
| `clamp` | pass | pass |
| `count-vowels` | pass | pass |
| `factorial` | pass | pass |
| `fibonacci` | pass | pass |
| `fizzbuzz` | pass@1 | pass@1 |
| `gcd` | pass | pass |
| `is-palindrome` | pass | pass |
| `is-prime` | pass@1 | pass@1 |
| `list-sum` | pass | pass |
| `remove-duplicates` | pass | pass |
| `repeat-string` | pass | pass |
| `string-reverse` | pass | pass |
| `sum-digits` | pass@2 | pass@2 |
| `title-case` | pass@1 | pass@2 |
| `anagram-check` | pass@1 | pass@1 |
| `balanced-parens` | FAIL | FAIL |
| `caesar-cipher` | FAIL | pass@3 |
| `flatten-nested` | pass | pass |
| `roman-numeral` | FAIL | FAIL |
| `run-length-encoding` | FAIL | FAIL |
| `matrix-ops` | pass@1 | pass@1 |
