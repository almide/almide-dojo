# MSR run 2026-07-16

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 31
- **passed**: 12 / 31
- **1-shot passes**: 9 / 31
- **total retries**: 63

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 3 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-retry | — | 1 |
| `fizzbuzz` | pass | pass-retry | — | 2 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | compile-error | `E010` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | type-error | `E005` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | compile-error | `E0308` | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | FAIL | compile-error | `E013` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | type-error | `E005` | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 9
- pass-retry: 3
- parse-error: 11
- type-error: 3
- compile-error: 3
- unknown: 2

## Retry distribution

- pass-0: 9
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 19

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E003`: 2
- `E005`: 4
- `E010`: 1
- `E013`: 1
- `E0308`: 1
