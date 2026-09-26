# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => s + ": " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(n) => validate_positive(n))
  |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:2:26
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                          ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:12:22
  here: |> result.flat_map(fn(n) => validate_positive(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:12:24
  here: |> result.flat_map(fn(n) => validate_positive(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                        ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:24
  here: |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 14:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:14:19
  here: |> result.map(fn(n) => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

7 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => s + ": " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_positive(n)))
  |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_range(n, 1, 100)))
  |> result.map(fn(r) => "valid: " + int.to_string(r))
```

**Diagnostic:**

```
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:2:26
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                          ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:12:22
  here: |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_positive(n)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_positive(n)))
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:12:24
  here: |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_positive(n)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_positive(n)))
   |                        ^
error: Expected function name at line 12:47 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:12:47
  here: |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_positive(n)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_positive(n)))
   |                                               ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:13:24
  here: |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_range(n, 1, 100)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_range(n, 1, 100)))
   |                        ^
error: Expected function name at line 13:47 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:13:47
  here: |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_range(n, 1, 100)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   |> result.flat_map(fn(r) => result.map(r, fn(n) => validate_range(n, 1, 100)))
   |                                               ^
error: Expected function name at line 14:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:14:19
  here: |> result.map(fn(r) => "valid: " + int.to_string(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   |> result.map(fn(r) => "valid: " + int.to_string(r))
   |                   ^

8 error(s) found
FAILED: /tmp/dojo-result-pipeline-1.almd
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => s + ": " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => 
    match r {
      ok(n) => validate_positive(n)
      err(e) => err(e)
    })
  |> result.flat_map(fn(r) => 
    match r {
      ok(n) => validate_range(n, 1, 100)
      err(e) => err(e)
    })
  |> result.map(fn(r) => "valid: " + int.to_string(r))
```

**Diagnostic:**

```
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:2:24
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:2:26
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                          ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:12:22
  here: |> result.flat_map(fn(r) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(r) =>
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:12:24
  here: |> result.flat_map(fn(r) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 17:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:17:24
  here: |> result.flat_map(fn(r) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 22:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:22:19
  here: |> result.map(fn(r) => "valid: " + int.to_string(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   |> result.map(fn(r) => "valid: " + int.to_string(r))
   |                   ^

6 error(s) found
FAILED: /tmp/dojo-result-pipeline-2.almd
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(fn(e) => s + ": " + e)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => 
    match r {
      ok(n) => validate_positive(n)
      err(e) => err(e)
    })
  |> result.flat_map(fn(r) => 
    match r {
      ok(n) => validate_range(n, 1, 100)
      err(e) => err(e)
    })
  |> result.map(fn(r) => "valid: " + int.to_string(r))
```

**Diagnostic:**

```
error: Expected expression at line 2:24 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:2:24
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                        ^
error: Expected function name at line 2:26 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:2:26
  here: int.parse(s).map_err(fn(e) => s + ": " + e)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   int.parse(s).map_err(fn(e) => s + ": " + e)
  |                          ^
error: Expected expression at line 12:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:12:22
  here: |> result.flat_map(fn(r) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(r) =>
   |                      ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:12:24
  here: |> result.flat_map(fn(r) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 17:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:17:24
  here: |> result.flat_map(fn(r) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.flat_map(fn(r) =>
   |                        ^
error: Expected function name at line 22:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:22:19
  here: |> result.map(fn(r) => "valid: " + int.to_string(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   |> result.map(fn(r) => "valid: " + int.to_string(r))
   |                   ^

6 error(s) found
FAILED: /tmp/dojo-result-pipeline-3.almd
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
