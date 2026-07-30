# MSR run 2026-07-30

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 31
- **passed**: 22 / 31
- **1-shot passes**: 13 / 31
- **total retries**: 42

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 3 |
| `balanced-parens` | pass | pass-retry | — | 3 |
| `binary-search` | FAIL | unknown | — | 3 |
| `caesar-cipher` | pass | pass-retry | — | 2 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | type-error | `E001` | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 13
- pass-retry: 9
- parse-error: 3
- type-error: 4
- unknown: 2

## Retry distribution

- pass-0: 13
- fail-0: 0
- pass-1: 5
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 2
- fail-3: 9

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1
- `E002`: 2
- `E003`: 3
- `E004`: 1
- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 3
- `E005`: 2
