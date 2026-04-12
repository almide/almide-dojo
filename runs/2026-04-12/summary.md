# MSR run 2026-04-12

## Llama 3.3 70B (Cloudflare Workers AI)

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 13
- **passed**: 9 / 13
- **1-shot passes**: 6 / 13
- **total retries**: 14

| task | result | retries |
|---|---|---|
| `anagram-check` | pass | 1 |
| `balanced-parens` | FAIL | 3 |
| `binary-search` | FAIL | 3 |
| `clamp` | pass | 0 |
| `count-vowels` | FAIL | 3 |
| `factorial` | pass | 0 |
| `fibonacci` | pass | 0 |
| `fizzbuzz` | pass | 0 |
| `gcd` | pass | 0 |
| `list-sum` | pass | 0 |
| `max-of-list` | pass | 1 |
| `roman-numeral` | FAIL | 3 |
| `sum-digits` | pass | 1 |

## Claude Sonnet 4.6 (Claude CLI)

- **model**: `claude-sonnet-4-6`
- **tasks**: 3
- **passed**: 3 / 3
- **1-shot passes**: 1 / 3
- **total retries**: 3

| task | result | retries |
|---|---|---|
| `is-palindrome` | pass | 1 |
| `is-prime` | pass | 2 |
| `string-reverse` | pass | 0 |
