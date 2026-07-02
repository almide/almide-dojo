# MSR run 2026-07-02

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 23 / 30
- **1-shot passes**: 13 / 30
- **total retries**: 35

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | type-error | `E005` | 3 |
| `binary-search` | pass | pass-retry | — | 2 |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-retry | — | 1 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | unknown | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | type-error | `E001` | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-retry | — | 1 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 13
- pass-retry: 10
- parse-error: 2
- type-error: 3
- unknown: 2

## Retry distribution

- pass-0: 13
- fail-0: 0
- pass-1: 7
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 1
- fail-3: 7

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1
- `E002`: 3
- `E003`: 1
- `E004`: 1
- `E005`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 1
- `E005`: 2
