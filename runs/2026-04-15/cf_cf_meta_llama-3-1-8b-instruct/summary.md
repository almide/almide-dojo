# MSR run 2026-04-15

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 12 / 30
- **1-shot passes**: 11 / 30
- **total retries**: 55

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | unknown | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | FAIL | compile-error | `E0308` | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | unknown | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E012` | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | pass | pass-retry | — | 1 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | import-error | `E004` | 3 |
| `zip-with` | FAIL | unknown | — | 3 |

## By category

- pass-1shot: 11
- pass-retry: 1
- parse-error: 9
- type-error: 1
- import-error: 1
- compile-error: 2
- unknown: 5

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 18

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 1
- `E003`: 1
- `E004`: 1
- `E005`: 1
- `E012`: 2
- `E0308`: 1
