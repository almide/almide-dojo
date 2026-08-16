# MSR run 2026-08-16

- **model**: `cli:claude`
- **tasks**: 38
- **passed**: 38 / 38
- **1-shot passes**: 28 / 38
- **total retries**: 12

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | pass | pass-retry | — | 1 |
| `binary-search` | pass | pass-retry | — | 1 |
| `bounded-total` | pass | pass-1shot | — | 0 |
| `budget-units` | pass | pass-retry | — | 2 |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | pass | pass-1shot | — | 0 |
| `deadline-guard` | pass | pass-1shot | — | 0 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-1shot | — | 0 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-1shot | — | 0 |
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | pass | pass-1shot | — | 0 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-1shot | — | 0 |
| `race-strategies` | pass | pass-retry | — | 2 |
| `red-black-tree` | pass | pass-retry | — | 1 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 1 |
| `roman-numeral` | pass | pass-1shot | — | 0 |
| `run-length-encoding` | pass | pass-retry | — | 1 |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-retry | — | 1 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 28
- pass-retry: 10

## Retry distribution

- pass-0: 28
- fail-0: 0
- pass-1: 8
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 0
- fail-3: 0

## Recoverable diagnostic codes (passed after retry)

- `E009`: 1
- `E018`: 2
- `E025`: 1
