# MSR run 2026-11-21

> **Verdict: `comparable` — every planned task reached the model, and the bank discriminated: this rate is a point**
>
> - certified as a comparison: **yes**
> - the bank discriminated: **yes**

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **compiler**: `almide 0.69.0 (release, 39f128a2d)`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 38 / 38
- **not-run**: 0
- **cells**: measured 38, inconclusive-saturated 0, not-run 0, harness-limitation 0
- **passed**: 18/38 (47%)
- **1-shot passes**: 12/38 (31%)
- **total retries**: 71

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | parse-error | — | 3 |
| `any-candidates` | FAIL | type-error | `E005` | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | type-error | `E001` | 3 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | compile-error | `E030` | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | pass | pass-1shot | — | 0 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-retry | — | 3 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | type-error | `E005` | 3 |
| `max-of-list` | FAIL | type-error | `E005` | 3 |
| `mini-json-query` | FAIL | type-error | `E005` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | compile-error | `E010` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | type-error | `E005` | 3 |
| `roman-numeral` | pass | pass-retry | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `settle-health` | FAIL | parse-error | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- pass-1shot: 12
- pass-retry: 6
- parse-error: 9
- type-error: 8
- compile-error: 2
- unknown: 1

## Retry distribution

- pass-0: 12
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 2
- fail-3: 20

## Recoverable diagnostic codes (passed after retry)

- `E002`: 2
- `E005`: 1
- `E027`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 6
- `E002`: 1
- `E003`: 2
- `E005`: 6
- `E010`: 1
- `E030`: 1
