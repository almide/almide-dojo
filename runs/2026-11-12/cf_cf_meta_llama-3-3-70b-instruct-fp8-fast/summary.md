# MSR run 2026-11-12

> **Verdict: `not-comparable` — some planned tasks never reached the model: this rate is an interval and must not be quoted as a point**
>
> - certified as a comparison: **no**
> - the bank discriminated: **yes**
> - 1 of 38 planned task(s) were never answered by the model, so their outcome is unknown and the rate above is an interval, not a point — do not quote it as one: `roman-numeral` (transport)

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **compiler**: `almide 0.69.0 (release, 39f128a2d)`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 37 / 38
- **not-run**: 1
- **cells**: measured 37, inconclusive-saturated 0, not-run 1, harness-limitation 0
- **passed**: 31/38 (81%–84%)
- **1-shot passes**: 17/38 (44%–47%)
- **total retries**: 41

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `any-candidates` | FAIL | type-error | `E005` | 3 |
| `balanced-parens` | FAIL | unknown | — | 3 |
| `binary-search` | pass | pass-retry | — | 2 |
| `bounded-total` | FAIL | parse-error | — | 3 |
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
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | pass | pass-retry | — | 1 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | pass | pass-retry | — | 3 |
| `red-black-tree` | FAIL | type-error | `E001` | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 2 |
| `roman-numeral` | not-run | not-run | `transport` | — |
| `run-length-encoding` | FAIL | parse-error | — | 3 |
| `settle-health` | pass | pass-retry | — | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## Never asked (the model was never answered)

These tasks are `not-run`, not zeros. They are inside every denominator
above and inside no numerator, which is why the rates are intervals.

| task | state | class | what the transport said |
|---|---|---|---|
| `roman-numeral` | `not-run` | `transport` | fix_loop: attempt 1: call_model: cloudflare: no completion for model '@cf/meta/llama-3.3-70b-instruct-fp8-fast'; cloudflare says: [8007] AiError: AiError: {"error":{"message":"This model's maximum context length is 24000 tokens. However, you requested 4096 output tokens and your prompt contains at least 19905 input tokens, for a total of at least 24001 tokens. Please reduce the length of the input prompt or the number of requested output tokens. (parameter=input_tokens, value=19905)","type":"BadRequestError","param":"input_tokens","code":400}} (d44eaaf8-ef43-4c8d-a178-8cb4d1564f3a) |

## By category

- pass-1shot: 17
- pass-retry: 14
- not-run: 1
- parse-error: 2
- type-error: 2
- unknown: 2

## Retry distribution

- pass-0: 17
- fail-0: 0
- pass-1: 8
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 3
- fail-3: 6

## Recoverable diagnostic codes (passed after retry)

- `E001`: 2
- `E002`: 5
- `E003`: 2
- `E005`: 2
- `E027`: 2

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E001`: 1
- `E003`: 2
- `E005`: 1
