# MSR run 2026-07-02

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 13 / 30
- **1-shot passes**: 9 / 30
- **total retries**: 58

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-retry | — | 2 |
| `count-vowels` | FAIL | unknown | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | compile-error | `E0308` | 3 |
| `is-prime` | pass | pass-retry | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-retry | — | 1 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | FAIL | parse-error | — | 3 |
| `title-case` | pass | pass-retry | — | 1 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | compile-error | `E012` | 3 |

## By category

- pass-1shot: 9
- pass-retry: 4
- parse-error: 12
- type-error: 2
- compile-error: 2
- unknown: 1

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 17

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E003`: 4
- `E005`: 4
- `E012`: 1
- `E0308`: 1
