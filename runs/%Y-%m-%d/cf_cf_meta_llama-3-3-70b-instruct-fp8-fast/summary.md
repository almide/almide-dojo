# MSR run %Y-%m-%d

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 38
- **passed**: 21 / 38
- **1-shot passes**: 16 / 38
- **total retries**: 56

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 2 |
| `any-candidates` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | unknown | — | 3 |
| `binary-search` | FAIL | unknown | — | 0 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | name-error | `E003` | 3 |
| `caesar-cipher` | pass | pass-retry | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | FAIL | compile-error | `E0593` | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | unknown | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E0609` | 3 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | unknown | — | 3 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `settle-health` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 16
- pass-retry: 5
- parse-error: 7
- type-error: 1
- name-error: 1
- compile-error: 2
- unknown: 6

## Retry distribution

- pass-0: 16
- fail-0: 1
- pass-1: 3
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 16

## Recoverable diagnostic codes (passed after retry)

- `E002`: 2
- `E003`: 1
- `E004`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 2
- `E003`: 4
- `E005`: 1
- `E0593`: 1
- `E0609`: 1
