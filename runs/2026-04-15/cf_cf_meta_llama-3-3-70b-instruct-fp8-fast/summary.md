# MSR run 2026-04-15

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 30
- **passed**: 19 / 30
- **1-shot passes**: 11 / 30
- **total retries**: 45

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | pass | pass-retry | — | 2 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 2 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `expression-eval` | pass | pass-retry | — | 1 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | parse-error | — | 3 |
| `is-prime` | FAIL | name-error | `E003` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | FAIL | parse-error | — | 3 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-retry | — | 2 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 11
- pass-retry: 8
- parse-error: 10
- name-error: 1

## Retry distribution

- pass-0: 11
- fail-0: 0
- pass-1: 4
- fail-1: 0
- pass-2: 4
- fail-2: 0
- pass-3: 0
- fail-3: 11

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1
- `E002`: 1
- `E003`: 2
- `E004`: 1
- `E0609`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 4
- `E002`: 1
- `E003`: 2
- `E005`: 1
