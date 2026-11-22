# MSR run 2026-11-22

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
- **1-shot passes**: 14/38 (36%)
- **total retries**: 65

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `any-candidates` | FAIL | type-error | `E005` | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | parse-error | — | 3 |
| `caesar-cipher` | FAIL | parse-error | — | 3 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | FAIL | parse-error | — | 3 |
| `deadline-guard` | pass | pass-1shot | — | 0 |
| `expression-eval` | FAIL | parse-error | — | 3 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | FAIL | compile-error | `E037` | 3 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | FAIL | compile-error | `E012` | 3 |
| `max-of-list` | FAIL | unknown | — | 3 |
| `mini-json-query` | FAIL | import-error | `E004` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | FAIL | compile-error | `E027` | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | unknown | — | 3 |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-retry | — | 2 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | type-error | `E001` | 3 |
| `zip-with` | FAIL | type-error | `E002` | 3 |

## By category

- pass-1shot: 14
- pass-retry: 4
- parse-error: 7
- type-error: 3
- import-error: 1
- compile-error: 3
- unknown: 6

## Retry distribution

- pass-0: 14
- fail-0: 0
- pass-1: 3
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 20

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E005`: 1
- `E027`: 1

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 2
- `E002`: 1
- `E003`: 2
- `E004`: 1
- `E005`: 2
- `E012`: 1
- `E027`: 1
- `E037`: 1
