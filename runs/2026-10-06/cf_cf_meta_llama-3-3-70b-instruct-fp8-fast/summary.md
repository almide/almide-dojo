# MSR run 2026-10-06

> **Verdict: `comparable` — every planned task reached the model, and the bank discriminated: this rate is a point**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **compiler**: `almide 0.65.0 (release, dbde826d1)`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 38 / 38
- **not-run**: 0
- **cells**: measured 38, inconclusive-saturated 0, not-run 0, harness-limitation 0
- **passed**: 24/38 (63%)
- **1-shot passes**: 14/38 (36%)
- **total retries**: 56

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | type-error | `E002` | 3 |
| `binary-search` | FAIL | parse-error | — | 3 |
| `bounded-total` | FAIL | unknown | — | 3 |
| `budget-units` | FAIL | unknown | — | 3 |
| `caesar-cipher` | FAIL | compile-error | `E034` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | unknown | — | 3 |
| `deadline-guard` | FAIL | unknown | — | 3 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | FAIL | type-error | `E002` | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | pass | pass-1shot | — | 0 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | unknown | — | 3 |
| `race-strategies` | FAIL | unknown | — | 3 |
| `red-black-tree` | FAIL | compile-error | `E014` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 2 |
| `roman-numeral` | FAIL | type-error | `E001` | 3 |
| `run-length-encoding` | FAIL | compile-error | `E046` | 3 |
| `settle-health` | pass | pass-retry | — | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-retry | — | 1 |
| `zip-with` | pass | pass-retry | — | 1 |

## By category

- pass-1shot: 14
- pass-retry: 10
- parse-error: 1
- type-error: 4
- compile-error: 3
- unknown: 6

## Retry distribution

- pass-0: 14
- fail-0: 0
- pass-1: 7
- fail-1: 0
- pass-2: 2
- fail-2: 0
- pass-3: 1
- fail-3: 14

## Recoverable diagnostic codes (passed after retry)

- `E001`: 2
- `E003`: 2
- `E004`: 1
- `E005`: 1
- `E046`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 2
- `E005`: 1
- `E014`: 1
- `E034`: 1
- `E046`: 1
