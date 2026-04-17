# MSR run 2026-04-17

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 22 / 30
- **1-shot passes**: 14 / 30
- **total retries**: 34

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | type-error | `E005` | 3 |
| `balanced-parens` | FAIL | compile-error | `E0282` | 3 |
| `binary-search` | FAIL | compile-error | `E009` | 3 |
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
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 2 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | import-error | `E004` | 3 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | pass | pass-retry | — | 2 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-retry | — | 1 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-retry | — | 1 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 14
- pass-retry: 8
- parse-error: 4
- type-error: 1
- import-error: 1
- compile-error: 2

## Retry distribution

- pass-0: 14
- fail-0: 0
- pass-1: 6
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 0
- fail-3: 8

## Recoverable diagnostic codes (passed after retry)

- `E002`: 2
- `E003`: 1
- `E004`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E003`: 1
- `E004`: 1
- `E005`: 1
- `E009`: 1
- `E0282`: 1
