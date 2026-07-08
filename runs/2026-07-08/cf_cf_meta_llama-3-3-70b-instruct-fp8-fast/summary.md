# MSR run 2026-07-08

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 21 / 30
- **1-shot passes**: 17 / 30
- **total retries**: 17

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | compile-error | `E0282` | 3 |
| `binary-search` | FAIL | name-error | `E003` | 3 |
| `caesar-cipher` | FAIL | unknown | — | 0 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | unknown | — | 0 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-1shot | — | 0 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 2 |
| `max-of-list` | FAIL | unknown | — | 0 |
| `mini-json-query` | FAIL | unknown | — | 0 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 0 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 17
- pass-retry: 4
- parse-error: 1
- type-error: 1
- name-error: 1
- compile-error: 1
- unknown: 5

## Retry distribution

- pass-0: 17
- fail-0: 5
- pass-1: 3
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 4

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E003`: 1
- `E005`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E003`: 2
- `E005`: 1
- `E0282`: 1
