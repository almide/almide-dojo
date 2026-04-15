# MSR run 2026-04-15

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 13 / 30
- **1-shot passes**: 10 / 30
- **total retries**: 54

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `balanced-parens` | FAIL | type-error | `E001` | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | compile-error | `E0428` | 3 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-retry | — | 1 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | type-error | `E001` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-retry | — | 1 |
| `remove-duplicates` | FAIL | type-error | `E001` | 3 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 10
- pass-retry: 3
- parse-error: 10
- type-error: 5
- compile-error: 1
- unknown: 1

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 17

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1
- `E002`: 1
- `E0609`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 7
- `E003`: 3
- `E005`: 2
- `E0428`: 1
