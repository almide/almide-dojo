# MSR run 2026-11-18

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
- **passed**: 20/38 (52%)
- **1-shot passes**: 14/38 (36%)
- **total retries**: 63

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | FAIL | unknown | — | 3 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | compile-error | `E032` | 3 |
| `binary-search` | pass | pass-1shot | — | 0 |
| `bounded-total` | FAIL | parse-error | — | 3 |
| `budget-units` | FAIL | compile-error | `E029` | 3 |
| `caesar-cipher` | pass | pass-retry | — | 2 |
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
| `max-of-list` | pass | pass-1shot | — | 0 |
| `mini-json-query` | FAIL | parse-error | — | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | FAIL | parse-error | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | FAIL | unknown | — | 3 |
| `roman-numeral` | FAIL | unknown | — | 3 |
| `run-length-encoding` | FAIL | type-error | `E005` | 3 |
| `settle-health` | pass | pass-retry | — | 3 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | FAIL | unknown | — | 3 |
| `title-case` | FAIL | type-error | `E005` | 3 |
| `word-count` | FAIL | type-error | `E005` | 3 |
| `zip-with` | FAIL | name-error | `E003` | 3 |

## By category

- pass-1shot: 14
- pass-retry: 6
- parse-error: 7
- type-error: 3
- name-error: 1
- compile-error: 3
- unknown: 4

## Retry distribution

- pass-0: 14
- fail-0: 0
- pass-1: 4
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 1
- fail-3: 18

## Recoverable diagnostic codes (passed after retry)

- `E002`: 1
- `E003`: 1
- `E027`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E003`: 3
- `E005`: 4
- `E012`: 1
- `E029`: 1
- `E032`: 1
- `E037`: 1
