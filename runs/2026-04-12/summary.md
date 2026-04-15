# MSR run 2026-04-12

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 14 / 30
- **1-shot passes**: 6 / 30
- **total retries**: 57

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | type-error | `E001` | 3 |
| `balanced-parens` | FAIL | name-error | `E003` | 3 |
| `binary-search` | FAIL | type-error | `E001` | 3 |
| `caesar-cipher` | FAIL | type-error | `E002` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | type-error | `E002` | 3 |
| `expression-eval` | pass | pass-retry | — | 2 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-retry | — | 1 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-retry | — | 1 |
| `gcd` | pass | pass-retry | — | 1 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | FAIL | type-error | `E002` | 3 |
| `mini-json-query` | FAIL | name-error | `E003` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | FAIL | parse-error | — | 3 |
| `repeat-string` | pass | pass-retry | — | 1 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | import-error | `E004` | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | FAIL | type-error | `E001` | 3 |
| `title-case` | pass | pass-retry | — | 1 |
| `word-count` | FAIL | type-error | `E002` | 3 |
| `zip-with` | FAIL | unknown | — | 3 |

## By category

- pass-1shot: 6
- pass-retry: 8
- parse-error: 1
- type-error: 9
- name-error: 3
- import-error: 1
- unknown: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 5
- `E003`: 3
- `E004`: 1
- `E005`: 1
