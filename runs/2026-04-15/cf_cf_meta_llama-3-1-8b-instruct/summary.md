# MSR run 2026-04-15

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 11 / 30
- **1-shot passes**: 11 / 30
- **total retries**: 57

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `balanced-parens` | FAIL | name-error | `E003` | 3 |
| `binary-search` | FAIL | type-error | `E002` | 3 |
| `caesar-cipher` | FAIL | type-error | `E005` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | type-error | `E002` | 3 |
| `expression-eval` | FAIL | type-error | `E002` | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | compile-error | `E010` | 3 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E002` | 3 |
| `max-of-list` | FAIL | type-error | `E001` | 3 |
| `mini-json-query` | FAIL | import-error | `E004` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | FAIL | type-error | `E002` | 3 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | type-error | `E002` | 3 |
| `roman-numeral` | FAIL | type-error | `E005` | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | FAIL | unknown | — | 3 |
| `sum-digits` | FAIL | type-error | `E002` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | name-error | `E003` | 3 |
| `zip-with` | FAIL | unknown | — | 3 |

## By category

- pass-1shot: 11
- type-error: 12
- name-error: 2
- import-error: 1
- compile-error: 1
- unknown: 3

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 19

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 8
- `E003`: 2
- `E004`: 1
- `E005`: 3
- `E010`: 1
