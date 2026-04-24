# MSR run 2026-04-24

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 10 / 30
- **1-shot passes**: 9 / 30
- **total retries**: 55

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | unknown | — | 0 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | FAIL | type-error | `E002` | 3 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E005` | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | unknown | — | 0 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | FAIL | parse-error | — | 3 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | FAIL | type-error | `E005` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 9
- pass-retry: 1
- parse-error: 11
- type-error: 6
- unknown: 3

## Retry distribution

- pass-0: 9
- fail-0: 2
- pass-1: 1
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 18

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 4
- `E002`: 3
- `E003`: 4
- `E005`: 4
