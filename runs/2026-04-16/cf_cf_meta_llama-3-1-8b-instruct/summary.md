# MSR run 2026-04-16

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 10 / 30
- **1-shot passes**: 10 / 30
- **total retries**: 60

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | FAIL | parse-error | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E001` | 3 |
| `is-prime` | FAIL | name-error | `E003` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | type-error | `E002` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | type-error | `E002` | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | parse-error | — | 3 |
| `word-count` | FAIL | name-error | `E003` | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 10
- parse-error: 13
- type-error: 4
- name-error: 2
- unknown: 1

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 20

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 4
- `E003`: 7
- `E005`: 1
