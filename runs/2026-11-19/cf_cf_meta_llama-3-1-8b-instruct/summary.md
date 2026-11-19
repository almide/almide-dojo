# MSR run 2026-11-19

> **Verdict: `comparable` — every planned task reached the model, and the bank discriminated: this rate is a point**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **compiler**: `almide 0.69.0 (release, 39f128a2d)`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 38 / 38
- **not-run**: 0
- **cells**: measured 38, inconclusive-saturated 0, not-run 0, harness-limitation 0
- **passed**: 17/38 (44%)
- **1-shot passes**: 13/38 (34%)
- **total retries**: 68

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | pass | pass-retry | — | 2 |
| `balanced-parens` | FAIL | compile-error | `E032` | 3 |
| `binary-search` | FAIL | compile-error | `E0308` | 3 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | type-error | `E005` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | pass | pass-1shot | — | 0 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | compile-error | `E037` | 3 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | type-error | `E005` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | FAIL | unknown | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | compile-error | `E046` | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- pass-1shot: 13
- pass-retry: 4
- parse-error: 10
- type-error: 3
- compile-error: 4
- unknown: 4

## Retry distribution

- pass-0: 13
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 21

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E027`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 1
- `E003`: 1
- `E004`: 1
- `E005`: 2
- `E012`: 1
- `E0308`: 1
- `E032`: 1
- `E037`: 1
- `E046`: 1
