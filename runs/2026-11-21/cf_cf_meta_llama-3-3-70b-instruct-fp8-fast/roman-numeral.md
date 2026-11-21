# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `not-run`
- **reason**: fix_loop: attempt 1: call_model: cloudflare: no completion for model '@cf/meta/llama-3.3-70b-instruct-fp8-fast'; cloudflare says: [8007] AiError: AiError: {"error":{"message":"This model's maximum context length is 24000 tokens. However, your prompt contains at least 24001 input tokens, which exceeds this limit even without any output tokens. Please reduce the length of the input prompt. (parameter=input_tokens, value=24001)","type":"BadRequestError","param":"input_tokens","code":400}} (b19b61c8-1ba6-42fa-9f94-1f71e39a6696)
- **category**: not-run
- **class**: `transport`

The model was never answered for this task, so there is no attempt to
score. This cell is `not-run`: not a failure, and not a zero.
