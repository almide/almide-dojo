# MSR run 2026-04-14

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 11 / 30
- **1-shot passes**: 10 / 30
- **total retries**: 58

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | type-error | `E002` | 3 |
| `balanced-parens` | FAIL | name-error | `E003` | 3 |
| `binary-search` | FAIL | name-error | `E003` | 3 |
| `caesar-cipher` | FAIL | name-error | `E003` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | type-error | `E002` | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | FAIL | type-error | `E001` | 3 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E001` | 3 |
| `is-prime` | FAIL | type-error | `E001` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | name-error | `E003` | 3 |
| `max-of-list` | FAIL | type-error | `E002` | 3 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | pass | pass-retry | — | 1 |
| `remove-duplicates` | FAIL | type-error | `E002` | 3 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | type-error | `E001` | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | name-error | `E003` | 3 |
| `string-reverse` | FAIL | type-error | `E001` | 3 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | FAIL | type-error | `E001` | 3 |
| `word-count` | FAIL | import-error | `E004` | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 10
- pass-retry: 1
- type-error: 11
- name-error: 7
- import-error: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 6
- `E002`: 5
- `E003`: 7
- `E004`: 1
