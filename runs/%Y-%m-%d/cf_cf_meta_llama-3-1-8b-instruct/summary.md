# MSR run %Y-%m-%d

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 38
- **passed**: 12 / 38
- **1-shot passes**: 9 / 38
- **total retries**: 82

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | FAIL | name-error | `E003` | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 2 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E002` | 3 |
| `is-prime` | FAIL | import-error | `E004` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | FAIL | unknown | — | 3 |
| `race-cheapest` | FAIL | compile-error | `E0277` | 3 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `settle-health` | FAIL | name-error | `E003` | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | FAIL | type-error | `E005` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | compile-error | `E012` | 3 |

## By category

- pass-1shot: 9
- pass-retry: 3
- parse-error: 15
- type-error: 3
- name-error: 2
- import-error: 1
- compile-error: 2
- unknown: 3

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 26

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 5
- `E003`: 7
- `E004`: 1
- `E005`: 4
- `E012`: 1
- `E0277`: 1
