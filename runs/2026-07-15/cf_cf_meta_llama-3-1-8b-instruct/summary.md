# MSR run 2026-07-15

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 14 / 31
- **1-shot passes**: 8 / 31
- **total retries**: 60

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | name-error | `E003` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | FAIL | parse-error | — | 3 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-retry | — | 3 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | type-error | `E002` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-retry | — | 1 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | compile-error | `E009` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | pass | pass-retry | — | 2 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 8
- pass-retry: 6
- parse-error: 10
- type-error: 2
- name-error: 2
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 8
- fail-0: 0
- pass-1: 4
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 17

## Recoverable diagnostic codes (passed after retry)

- `E004`: 1
- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 3
- `E003`: 4
- `E005`: 3
- `E009`: 1
