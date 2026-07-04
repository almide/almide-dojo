# MSR run 2026-07-04

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 13 / 30
- **1-shot passes**: 9 / 30
- **total retries**: 59

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-retry | — | 2 |
| `count-vowels` | FAIL | parse-error | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 2 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-retry | — | 2 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | name-error | `E003` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | FAIL | compile-error | `E010` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | type-error | `E002` | 3 |
| `string-reverse` | pass | pass-retry | — | 2 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- pass-1shot: 9
- pass-retry: 4
- parse-error: 10
- type-error: 3
- name-error: 1
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 4
- fail-2: 0
- pass-3: 0
- fail-3: 17

## Recoverable diagnostic codes (passed after retry)

- `E004`: 1
- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 3
- `E003`: 4
- `E005`: 2
- `E010`: 1
