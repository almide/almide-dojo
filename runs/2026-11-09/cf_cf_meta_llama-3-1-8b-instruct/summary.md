# MSR run 2026-11-09

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
| `any-candidates` | pass | pass-retry | — | 3 |
| `balanced-parens` | FAIL | parse-error | — | 3 |
| `binary-search` | FAIL | compile-error | `E038` | 3 |
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
| `matrix-ops` | FAIL | parse-error | — | 3 |
| `max-of-list` | FAIL | type-error | `E005` | 3 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | FAIL | name-error | `E003` | 3 |
| `red-black-tree` | FAIL | compile-error | `E014` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | pass | pass-retry | — | 2 |
| `run-length-encoding` | FAIL | type-error | `E002` | 3 |
| `settle-health` | pass | pass-retry | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | unknown | — | 3 |
| `word-count` | FAIL | parse-error | — | 3 |
| `zip-with` | FAIL | parse-error | — | 3 |

## By category

- pass-1shot: 12
- pass-retry: 6
- parse-error: 11
- type-error: 2
- name-error: 1
- compile-error: 3
- unknown: 3

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

- `E001`: 1
- `E002`: 1
- `E003`: 1
- `E027`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E002`: 1
- `E003`: 3
- `E005`: 1
- `E012`: 2
- `E014`: 1
- `E029`: 1
- `E037`: 1
- `E038`: 1
