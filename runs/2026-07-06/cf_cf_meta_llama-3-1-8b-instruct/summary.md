# MSR run 2026-07-06

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 11 / 30
- **1-shot passes**: 9 / 30
- **total retries**: 61

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | type-error | `E005` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | FAIL | parse-error | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | parse-error | — | 3 |
| `is-prime` | pass | pass-retry | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E012` | 3 |
| `max-of-list` | FAIL | name-error | `E003` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | FAIL | parse-error | — | 3 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 9
- pass-retry: 2
- parse-error: 13
- type-error: 1
- name-error: 2
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 1
- fail-3: 19

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 4
- `E002`: 1
- `E003`: 3
- `E005`: 3
- `E012`: 1
