# MSR run 2026-04-15

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 10 / 30
- **1-shot passes**: 7 / 30
- **total retries**: 66

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 2 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | FAIL | parse-error | — | 3 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | FAIL | parse-error | — | 3 |
| `is-palindrome` | FAIL | type-error | `E002` | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | FAIL | parse-error | — | 3 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E001` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-retry | — | 3 |
| `sum-digits` | FAIL | parse-error | — | 3 |
| `title-case` | FAIL | parse-error | — | 3 |
| `word-count` | FAIL | unknown | — | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 7
- pass-retry: 3
- parse-error: 16
- type-error: 3
- unknown: 1

## Retry distribution

- pass-0: 7
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 20

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E002`: 2
- `E003`: 4
- `E005`: 2
