# MSR run 2026-04-16

- **model**: `cli:claude`
- **tasks**: 30
- **passed**: 29 / 30
- **1-shot passes**: 23 / 30
- **total retries**: 6

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `balanced-parens` | pass | pass-retry | — | 1 |
| `binary-search` | pass | pass-retry | — | 1 |
| `caesar-cipher` | pass | pass-1shot | — | 0 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | pass | pass-1shot | — | 0 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-1shot | — | 0 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 1 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | pass | pass-1shot | — | 0 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 1 |
| `roman-numeral` | FAIL | unknown | — | 0 |
| `run-length-encoding` | pass | pass-1shot | — | 0 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-retry | — | 1 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 23
- pass-retry: 6
- unknown: 1

## Retry distribution

- pass-0: 23
- fail-0: 1
- pass-1: 6
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 0

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1
- `E003`: 1
