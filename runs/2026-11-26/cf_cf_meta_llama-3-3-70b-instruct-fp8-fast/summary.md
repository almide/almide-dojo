# MSR run 2026-11-26

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
- **passed**: 32/38 (84%)
- **1-shot passes**: 15/38 (39%)
- **total retries**: 40

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | FAIL | type-error | `E001` | 3 |
| `binary-search` | FAIL | type-error | `E001` | 3 |
| `bounded-total` | pass | pass-retry | — | 1 |
| `budget-units` | pass | pass-retry | — | 1 |
| `caesar-cipher` | pass | pass-retry | — | 2 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | FAIL | unknown | — | 3 |
| `deadline-guard` | pass | pass-1shot | — | 0 |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-retry | — | 1 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-retry | — | 1 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-retry | — | 3 |
| `max-of-list` | pass | pass-retry | — | 1 |
| `mini-json-query` | pass | pass-retry | — | 1 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | pass | pass-retry | — | 1 |
| `red-black-tree` | FAIL | type-error | `E001` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 2 |
| `roman-numeral` | FAIL | parse-error | — | 3 |
| `run-length-encoding` | FAIL | unknown | — | 3 |
| `settle-health` | pass | pass-retry | — | 2 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-retry | — | 1 |
| `zip-with` | pass | pass-1shot | — | 0 |

## By category

- pass-1shot: 15
- pass-retry: 17
- parse-error: 1
- type-error: 3
- unknown: 2

## Retry distribution

- pass-0: 15
- fail-0: 0
- pass-1: 13
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 1
- fail-3: 6

## Recoverable diagnostic codes (passed after retry)

- `E001`: 2
- `E002`: 4
- `E003`: 3
- `E005`: 2
- `E027`: 3

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 3
- `E003`: 1
