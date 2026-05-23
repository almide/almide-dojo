# MSR run 2026-05-23

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 22 / 30
- **1-shot passes**: 15 / 30
- **total retries**: 34

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | unknown | — | 3 |
| `caesar-cipher` | pass | pass-retry | — | 3 |
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
| `is-prime` | FAIL | unknown | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 2 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 15
- pass-retry: 7
- parse-error: 5
- type-error: 1
- unknown: 2

## Retry distribution

- pass-0: 15
- fail-0: 0
- pass-1: 5
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 8

## Recoverable diagnostic codes (passed after retry)

- `E002`: 2
- `E003`: 2
- `E005`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 2
- `E003`: 1
- `E005`: 1
