# MSR run 2026-06-10

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 10 / 30
- **1-shot passes**: 8 / 30
- **total retries**: 62

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | FAIL | parse-error | — | 3 |
| `flatten-nested` | pass | pass-retry | — | 1 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E005` | 3 |
| `is-prime` | FAIL | type-error | `E005` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | compile-error | `E0609` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | FAIL | parse-error | — | 3 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | type-error | `E005` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 8
- pass-retry: 2
- parse-error: 11
- type-error: 5
- compile-error: 1
- unknown: 3

## Retry distribution

- pass-0: 8
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 20

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 6
- `E002`: 1
- `E003`: 4
- `E005`: 4
- `E0609`: 1
