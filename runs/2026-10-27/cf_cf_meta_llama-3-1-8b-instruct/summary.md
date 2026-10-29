# MSR run 2026-10-27

> **Verdict: `comparable` — every planned task reached the model, and the bank discriminated: this rate is a point**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **compiler**: `almide 0.65.0 (release, dbde826d1)`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 38 / 38
- **not-run**: 0
- **cells**: measured 38, inconclusive-saturated 0, not-run 0, harness-limitation 0
- **passed**: 14/38 (36%)
- **1-shot passes**: 13/38 (34%)
- **total retries**: 75

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | FAIL | compile-error | `E034` | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `bounded-total` | FAIL | unknown | — | 3 |
| `budget-units` | FAIL | runtime-error | — | 3 |
| `caesar-cipher` | FAIL | compile-error | `E030` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | FAIL | unknown | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E002` | 3 |
| `is-prime` | FAIL | import-error | `E004` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E012` | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | compile-error | `E034` | 3 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | compile-error | `E012` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | pass | pass-retry | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 13
- pass-retry: 1
- parse-error: 7
- type-error: 3
- name-error: 1
- import-error: 1
- compile-error: 5
- runtime-error: 1
- unknown: 6

## Retry distribution

- pass-0: 13
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 1
- fail-3: 24

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 2
- `E003`: 3
- `E004`: 1
- `E005`: 1
- `E012`: 3
- `E030`: 1
- `E034`: 2
