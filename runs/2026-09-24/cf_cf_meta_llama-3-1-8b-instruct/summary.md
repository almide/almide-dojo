# MSR run 2026-09-24

> **Verdict: `comparable` — every planned task reached the model, and the bank discriminated: this rate is a point**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **compiler**: `almide 0.62.0`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 38 / 38
- **not-run**: 0
- **cells**: measured 38, inconclusive-saturated 0, not-run 0, harness-limitation 0
- **passed**: 16/38 (42%)
- **1-shot passes**: 14/38 (36%)
- **total retries**: 70

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `bounded-total` | FAIL | compile-error | `E012` | 3 |
| `budget-units` | FAIL | name-error | `E003` | 3 |
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
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | import-error | `E004` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E001` | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | FAIL | type-error | `E005` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | unknown | — | 3 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | pass | pass-retry | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | type-error | `E001` | 3 |

## By category

- pass-1shot: 14
- pass-retry: 2
- parse-error: 8
- type-error: 4
- name-error: 1
- import-error: 1
- compile-error: 2
- unknown: 6

## Retry distribution

- pass-0: 14
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 1
- fail-3: 22

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 2
- `E003`: 5
- `E004`: 1
- `E005`: 1
- `E012`: 1
- `E030`: 1
