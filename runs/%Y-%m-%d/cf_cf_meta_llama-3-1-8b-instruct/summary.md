# MSR run %Y-%m-%d

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 38
- **passed**: 16 / 38
- **1-shot passes**: 10 / 38
- **total retries**: 76

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | FAIL | type-error | `E001` | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-retry | — | 2 |
| `is-palindrome` | pass | pass-retry | — | 2 |
| `is-prime` | FAIL | name-error | `E003` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | compile-error | `E010` | 3 |
| `race-strategies` | FAIL | name-error | `E003` | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-retry | — | 1 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | pass | pass-retry | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `settle-health` | FAIL | name-error | `E003` | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | pass | pass-retry | — | 1 |
| `word-count` | FAIL | name-error | `E003` | 3 |
| `zip-with` | FAIL | type-error | `E001` | 3 |

## By category

- pass-1shot: 10
- pass-retry: 6
- parse-error: 13
- type-error: 2
- name-error: 4
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 1
- fail-3: 22

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 5
- `E002`: 1
- `E003`: 8
- `E005`: 2
- `E010`: 1
- `E012`: 2
