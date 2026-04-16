# MSR run 2026-04-15

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 14 / 30
- **1-shot passes**: 11 / 30
- **total retries**: 54

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | unknown | — | 3 |
| `caesar-cipher` | FAIL | name-error | `E003` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 2 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | pass | pass-retry | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | FAIL | name-error | `E003` | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 11
- pass-retry: 3
- parse-error: 10
- type-error: 2
- name-error: 2
- unknown: 2

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 16

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 2
- `E003`: 4
- `E004`: 2
- `E005`: 1
