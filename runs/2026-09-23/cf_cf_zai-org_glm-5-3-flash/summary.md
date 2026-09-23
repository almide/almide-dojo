# MSR run 2026-09-23

> **Verdict: `not-comparable` — some planned tasks never reached the model: this rate is an interval and must not be quoted as a point**
>
> - certified as a comparison: **no**
> - the bank discriminated: **no**
> - 10 of 38 planned task(s) were never answered by the model, so their outcome is unknown and the rate above is an interval, not a point — do not quote it as one: `balanced-parens` (empty-completion), `binary-search` (empty-completion), `bounded-total` (empty-completion), `budget-units` (empty-completion), `custom-linked-list` (empty-completion), `deadline-guard` (empty-completion), `race-cheapest` (empty-completion), `race-strategies` (empty-completion), `red-black-tree` (empty-completion), `run-length-encoding` (empty-completion)
> - this model passed 98% or better of the tasks it was asked, so the bank did not discriminate and the rate above is a statement about the bank's ceiling rather than about the model (INCONCLUSIVE_BANK_SATURATED, almide-dojo#3 / almide/almide#1963)

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **compiler**: `almide 0.62.0`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 28 / 38
- **not-run**: 10
- **cells**: measured 0, inconclusive-saturated 28, not-run 10, harness-limitation 0
- **passed**: 28/38 (73%–100%)
- **1-shot passes**: 23/38 (60%–86%)
- **total retries**: 6

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | not-run | not-run | `empty-completion` | — |
| `binary-search` | not-run | not-run | `empty-completion` | — |
| `bounded-total` | not-run | not-run | `empty-completion` | — |
| `budget-units` | not-run | not-run | `empty-completion` | — |
| `caesar-cipher` | pass | pass-1shot | — | 0 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-retry | — | 1 |
| `custom-linked-list` | not-run | not-run | `empty-completion` | — |
| `deadline-guard` | not-run | not-run | `empty-completion` | — |
| `expression-eval` | pass | pass-1shot | — | 0 |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | pass | pass-1shot | — | 0 |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-retry | — | 1 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-1shot | — | 0 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | pass | pass-1shot | — | 0 |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | not-run | not-run | `empty-completion` | — |
| `race-strategies` | not-run | not-run | `empty-completion` | — |
| `red-black-tree` | not-run | not-run | `empty-completion` | — |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 1 |
| `roman-numeral` | pass | pass-1shot | — | 0 |
| `run-length-encoding` | not-run | not-run | `empty-completion` | — |
| `settle-health` | pass | pass-1shot | — | 0 |
| `string-reverse` | pass | pass-1shot | — | 0 |
| `sum-digits` | pass | pass-1shot | — | 0 |
| `title-case` | pass | pass-1shot | — | 0 |
| `word-count` | pass | pass-1shot | — | 0 |
| `zip-with` | pass | pass-1shot | — | 0 |

## Never asked (the model was never answered)

These tasks are `not-run`, not zeros. They are inside every denominator
above and inside no numerator, which is why the rates are intervals.

| task | state | class | what the transport said |
|---|---|---|---|
| `balanced-parens` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `binary-search` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `bounded-total` | `not-run` | `empty-completion` | fix_loop: attempt 1: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `budget-units` | `not-run` | `empty-completion` | fix_loop: attempt 3: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `custom-linked-list` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `deadline-guard` | `not-run` | `empty-completion` | fix_loop: attempt 1: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `race-cheapest` | `not-run` | `empty-completion` | fix_loop: attempt 2: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `race-strategies` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `red-black-tree` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |
| `run-length-encoding` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): a credential, quota or model-name failure can answer 200 with no completion, and an empty file scored against the oracle would look like a model failure |

## By category

- pass-1shot: 23
- pass-retry: 5
- not-run: 10

## Retry distribution

- pass-0: 23
- fail-0: 0
- pass-1: 4
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 0
