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
  match (n > 0) {
    true => ok(n),
    false => err(format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n && n <= hi) {
    true => ok(n),
    false => err(format("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => format("valid: {}", n))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 14:18
  --> /tmp/dojo-result-pipeline-0.almd:14:18
  here: match (lo <= n && n <= hi) {
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match (lo <= n && n <= hi) {
   |                  ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:21:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:21:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:22:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:23:22
  here: |> result.map(fn n => format("valid: {}", n))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   |> result.map(fn n => format("valid: {}", n))
   |                      ^
error[E002]: undefined function 'format'
  --> /tmp/dojo-result-pipeline-0.almd:10:18
  in call to format()
  here: false => err(format("must be positive: {}", n))
  hint: Check the function name
   |
10 |     false => err(format("must be positive: {}", n))
   |                  ^^^^^^

6 error(s) found
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
  match (n > 0) {
    true => ok(n),
    false => err(string.format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n && n <= hi) {
    true => ok(n),
    false => err(string.format("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 14:18
  --> /tmp/dojo-result-pipeline-1.almd:14:18
  here: match (lo <= n && n <= hi) {
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match (lo <= n && n <= hi) {
   |                  ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:21:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:21:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:22:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:23:22
  here: |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
   |                      ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-1.almd:10:18
  in call to string.format()
  here: false => err(string.format("must be positive: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
10 |     false => err(string.format("must be positive: {}", n))
   |                  ^^^^^^^^^^^^^

6 error(s) found
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
  match (n > 0) {
    true => ok(n),
    false => err(string.format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n and n <= hi) {
    true => ok(n),
    false => err(string.format("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
```

**Diagnostic:**

```
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:21:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:21:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:22:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:23:22
  here: |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
   |                      ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-2.almd:10:18
  in call to string.format()
  here: false => err(string.format("must be positive: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
10 |     false => err(string.format("must be positive: {}", n))
   |                  ^^^^^^^^^^^^^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-2.almd:16:18
  in call to string.format()
  here: false => err(string.format("out of range: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
16 |     false => err(string.format("out of range: {}", n))
   |                  ^^^^^^^^^^^^^

6 error(s) found
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
  match (n > 0) {
    true => ok(n),
    false => err(string.format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n and n <= hi) {
    true => ok(n),
    false => err(string.format("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn r => validate_positive(r))
  |> result.flat_map(fn r => validate_range(r, 1, 100))
  |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))

// Fix: import string module
import string

// Fix: use string.format instead of string.format
fn validate_positive(n: Int) -> Result[Int, String] = 
  match (n > 0) {
    true => ok(n),
    false => err(string.format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n and n <= hi) {
    true => ok(n),
    false => err(string.format("out of range: {}", n))
  }
```

**Diagnostic:**

```
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:21:22
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:21:27
  here: |> result.flat_map(fn r => validate_positive(r))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:22:27
  here: |> result.flat_map(fn r => validate_range(r, 1, 100))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:23:22
  here: |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   |> result.map(fn n => string.to_upper(string.format("valid: {}", int.to_string(n))))
   |                      ^
error[E012]: duplicate function 'validate_positive'
  at line 29
  in fn validate_positive
  here: fn validate_positive(n: Int) -> Result[Int, String] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 7 | fn validate_positive(n: Int) -> Result[Int, String] =
   | -------------------------------------------- first definition of 'validate_positive' here
...
29 | fn validate_positive(n: Int) -> Result[Int, String] =
   | ^
error[E012]: duplicate function 'validate_range'
  at line 35
  in fn validate_range
  here: fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
13 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
   | ----------------------------------------- first definition of 'validate_range' here
...
35 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] =
   | ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:10:18
  in call to string.format()
  here: false => err(string.format("must be positive: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
10 |     false => err(string.format("must be positive: {}", n))
   |                  ^^^^^^^^^^^^^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:16:18
  in call to string.format()
  here: false => err(string.format("out of range: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
16 |     false => err(string.format("out of range: {}", n))
   |                  ^^^^^^^^^^^^^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:32:18
  in call to string.format()
  here: false => err(string.format("must be positive: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
32 |     false => err(string.format("must be positive: {}", n))
   |                  ^^^^^^^^^^^^^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:38:18
  in call to string.format()
  here: false => err(string.format("out of range: {}", n))
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
38 |     false => err(string.format("out of range: {}", n))
   |                  ^^^^^^^^^^^^^

10 error(s) found
FAILED: /tmp/dojo-result-pipeline-3.almd
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
