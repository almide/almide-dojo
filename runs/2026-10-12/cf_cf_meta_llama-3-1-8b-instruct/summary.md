# MSR run 2026-10-12

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
- **passed**: 17/38 (44%)
- **1-shot passes**: 13/38 (34%)
- **total retries**: 71

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `bounded-total` | FAIL | unknown | — | 3 |
| `budget-units` | FAIL | runtime-error | — | 3 |
| `caesar-cipher` | FAIL | compile-error | `E030` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | type-error | `E005` | 3 |
| `deadline-guard` | FAIL | unknown | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | unknown | — | 3 |
| `is-prime` | pass | pass-retry | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E012` | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | pass | pass-retry | — | 1 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | unknown | — | 3 |
| `race-strategies` | FAIL | compile-error | `E041` | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | unknown | — | 3 |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | pass | pass-retry | — | 3 |
| `word-count` | FAIL | name-error | `E003` | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 13
- pass-retry: 4
- parse-error: 5
- type-error: 3
- name-error: 2
- compile-error: 3
- runtime-error: 1
- unknown: 7

## Retry distribution

- pass-0: 13
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 2
- fail-3: 21

## Recoverable diagnostic codes (passed after retry)

- `E004`: 1
- `E029`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 3
- `E003`: 3
- `E005`: 1
- `E012`: 2
- `E030`: 1
- `E041`: 1
