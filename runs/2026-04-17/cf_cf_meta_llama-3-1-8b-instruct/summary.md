# MSR run 2026-04-17

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 13 / 30
- **1-shot passes**: 11 / 30
- **total retries**: 53

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-retry | — | 1 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | type-error | `E005` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | FAIL | parse-error | — | 3 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | pass | pass-1shot | — | 0 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | type-error | `E001` | 3 |

## By category

- pass-1shot: 11
- pass-retry: 2
- parse-error: 11
- type-error: 4
- unknown: 2

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 17

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 6
- `E002`: 1
- `E003`: 2
- `E005`: 3
