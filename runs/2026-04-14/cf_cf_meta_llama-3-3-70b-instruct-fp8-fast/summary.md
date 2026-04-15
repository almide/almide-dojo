# MSR run 2026-04-14

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 14 / 30
- **1-shot passes**: 5 / 30
- **total retries**: 60

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | type-error | `E002` | 3 |
| `balanced-parens` | FAIL | name-error | `E003` | 3 |
| `binary-search` | FAIL | type-error | `E001` | 3 |
| `caesar-cipher` | FAIL | type-error | `E005` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | type-error | `E002` | 3 |
| `expression-eval` | pass | pass-retry | — | 2 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-retry | — | 1 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | FAIL | type-error | `E001` | 3 |
| `gcd` | pass | pass-retry | — | 1 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | name-error | `E003` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | FAIL | parse-error | — | 3 |
| `repeat-string` | pass | pass-retry | — | 1 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | type-error | `E002` | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | pass | pass-retry | — | 2 |
| `word-count` | FAIL | type-error | `E002` | 3 |
| `zip-with` | FAIL | type-error | `E005` | 3 |

## By category

- pass-1shot: 5
- pass-retry: 9
- parse-error: 1
- type-error: 10
- name-error: 3
- unknown: 2

## Retry distribution

- pass-0: 5
- fail-0: 0
- pass-1: 6
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 0
- fail-3: 16

## Recoverable diagnostic codes (passed after retry)

- `E002`: 8
- `E003`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 5
- `E003`: 3
- `E005`: 3
