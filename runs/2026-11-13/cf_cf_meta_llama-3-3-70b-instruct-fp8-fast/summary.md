# MSR run 2026-11-13

> **Verdict: `comparable` — every planned task reached the model, and the bank discriminated: this rate is a point**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **compiler**: `almide 0.69.0 (release, 39f128a2d)`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 38 / 38
- **not-run**: 0
- **cells**: measured 38, inconclusive-saturated 0, not-run 0, harness-limitation 0
- **passed**: 31/38 (81%)
- **1-shot passes**: 17/38 (44%)
- **total retries**: 44

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 2 |
| `any-candidates` | FAIL | type-error | `E005` | 3 |
| `balanced-parens` | pass | pass-retry | — | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `bounded-total` | FAIL | type-error | `E002` | 3 |
| `budget-units` | pass | pass-retry | — | 1 |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | unknown | — | 3 |
| `deadline-guard` | pass | pass-1shot | — | 0 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 3 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | pass | pass-retry | — | 1 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | pass | pass-retry | — | 3 |
| `red-black-tree` | FAIL | compile-error | `E012` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 2 |
| `roman-numeral` | FAIL | type-error | `E002` | 3 |
| `run-length-encoding` | FAIL | unknown | — | 3 |
| `settle-health` | pass | pass-retry | — | 2 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 17
- pass-retry: 14
- parse-error: 1
- type-error: 3
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 17
- fail-0: 0
- pass-1: 8
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 3
- fail-3: 7

## Recoverable diagnostic codes (passed after retry)

- `E001`: 2
- `E002`: 4
- `E003`: 2
- `E004`: 1
- `E005`: 1
- `E027`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 2
- `E003`: 1
- `E005`: 1
- `E012`: 1
