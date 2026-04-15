# MSR run 2026-04-12-llama

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 18 / 30
- **1-shot passes**: 10 / 30
- **total retries**: 47

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | type-error | `E002` | 3 |
| `binary-search` | FAIL | type-error | `E001` | 3 |
| `caesar-cipher` | pass | pass-retry | — | 2 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 2 |
| `custom-linked-list` | FAIL | type-error | `E002` | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | pass | pass-retry | — | 2 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | name-error | `E003` | 3 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | FAIL | parse-error | — | 3 |
| `repeat-string` | pass | pass-retry | — | 1 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E001` | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-retry | — | 1 |
| `title-case` | FAIL | type-error | `E002` | 3 |
| `word-count` | FAIL | unknown | — | 3 |
| `zip-with` | FAIL | unknown | — | 3 |

## By category

- pass-1shot: 10
- pass-retry: 8
- parse-error: 1
- type-error: 6
- name-error: 1
- unknown: 4

## Top diagnostic codes

- `E001`: 2
- `E002`: 4
- `E003`: 1
