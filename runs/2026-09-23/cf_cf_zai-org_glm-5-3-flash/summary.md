# MSR run 2026-09-23

> **Verdict: `not-comparable` — some planned tasks never reached the model: this rate is an interval and must not be quoted as a point**
>
> - certified as a comparison: **no**
> - the bank discriminated: **yes**
> - 12 of 38 planned task(s) were never answered by the model, so their outcome is unknown and the rate above is an interval, not a point — do not quote it as one: `balanced-parens` (empty-completion), `binary-search` (empty-completion), `bounded-total` (empty-completion), `budget-units` (empty-completion), `expression-eval` (empty-completion), `fibonacci` (empty-completion), `mini-json-query` (empty-completion), `race-cheapest` (empty-completion), `race-strategies` (empty-completion), `red-black-tree` (empty-completion), `roman-numeral` (empty-completion), `run-length-encoding` (empty-completion)

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **compiler**: `almide 0.62.0`
- **http timeout (s)**: `140`
- **tasks**: 38
- **reached**: 26 / 38
- **not-run**: 12
- **cells**: measured 26, inconclusive-saturated 0, not-run 12, harness-limitation 0
- **passed**: 25/38 (65%–97%)
- **1-shot passes**: 20/38 (52%–84%)
- **total retries**: 9

## Per-task

| task | result | category | code | retries |
|---|---|---|---|---|
| `anagram-check` | pass | pass-1shot | — | 0 |
| `any-candidates` | pass | pass-retry | — | 1 |
| `balanced-parens` | not-run | not-run | `empty-completion` | — |
| `binary-search` | not-run | not-run | `empty-completion` | — |
| `bounded-total` | not-run | not-run | `empty-completion` | — |
| `budget-units` | not-run | not-run | `empty-completion` | — |
| `caesar-cipher` | pass | pass-retry | — | 1 |
| `clamp` | pass | pass-1shot | — | 0 |
| `count-vowels` | pass | pass-1shot | — | 0 |
| `custom-linked-list` | pass | pass-1shot | — | 0 |
| `deadline-guard` | FAIL | unknown | — | 3 |
| `expression-eval` | not-run | not-run | `empty-completion` | — |
| `factorial` | pass | pass-1shot | — | 0 |
| `fibonacci` | not-run | not-run | `empty-completion` | — |
| `fizzbuzz` | pass | pass-1shot | — | 0 |
| `flatten-nested` | pass | pass-1shot | — | 0 |
| `gcd` | pass | pass-1shot | — | 0 |
| `is-palindrome` | pass | pass-1shot | — | 0 |
| `is-prime` | pass | pass-1shot | — | 0 |
| `list-sum` | pass | pass-1shot | — | 0 |
| `matrix-ops` | pass | pass-1shot | — | 0 |
| `max-of-list` | pass | pass-retry | — | 2 |
| `mini-json-query` | not-run | not-run | `empty-completion` | — |
| `partition-list` | pass | pass-1shot | — | 0 |
| `race-cheapest` | not-run | not-run | `empty-completion` | — |
| `race-strategies` | not-run | not-run | `empty-completion` | — |
| `red-black-tree` | not-run | not-run | `empty-completion` | — |
| `remove-duplicates` | pass | pass-1shot | — | 0 |
| `repeat-string` | pass | pass-1shot | — | 0 |
| `result-pipeline` | pass | pass-retry | — | 1 |
| `roman-numeral` | not-run | not-run | `empty-completion` | — |
| `run-length-encoding` | not-run | not-run | `empty-completion` | — |
| `settle-health` | pass | pass-retry | — | 1 |
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
| `balanced-parens` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `binary-search` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `bounded-total` | `not-run` | `empty-completion` | fix_loop: attempt 1: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `budget-units` | `not-run` | `empty-completion` | fix_loop: attempt 3: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `expression-eval` | `not-run` | `empty-completion` | fix_loop: attempt 1: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `fibonacci` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `mini-json-query` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `race-cheapest` | `not-run` | `empty-completion` | fix_loop: attempt 1: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `race-strategies` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `red-black-tree` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `roman-numeral` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |
| `run-length-encoding` | `not-run` | `empty-completion` | fix_loop: attempt 0: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured. |

## By category

- pass-1shot: 20
- pass-retry: 5
- not-run: 12
- unknown: 1

## Retry distribution

- pass-0: 20
- fail-0: 0
- pass-1: 4
- fail-1: 0
- pass-2: 1
- fail-2: 0
- pass-3: 0
- fail-3: 1

## Recoverable diagnostic codes (passed after retry)

- `E001`: 1
