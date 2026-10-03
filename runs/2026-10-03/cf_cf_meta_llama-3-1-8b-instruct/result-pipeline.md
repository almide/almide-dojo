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
  match int.parse(s) {
    ok(n) => ok(n),
    err(e) => err(e)
  }

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
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
  here: |> result.flat_map(fn(n) => validate_positive(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:15:24
  here: |> result.flat_map(fn(n) => validate_positive(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(n) => validate_positive(n))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:16:24
  here: |> result.flat_map(fn(n) => validate_range(n, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn(n) => validate_range(n, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:17:19
  here: |> result.map(fn(n) => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn(r) => match r {
    ok(n) => validate_positive(n),
    err(e) => err(e)
  }) 
  |> result.flat_map(fn(r) => match r {
    ok(n) => validate_range(n, 1, 100),
    err(e) => err(e)
  }) 
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:22
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:15:24
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 19:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:19:24
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:23:19
  here: |> result.map(fn(n) => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn(r) => match r {
    ok(n) => validate_positive(n),
    err(e) => err(e)
  }) 
  |> result.flat_map(fn(r) => match r {
    ok(n) => validate_range(n, 1, 100),
    err(e) => err(e)
  }) 
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:22
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:15:24
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 19:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:19:24
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:23:19
  here: |> result.map(fn(n) => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

4 error(s) found
FAILED: /tmp/dojo-result-pipeline-2.almd
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn(r) => match r {
    ok(n) => validate_positive(n),
    err(e) => err(e)
  }) 
  |> result.flat_map(fn(r) => match r {
    ok(n) => validate_range(n, 1, 100),
    err(e) => err(e)
  }) 
  |> result.map(fn(n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:15:22
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:15:24
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 19:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:19:24
  here: |> result.flat_map(fn(r) => match r {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:23:19
  here: |> result.map(fn(n) => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   |> result.map(fn(n) => "valid: " + int.to_string(n))
   |                   ^

4 error(s) found
FAILED: /tmp/dojo-result-pipeline-3.almd
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
