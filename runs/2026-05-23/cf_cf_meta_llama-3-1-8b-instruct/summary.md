# MSR run 2026-05-23

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 14 / 30
- **1-shot passes**: 12 / 30
- **total retries**: 53

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 2 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E002` | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | compile-error | `E0609` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | pass | pass-retry | — | 3 |

## By category

- pass-1shot: 12
- pass-retry: 2
- parse-error: 10
- type-error: 4
- compile-error: 1
- unknown: 1

## Retry distribution

- pass-0: 12
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 16

## Recoverable diagnostic codes (passed after retry)

- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 3
- `E003`: 4
- `E005`: 1
- `E0609`: 1
