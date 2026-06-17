# MSR run 2026-06-17

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 15 / 30
- **1-shot passes**: 10 / 30
- **total retries**: 52

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `caesar-cipher` | FAIL | type-error | `E002` | 3 |
| `clamp` | pass | pass-retry | — | 2 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | type-error | `E005` | 3 |
| `partition-list` | pass | pass-retry | — | 1 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E002` | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | FAIL | type-error | `E002` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 10
- pass-retry: 5
- parse-error: 7
- type-error: 5
- name-error: 1
- unknown: 2

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 0
- fail-3: 15

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 3
- `E003`: 2
- `E005`: 4
