# MSR run 2026-06-02

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 13 / 30
- **1-shot passes**: 10 / 30
- **total retries**: 53

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
| `expression-eval` | FAIL | unknown | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-retry | — | 1 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | unknown | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | compile-error | `E0609` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | type-error | `E005` | 3 |
| `sum-digits` | pass | pass-retry | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 10
- pass-retry: 3
- parse-error: 9
- type-error: 2
- name-error: 1
- compile-error: 1
- unknown: 4

## Retry distribution

- pass-0: 10
- fail-0: 1
- pass-1: 2
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 1
- fail-3: 16

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E003`: 6
- `E005`: 2
- `E0609`: 1
