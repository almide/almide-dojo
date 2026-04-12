# MSR run 2026-04-12

## Llama 3.3 70B (Cloudflare Workers AI)

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **tasks**: 27
- **passed**: 16 / 27
- **1-shot passes**: 9 / 27
- **total retries**: 44

### By difficulty

| difficulty | tasks | passed | 1-shot | pass % | 1-shot % |
|---|---|---|---|---|---|
| basic | 12 | 10 | 6 | 83% | 50% |
| intermediate | 10 | 4 | 2 | 40% | 20% |
| advanced | 5 | 2 | 1 | 40% | 20% |
| **total** | **27** | **16** | **9** | **59%** | **33%** |

### Per-task

| task | difficulty | result | retries |
|---|---|---|---|
| `clamp` | basic | pass | 0 |
| `count-vowels` | basic | pass | 2 |
| `factorial` | basic | pass | 0 |
| `fibonacci` | basic | pass | 0 |
| `fizzbuzz` | basic | pass | 0 |
| `gcd` | basic | pass | 0 |
| `list-sum` | basic | pass | 0 |
| `max-of-list` | basic | pass | 1 |
| `remove-duplicates` | basic | FAIL | 3 |
| `repeat-string` | basic | pass | 1 |
| `sum-digits` | basic | pass | 1 |
| `title-case` | basic | FAIL | 3 |
| `anagram-check` | intermediate | pass | 1 |
| `balanced-parens` | intermediate | FAIL | 3 |
| `binary-search` | intermediate | FAIL | 3 |
| `caesar-cipher` | intermediate | pass | 2 |
| `flatten-nested` | intermediate | pass | 0 |
| `partition-list` | intermediate | pass | 0 |
| `roman-numeral` | intermediate | FAIL | 3 |
| `run-length-encoding` | intermediate | FAIL | 3 |
| `word-count` | intermediate | FAIL | 3 |
| `zip-with` | intermediate | FAIL | 3 |
| `custom-linked-list` | advanced | FAIL | 3 |
| `expression-eval` | advanced | pass | 0 |
| `matrix-ops` | advanced | FAIL | 3 |
| `mini-json-query` | advanced | FAIL | 3 |
| `result-pipeline` | advanced | FAIL | 3 |

## Claude Sonnet 4.6 (Claude CLI, partial)

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
