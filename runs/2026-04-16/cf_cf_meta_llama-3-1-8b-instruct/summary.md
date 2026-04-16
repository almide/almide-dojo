# MSR run 2026-04-16

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 11 / 30
- **1-shot passes**: 8 / 30
- **total retries**: 61

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 2 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E001` | 3 |
| `is-prime` | FAIL | name-error | `E003` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | type-error | `E002` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | FAIL | parse-error | — | 3 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | FAIL | type-error | `E002` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | name-error | `E003` | 3 |
| `zip-with` | FAIL | unknown | — | 3 |

## By category

- pass-1shot: 8
- pass-retry: 3
- parse-error: 10
- type-error: 4
- name-error: 3
- unknown: 2

## Retry distribution

- pass-0: 8
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 19

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 6
- `E002`: 3
- `E003`: 5
- `E005`: 1
