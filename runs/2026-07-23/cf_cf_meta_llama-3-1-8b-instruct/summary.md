# MSR run 2026-07-23

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 17 / 31
- **1-shot passes**: 16 / 31
- **total retries**: 45

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | compile-error | `E012` | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `caesar-cipher` | pass | pass-retry | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | compile-error | `E013` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | compile-error | `E009` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | FAIL | parse-error | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 16
- pass-retry: 1
- parse-error: 8
- type-error: 1
- compile-error: 3
- unknown: 2

## Retry distribution

- pass-0: 16
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 1
- fail-3: 14

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 2
- `E003`: 1
- `E005`: 2
- `E009`: 1
- `E012`: 1
- `E013`: 1
