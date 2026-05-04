# MSR run 2026-05-04

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 15 / 30
- **1-shot passes**: 12 / 30
- **total retries**: 37

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | type-error | `E002` | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | unknown | — | 0 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 0 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | unknown | — | 0 |
| `string-reverse` | FAIL | parse-error | — | 3 |
| `sum-digits` | FAIL | parse-error | — | 3 |
| `title-case` | FAIL | unknown | — | 0 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 12
- pass-retry: 3
- parse-error: 8
- type-error: 2
- unknown: 5

## Retry distribution

- pass-0: 12
- fail-0: 4
- pass-1: 2
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 11

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E0609`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 1
- `E003`: 3
- `E005`: 2
