# MSR run 2026-06-20

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 14 / 30
- **1-shot passes**: 11 / 30
- **total retries**: 52

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | import-error | `E004` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 11
- pass-retry: 3
- parse-error: 7
- type-error: 4
- name-error: 1
- import-error: 1
- unknown: 3

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 16

## Recoverable diagnostic codes (passed after retry)

- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 2
- `E003`: 3
- `E004`: 1
- `E005`: 4
- `E012`: 1
