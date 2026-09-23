# race-cheapest

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `not-run`
- **reason**: fix_loop: attempt 1: call_model: empty completion from provider 'cf' (spec 'cf:@cf/zai-org/glm-5.3-flash'): the provider generated 4096 completion token(s), none of which reached `content`; finish_reason: length. An empty file scored against the oracle would look like a model failure, so this is a harness error and the cell is not measured.
- **category**: not-run
- **class**: `empty-completion`

The model was never answered for this task, so there is no attempt to
score. This cell is `not-run`: not a failure, and not a zero.
