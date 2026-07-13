# MSR run 2026-07-13

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 31
- **passed**: 20 / 31
- **1-shot passes**: 13 / 31
- **total retries**: 30

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | type-error | `E005` | 3 |
| `balanced-parens` | FAIL | unknown | — | 3 |
| `binary-search` | FAIL | type-error | `E002` | 3 |
| `caesar-cipher` | pass | pass-retry | — | 2 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 2 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 1 |
| `max-of-list` | FAIL | unknown | — | 0 |
| `mini-json-query` | FAIL | unknown | — | 0 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 0 |
| `run-length-encoding` | FAIL | import-error | `E004` | 3 |
| `string-reverse` | FAIL | unknown | — | 0 |
| `sum-digits` | pass | pass-retry | — | 1 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 13
- pass-retry: 7
- parse-error: 2
- type-error: 2
- import-error: 1
- unknown: 6

## Retry distribution

- pass-0: 13
- fail-0: 4
- pass-1: 5
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 0
- fail-3: 7

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E003`: 2
- `E005`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 2
- `E004`: 1
- `E005`: 1
