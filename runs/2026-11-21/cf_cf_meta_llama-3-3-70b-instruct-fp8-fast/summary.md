# MSR run 2026-11-21

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
- **passed**: 33/38 (86%–89%)
- **1-shot passes**: 16/38 (42%–44%)
- **total retries**: 42

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-retry | — | 1 |
| `any-candidates` | pass | pass-retry | — | 3 |
| `balanced-parens` | pass | pass-retry | — | 3 |
| `binary-search` | pass | pass-retry | — | 3 |
| `bounded-total` | pass | pass-retry | — | 1 |
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
| `matrix-ops` | pass | pass-retry | — | 1 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | FAIL | compile-error | `E0308` | 3 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | pass | pass-retry | — | 1 |
| `race-strategies` | pass | pass-retry | — | 3 |
| `red-black-tree` | FAIL | parse-error | — | 3 |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 2 |
| `roman-numeral` | not-run | not-run | `transport` | — |
| `run-length-encoding` | FAIL | unknown | — | 3 |
| `settle-health` | pass | pass-retry | — | 3 |
| `string-reverse` | pass | pass-retry | — | 1 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-retry | — | 2 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## Never asked (the model was never answered)

These tasks are `not-run`, not zeros. They are inside every denominator
above and inside no numerator, which is why the rates are intervals.

| task | state | class | what the transport said |
|---|---|---|---|
| `roman-numeral` | `not-run` | `transport` | fix_loop: attempt 1: call_model: cloudflare: no completion for model '@cf/meta/llama-3.3-70b-instruct-fp8-fast'; cloudflare says: [8007] AiError: AiError: {"error":{"message":"This model's maximum context length is 24000 tokens. However, your prompt contains at least 24001 input tokens, which exceeds this limit even without any output tokens. Please reduce the length of the input prompt. (parameter=input_tokens, value=24001)","type":"BadRequestError","param":"input_tokens","code":400}} (b19b61c8-1ba6-42fa-9f94-1f71e39a6696) |

## By category

- pass-1shot: 16
- pass-retry: 17
- not-run: 1
- parse-error: 1
- compile-error: 1
- unknown: 2

## Retry distribution

- pass-0: 16
- fail-0: 0
- pass-1: 9
- fail-1: 0
- pass-2: 3
- fail-2: 0
- pass-3: 5
- fail-3: 4

## Recoverable diagnostic codes (passed after retry)

- `E001`: 2
- `E002`: 4
- `E003`: 4
- `E005`: 2
- `E027`: 3

## Unrecoverable diagnostic codes (still failing after 3 retries)

- `E002`: 1
- `E0308`: 1
