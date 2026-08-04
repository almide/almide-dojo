# MSR run %Y-%m-%d

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 38
- **passed**: 21 / 38
- **1-shot passes**: 15 / 38
- **total retries**: 57

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `any-candidates` | FAIL | compile-error | `E0277` | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | unknown | — | 3 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | name-error | `E003` | 3 |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | FAIL | name-error | `E003` | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-retry | — | 1 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | type-error | `E005` | 3 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | type-error | `E001` | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `settle-health` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-retry | — | 1 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 15
- pass-retry: 6
- parse-error: 7
- type-error: 5
- name-error: 2
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 15
- fail-0: 0
- pass-1: 6
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 17

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E003`: 1
- `E004`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 2
- `E003`: 5
- `E005`: 3
- `E0277`: 1
