# MSR run 2026-07-30

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 13 / 31
- **1-shot passes**: 10 / 31
- **total retries**: 60

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-retry | — | 2 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-retry | — | 2 |
| `is-palindrome` | FAIL | type-error | `E005` | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | type-error | `E005` | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-retry | — | 2 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | type-error | `E001` | 3 |

## By category

- pass-1shot: 10
- pass-retry: 3
- parse-error: 11
- type-error: 4
- name-error: 1
- unknown: 2

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 0
- fail-3: 18

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 2
- `E003`: 3
- `E005`: 6
