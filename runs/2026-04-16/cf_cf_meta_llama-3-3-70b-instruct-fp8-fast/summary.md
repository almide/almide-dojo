# MSR run 2026-04-16

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 24 / 30
- **1-shot passes**: 11 / 30
- **total retries**: 43

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | unknown | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 2 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | pass | pass-retry | — | 3 |
| `run-length-encoding` | FAIL | compile-error | `E0609` | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | pass | pass-retry | — | 2 |
| `word-count` | pass | pass-retry | — | 3 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 11
- pass-retry: 13
- parse-error: 3
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 5
- fail-1: 0
- pass-2: 4
- fail-2: 0
- pass-3: 4
- fail-3: 6

## Recoverable diagnostic codes (passed after retry)

- `E001`: 3
- `E002`: 4
- `E003`: 1
- `E004`: 1
- `E005`: 1
- `E012`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E0609`: 1
