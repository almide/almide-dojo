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
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  in operator
  here: if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
11 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:15:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:16:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:17:22
  here: |> result.map(fn n => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

5 error(s) found
FAILED: /tmp/dojo-result-pipeline-0.almd
  parse error: '&&' is not valid in Almide
  parse error: Expected expression at line 15:22 (got Fn 'fn')
  parse error: Expected LParen at line 15:27 (got FatArrow '=>')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 15:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:15:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 16:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:16:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 17:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:17:22
  here: |> result.map(fn n => "valid: " + int.to_string(n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   |> result.map(fn n => "valid: " + int.to_string(n))
   |                      ^

4 error(s) found
FAILED: /tmp/dojo-result-pipeline-1.almd
  parse error: Expected expression at line 15:22 (got Fn 'fn')
  parse error: Expected LParen at line 15:27 (got FatArrow '=>')
  parse error: Expected LParen at line 16:27 (got FatArrow '=>')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
  |> result.flat_map((r) => validate_positive(r))
  |> result.flat_map((r) => validate_range(r, 1, 100))
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
FAILED: /tmp/dojo-result-pipeline-2.almd
  test: parse_int invalid
  at:   /tmp/dojo-result-pipeline-2.almd:21
  expected: err("not a number: abc")
  found:    err("invalid digit found in string")
  test: process invalid parse
  at:   /tmp/dojo-result-pipeline-2.almd:29
  expected: err("not a number: abc")
  found:    err("invalid digit found in string")

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
  |> result.flat_map((r) => match r {
    ok(n) => validate_positive(n)
    err(e) => err(e)
  })
  |> result.flat_map((r) => match r {
    ok(n) => validate_range(n, 1, 100)
    err(e) => err(e)
  })
  |> result.map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
error: pattern `ok(..)` cannot match Int — the subject is not a Result
  --> /tmp/dojo-result-pipeline-3.almd:15:35
  in match pattern
  here: |> result.flat_map((r) => match r {
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
15 |   |> result.flat_map((r) => match r {
   |                                   ^
error: pattern `err(..)` cannot match Int — the subject is not a Result
  --> /tmp/dojo-result-pipeline-3.almd:16:32
  in match pattern
  here: ok(n) => validate_positive(n)
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
16 |     ok(n) => validate_positive(n)
   |                                ^
error: pattern `ok(..)` cannot match Int — the subject is not a Result
  --> /tmp/dojo-result-pipeline-3.almd:19:35
  in match pattern
  here: |> result.flat_map((r) => match r {
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
19 |   |> result.flat_map((r) => match r {
   |                                   ^
error: pattern `err(..)` cannot match Int — the subject is not a Result
  --> /tmp/dojo-result-pipeline-3.almd:20:35
  in match pattern
  here: ok(n) => validate_range(n, 1, 100)
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
   |
20 |     ok(n) => validate_range(n, 1, 100)
   |                                   ^^^

4 error(s) found
FAILED: /tmp/dojo-result-pipeline-3.almd
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
