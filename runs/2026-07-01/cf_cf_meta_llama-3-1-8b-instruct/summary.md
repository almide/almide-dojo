# MSR run 2026-07-01

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 10 / 30
- **1-shot passes**: 8 / 30
- **total retries**: 62

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-retry | — | 1 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-retry | — | 1 |
| `count-vowels` | FAIL | unknown | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | FAIL | parse-error | — | 3 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E002` | 3 |
| `is-prime` | FAIL | type-error | `E005` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | FAIL | type-error | `E002` | 3 |
| `title-case` | FAIL | name-error | `E003` | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- pass-1shot: 8
- pass-retry: 2
- parse-error: 12
- type-error: 6
- name-error: 1
- unknown: 1

## Retry distribution

- pass-0: 8
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 20

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 4
- `E002`: 4
- `E003`: 4
- `E005`: 5
- `E012`: 1
