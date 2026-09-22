# MSR run 2026-09-22

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **compiler**: `almide 0.62.0`
- **tasks**: 38
- **passed**: 26 / 38
- **1-shot passes**: 17 / 38
- **total retries**: 53

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-retry | — | 3 |
| `bounded-total` | FAIL | unknown | — | 3 |
| `budget-units` | FAIL | unknown | — | 3 |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | FAIL | unknown | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | unknown | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E013` | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | unknown | — | 3 |
| `race-strategies` | FAIL | unknown | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 2 |
| `roman-numeral` | pass | pass-retry | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `settle-health` | pass | pass-retry | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 17
- pass-retry: 9
- parse-error: 4
- type-error: 1
- compile-error: 1
- unknown: 6

## Retry distribution

- pass-0: 17
- fail-0: 0
- pass-1: 4
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 3
- fail-3: 12

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1
- `E003`: 4
- `E004`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 1
- `E003`: 1
- `E005`: 1
- `E013`: 1
