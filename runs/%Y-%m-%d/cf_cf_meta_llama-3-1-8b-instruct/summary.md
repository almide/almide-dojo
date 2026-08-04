# MSR run %Y-%m-%d

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 38
- **passed**: 11 / 38
- **1-shot passes**: 10 / 38
- **total retries**: 82

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-retry | — | 1 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | FAIL | compile-error | `E0308` | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | parse-error | — | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | compile-error | `E0277` | 3 |
| `race-strategies` | FAIL | name-error | `E003` | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `settle-health` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | type-error | `E002` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 10
- pass-retry: 1
- parse-error: 18
- type-error: 2
- name-error: 3
- compile-error: 2
- unknown: 2

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 27

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 6
- `E002`: 5
- `E003`: 7
- `E005`: 2
- `E010`: 1
- `E0277`: 1
- `E0308`: 1
