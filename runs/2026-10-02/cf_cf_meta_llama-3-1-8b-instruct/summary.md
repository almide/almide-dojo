# MSR run 2026-10-02

> **Verdict: `comparable` — every planned task reached the model, and the bank discriminated: this rate is a point**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **compiler**: `almide 0.65.0 (release, dbde826d1)`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 38 / 38
- **not-run**: 0
- **cells**: measured 38, inconclusive-saturated 0, not-run 0, harness-limitation 0
- **passed**: 15/38 (39%)
- **1-shot passes**: 13/38 (34%)
- **total retries**: 73

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `bounded-total` | FAIL | unknown | — | 3 |
| `budget-units` | FAIL | runtime-error | — | 3 |
| `caesar-cipher` | FAIL | compile-error | `E030` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | type-error | `E005` | 3 |
| `deadline-guard` | FAIL | unknown | — | 3 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | parse-error | — | 3 |
| `is-prime` | pass | pass-retry | — | 3 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | FAIL | type-error | `E001` | 3 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | compile-error | `E014` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | parse-error | — | 3 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | FAIL | type-error | `E002` | 3 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 13
- pass-retry: 2
- parse-error: 10
- type-error: 5
- compile-error: 2
- runtime-error: 1
- unknown: 5

## Retry distribution

- pass-0: 13
- fail-0: 0
- pass-1: 1
- fail-1: 0
- pass-2: 0
- fail-2: 0
- pass-3: 1
- fail-3: 23

## Recoverable diagnostic codes (passed after retry)

- `E004`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 2
- `E003`: 3
- `E005`: 3
- `E014`: 1
- `E030`: 1
