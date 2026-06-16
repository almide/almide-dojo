# MSR run 2026-06-16

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **tasks**: 30
- **passed**: 0 / 30
- **1-shot passes**: 0 / 30
- **total retries**: 90

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | type-error | `E002` | 3 |
| `balanced-parens` | FAIL | type-error | `E002` | 3 |
| `binary-search` | FAIL | type-error | `E002` | 3 |
| `caesar-cipher` | FAIL | type-error | `E002` | 3 |
| `clamp` | FAIL | type-error | `E002` | 3 |
| `count-vowels` | FAIL | type-error | `E002` | 3 |
| `custom-linked-list` | FAIL | type-error | `E002` | 3 |
| `expression-eval` | FAIL | type-error | `E002` | 3 |
| `factorial` | FAIL | type-error | `E002` | 3 |
| `fibonacci` | FAIL | type-error | `E002` | 3 |
| `fizzbuzz` | FAIL | type-error | `E002` | 3 |
| `flatten-nested` | FAIL | type-error | `E002` | 3 |
| `gcd` | FAIL | type-error | `E002` | 3 |
| `is-palindrome` | FAIL | type-error | `E002` | 3 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | FAIL | type-error | `E002` | 3 |
| `matrix-ops` | FAIL | type-error | `E002` | 3 |
| `max-of-list` | FAIL | type-error | `E002` | 3 |
| `mini-json-query` | FAIL | type-error | `E002` | 3 |
| `partition-list` | FAIL | type-error | `E002` | 3 |
| `remove-duplicates` | FAIL | type-error | `E002` | 3 |
| `repeat-string` | FAIL | type-error | `E002` | 3 |
| `result-pipeline` | FAIL | type-error | `E002` | 3 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | type-error | `E002` | 3 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | type-error | `E002` | 3 |
| `title-case` | FAIL | type-error | `E002` | 3 |
| `word-count` | FAIL | type-error | `E002` | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- type-error: 30

## Retry distribution

- pass-0: 0
- fail-0: 0
- pass-1: 0
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 0
- fail-3: 30

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 30
