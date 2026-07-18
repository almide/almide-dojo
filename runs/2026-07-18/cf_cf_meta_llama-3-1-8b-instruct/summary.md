# MSR run 2026-07-18

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 10 / 31
- **1-shot passes**: 10 / 31
- **total retries**: 63

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
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | FAIL | parse-error | — | 3 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | compile-error | `E010` | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E002` | 3 |
| `max-of-list` | FAIL | compile-error | `E012` | 3 |
| `mini-json-query` | FAIL | type-error | `E005` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | compile-error | `E009` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | name-error | `E003` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | compile-error | `E012` | 3 |

## By category

- pass-1shot: 10
- parse-error: 12
- type-error: 2
- name-error: 1
- compile-error: 4
- unknown: 2

## Retry distribution

- pass-0: 10
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 21

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 2
- `E003`: 3
- `E005`: 2
- `E009`: 1
- `E010`: 1
- `E012`: 4
