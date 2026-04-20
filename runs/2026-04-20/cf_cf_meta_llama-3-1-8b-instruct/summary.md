# MSR run 2026-04-20

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 14 / 30
- **1-shot passes**: 9 / 30
- **total retries**: 55

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 2 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | FAIL | parse-error | — | 3 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | type-error | `E005` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | pass | pass-retry | — | 1 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | pass | pass-1shot | — | 0 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | FAIL | name-error | `E003` | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 9
- pass-retry: 5
- parse-error: 10
- type-error: 4
- name-error: 1
- unknown: 1

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 0
- fail-3: 16

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 4
- `E002`: 1
- `E003`: 6
- `E005`: 3
