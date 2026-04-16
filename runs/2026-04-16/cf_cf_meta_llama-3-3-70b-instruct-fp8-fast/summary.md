# MSR run 2026-04-16

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 21 / 30
- **1-shot passes**: 12 / 30
- **total retries**: 41

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 3 |
| `balanced-parens` | FAIL | unknown | — | 3 |
| `binary-search` | FAIL | type-error | `E002` | 3 |
| `caesar-cipher` | pass | pass-retry | — | 2 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-retry | — | 1 |
| `is-palindrome` | pass | pass-retry | — | 1 |
| `is-prime` | FAIL | name-error | `E003` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | type-error | `E001` | 3 |
| `run-length-encoding` | FAIL | type-error | `E001` | 3 |
| `string-reverse` | pass | pass-retry | — | 2 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | pass | pass-retry | — | 1 |
| `word-count` | pass | pass-retry | — | 1 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 12
- pass-retry: 9
- parse-error: 3
- type-error: 4
- name-error: 1
- unknown: 1

## Retry distribution

- pass-0: 12
- fail-0: 0
- pass-1: 5
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 1
- fail-3: 9

## Recoverable diagnostic codes (passed after retry)

- `E001`: 2
- `E002`: 2
- `E003`: 4

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 1
- `E003`: 1
- `E004`: 1
- `E005`: 1
