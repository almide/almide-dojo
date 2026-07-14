# MSR run 2026-07-14

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 14 / 31
- **1-shot passes**: 11 / 31
- **total retries**: 55

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
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | type-error | `E002` | 3 |
| `is-prime` | FAIL | parse-error | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | parse-error | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | compile-error | `E009` | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | pass | pass-retry | — | 2 |

## By category

- pass-1shot: 11
- pass-retry: 3
- parse-error: 14
- type-error: 1
- compile-error: 1
- unknown: 1

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 2
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 17

## Recoverable diagnostic codes (passed after retry)

- `E005`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 2
- `E003`: 2
- `E005`: 1
- `E009`: 1
