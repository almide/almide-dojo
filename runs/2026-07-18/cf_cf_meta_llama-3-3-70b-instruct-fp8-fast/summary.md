# MSR run 2026-07-18

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 31
- **passed**: 22 / 31
- **1-shot passes**: 16 / 31
- **total retries**: 38

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 2 |
| `balanced-parens` | FAIL | compile-error | `E0282` | 3 |
| `binary-search` | FAIL | unknown | — | 3 |
| `caesar-cipher` | FAIL | type-error | `E005` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 2 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | import-error | `E004` | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 16
- pass-retry: 6
- parse-error: 5
- type-error: 1
- import-error: 1
- compile-error: 1
- unknown: 1

## Retry distribution

- pass-0: 16
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 1
- fail-3: 9

## Recoverable diagnostic codes (passed after retry)

- `E002`: 2
- `E004`: 1
- `E005`: 2
- `E0308`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 1
- `E003`: 2
- `E004`: 1
- `E005`: 1
- `E0282`: 1
