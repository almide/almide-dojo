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
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
  here: |> result.flat_map(fn(x) => validate_positive(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:15:24
  here: |> result.flat_map(fn(x) => validate_positive(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:16:24
  here: |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:17:19
  here: |> result.map(fn(x) => "valid: " + int.to_string(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

5 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:22
  here: |> result.flat_map(fn(x) => validate_positive(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:15:24
  here: |> result.flat_map(fn(x) => validate_positive(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:16:24
  here: |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:17:19
  here: |> result.map(fn(x) => "valid: " + int.to_string(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

4 error(s) found
FAILED: /tmp/dojo-result-pipeline-1.almd
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map((x) => validate_positive(x))
  |> result.flat_map((x) => validate_range(x, 1, 100))
  |> result.map((x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:22
  here: |> result.flat_map(fn(x) => validate_positive(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:15:24
  here: |> result.flat_map(fn(x) => validate_positive(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:16:24
  here: |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:17:19
  here: |> result.map(fn(x) => "valid: " + int.to_string(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^
error[E012]: duplicate function 'process'
  at line 19
  in fn process
  here: fn process(input: String) -> Result[String, String] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
13 | fn process(input: String) -> Result[String, String] =
   | ---------------------------------- first definition of 'process' here
...
19 | fn process(input: String) -> Result[String, String] =
   | ^

5 error(s) found
FAILED: /tmp/dojo-result-pipeline-2.almd
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map((x) => validate_positive(x))
  |> result.flat_map((x) => validate_range(x, 1, 100))
  |> result.map((x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-result-pipeline-3.almd
  test: parse_int invalid
  at:   /tmp/dojo-result-pipeline-3.almd:21
  expected: Err("not a number: abc")
  found:    Err("invalid digit found in string")
  test: process invalid parse
  at:   /tmp/dojo-result-pipeline-3.almd:29
  expected: Err("not a number: abc")
  found:    Err("invalid digit found in string")

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
