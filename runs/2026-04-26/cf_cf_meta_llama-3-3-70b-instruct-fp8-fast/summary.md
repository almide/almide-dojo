# MSR run 2026-04-26

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 22 / 30
- **1-shot passes**: 13 / 30
- **total retries**: 36

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | compile-error | `E0308` | 3 |
| `binary-search` | FAIL | type-error | `E001` | 3 |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | pass | pass-retry | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E0282` | 3 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | name-error | `E003` | 3 |
| `run-length-encoding` | FAIL | import-error | `E004` | 3 |
| `string-reverse` | pass | pass-retry | — | 2 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-retry | — | 1 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 13
- pass-retry: 9
- parse-error: 1
- type-error: 2
- name-error: 1
- import-error: 1
- compile-error: 2
- unknown: 1

## Retry distribution

- pass-0: 13
- fail-0: 0
- pass-1: 7
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 8

## Recoverable diagnostic codes (passed after retry)

- `E002`: 2
- `E003`: 2
- `E004`: 1
- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 1
- `E003`: 1
- `E004`: 1
- `E0282`: 1
- `E0308`: 1
