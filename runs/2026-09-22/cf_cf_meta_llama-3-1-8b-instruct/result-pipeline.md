# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|_| "not a number: " ++ s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  |> result.map(fn(n) => "valid: " ++ int.to_string(n))
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  here: int.parse(s).map_err(|_| "not a number: " ++ s)
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|_| "not a number: " ++ s)
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  |              ^
error: Expected expression at line 13:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:13:22
  here: |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                      ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:24
  here: |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 14:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:14:19
  here: |> result.map(fn(n) => "valid: " ++ int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   |> result.map(fn(n) => "valid: " ++ int.to_string(n))
   |                   ^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-result-pipeline-0.almd:5:70
  in operator ++
  here: if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))
  hint: Replace ++ with +
  |
5 |   if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))
  |                                                                      ^

6 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|e| "not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map((n) => validate_range(n, 1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  here: int.parse(s).map_err(|e| "not a number: " + e)
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|e| "not a number: " + e)
  |                        ^

1 error(s) found
FAILED: /tmp/dojo-result-pipeline-1.almd
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err((e) => "not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map((n) => validate_range(n, 1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-result-pipeline-2.almd
  test: parse_int invalid
  at:   /tmp/dojo-result-pipeline-2.almd:18
  expected: Err("not a number: abc")
  found:    Err("not a number: invalid digit found in string")
  test: process invalid parse
  at:   /tmp/dojo-result-pipeline-2.almd:26
  expected: Err("not a number: abc")
  found:    Err("not a number: invalid digit found in string")

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err((e) => "not a number: " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map((n) => validate_range(n, 1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-result-pipeline-3.almd
  test: parse_int invalid
  at:   /tmp/dojo-result-pipeline-3.almd:18
  expected: Err("not a number: abc")
  found:    Err("not a number: invalid digit found in string")
  test: process invalid parse
  at:   /tmp/dojo-result-pipeline-3.almd:26
  expected: Err("not a number: abc")
  found:    Err("not a number: invalid digit found in string")

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
