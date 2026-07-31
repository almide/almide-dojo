# MSR run 2026-07-31

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 11 / 31
- **1-shot passes**: 10 / 31
- **total retries**: 62

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | unknown | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | FAIL | unknown | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | parse-error | — | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | type-error | `E002` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-retry | — | 2 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E001` | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | FAIL | type-error | `E005` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | name-error | `E003` | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- pass-1shot: 10
- pass-retry: 1
- parse-error: 10
- type-error: 6
- name-error: 1
- unknown: 3

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 20

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 2
- `E003`: 3
- `E005`: 5
- `E012`: 1
