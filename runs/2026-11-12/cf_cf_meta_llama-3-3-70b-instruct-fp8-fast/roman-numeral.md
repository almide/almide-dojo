# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `not-run`
- **reason**: fix_loop: attempt 1: call_model: cloudflare: no completion for model '@cf/meta/llama-3.3-70b-instruct-fp8-fast'; cloudflare says: [8007] AiError: AiError: {"error":{"message":"This model's maximum context length is 24000 tokens. However, you requested 4096 output tokens and your prompt contains at least 19905 input tokens, for a total of at least 24001 tokens. Please reduce the length of the input prompt or the number of requested output tokens. (parameter=input_tokens, value=19905)","type":"BadRequestError","param":"input_tokens","code":400}} (d44eaaf8-ef43-4c8d-a178-8cb4d1564f3a)
- **category**: not-run
- **class**: `transport`

The model was never answered for this task, so there is no attempt to
score. This cell is `not-run`: not a failure, and not a zero.
