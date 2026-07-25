# MSR run 2026-07-25

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 13 / 31
- **1-shot passes**: 9 / 31
- **total retries**: 59

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | FAIL | parse-error | — | 3 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | parse-error | — | 3 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | FAIL | name-error | `E003` | 3 |
| `word-count` | FAIL | import-error | `E004` | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- pass-1shot: 9
- pass-retry: 4
- parse-error: 13
- type-error: 2
- name-error: 1
- import-error: 1
- unknown: 1

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 18

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 4
- `E002`: 3
- `E003`: 4
- `E004`: 1
- `E005`: 2
- `E012`: 1
