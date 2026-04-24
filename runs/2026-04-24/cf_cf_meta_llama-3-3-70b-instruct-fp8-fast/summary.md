# MSR run 2026-04-24

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 21 / 30
- **1-shot passes**: 15 / 30
- **total retries**: 37

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 2 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
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
| `matrix-ops` | FAIL | compile-error | `E0609` | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | FAIL | import-error | `E004` | 3 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 15
- pass-retry: 6
- parse-error: 5
- type-error: 1
- import-error: 1
- compile-error: 1
- unknown: 1

## Retry distribution

- pass-0: 15
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 4
- fail-2: 0
- pass-3: 0
- fail-3: 9

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E003`: 2
- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 1
- `E004`: 1
- `E005`: 2
- `E0609`: 1
