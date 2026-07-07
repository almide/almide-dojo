# MSR run 2026-07-07

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 13 / 30
- **1-shot passes**: 12 / 30
- **total retries**: 54

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | unknown | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | parse-error | — | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | name-error | `E003` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | unknown | — | 3 |
| `sum-digits` | pass | pass-retry | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | unknown | — | 3 |
| `zip-with` | FAIL | compile-error | `E0308` | 3 |

## By category

- pass-1shot: 12
- pass-retry: 1
- parse-error: 11
- name-error: 1
- compile-error: 1
- unknown: 4

## Retry distribution

- pass-0: 12
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 1
- fail-3: 17

## Recoverable diagnostic codes (passed after retry)

- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 2
- `E003`: 2
- `E005`: 3
- `E012`: 2
- `E0308`: 1
