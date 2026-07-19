# MSR run 2026-07-19

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 15 / 31
- **1-shot passes**: 9 / 31
- **total retries**: 57

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-retry | — | 1 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 2 |
| `flatten-nested` | pass | pass-retry | — | 1 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | type-error | `E002` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-retry | — | 1 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | compile-error | `E009` | 3 |
| `run-length-encoding` | FAIL | type-error | `E002` | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | parse-error | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | import-error | `E004` | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 9
- pass-retry: 6
- parse-error: 7
- type-error: 4
- name-error: 1
- import-error: 1
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 4
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 16

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 3
- `E003`: 4
- `E004`: 1
- `E005`: 2
- `E009`: 1
