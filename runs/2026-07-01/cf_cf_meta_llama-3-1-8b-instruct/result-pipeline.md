# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match (n > 0) {
    true => ok(n)
    false => err(format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n && n <= hi) {
    true => ok(n)
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
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 14:18
  --> /tmp/dojo-result-pipeline-0.almd:14:18
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match (lo <= n && n <= hi) {
   |                  ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:21:22
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:21:27
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:22:27
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-0.almd:23:22
   |
23 |   |> result.map(fn n => format("valid: {}", n))
   |                      ^
error[E002]: undefined function 'format'
  --> /tmp/dojo-result-pipeline-0.almd:10:49
  in call to format()
  hint: Check the function name
   |
10 |     false => err(format("must be positive: {}", n))
   |                                                 ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match (n > 0) {
    true => ok(n)
    false => err(format!("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n and n <= hi) {
    true => ok(n)
    false => err(format!("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn r => validate_positive(r)) 
  |> result.flat_map(fn r => validate_range(r, 1, 100)) 
  |> result.map(fn n => string.format("valid: {}", n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:21:22
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                      ^
error: Expected LParen at line 21:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:21:27
   |
21 |   |> result.flat_map(fn r => validate_positive(r))
   |                           ^
error: Expected LParen at line 22:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:22:27
   |
22 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 23:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-1.almd:23:22
   |
23 |   |> result.map(fn n => string.format("valid: {}", n))
   |                      ^
error[E003]: undefined variable 'format'
  --> /tmp/dojo-result-pipeline-1.almd:10:18
  in variable format
  hint: Check the variable name
   |
10 |     false => err(format!("must be positive: {}", n))
   |                  ^^^^^^
error[E003]: undefined variable 'format'
  --> /tmp/dojo-result-pipeline-1.almd:16:18
  in variable format
  hint: Check the variable name
   |
16 |     false => err(format!("out of range: {}", n))
   |                  ^^^^^^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match (n > 0) {
    true => ok(n)
    false => err(string.format("must be positive: {}", n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match (lo <= n and n <= hi) {
    true => ok(n)
    false => err(string.format("out of range: {}", n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map((fn r => validate_positive(r))) 
  |> result.flat_map((fn r => validate_range(r, 1, 100))) 
  |> result.map((fn n => string.format("valid: {}", int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 21:23 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:21:23
   |
21 |   |> result.flat_map((fn r => validate_positive(r)))
   |                       ^
error: Expected LParen at line 21:28 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:21:28
   |
21 |   |> result.flat_map((fn r => validate_positive(r)))
   |                            ^
error: Expected LParen at line 22:28 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:22:28
   |
22 |   |> result.flat_map((fn r => validate_range(r, 1, 100)))
   |                            ^
error: Expected LParen at line 23:23 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:23:23
   |
23 |   |> result.map((fn n => string.format("valid: {}", int.to_string(n))))
   |                       ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-2.almd:10:56
  in call to string.format()
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
10 |     false => err(string.format("must be positive: {}", n))
   |                                                        ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-2.almd:16:52
  in call to string.format()
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
16 |     false => err(string.format("out of range: {}", n))
   |                                                    ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n)
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if (n > 0) 
    then ok(n) 
    else err(string.format("must be positive: {}", n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if (lo <= n and n <= hi) 
    then ok(n) 
    else err(string.format("out of range: {}", n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(validate_positive) 
  |> result.flat_map(fn r => validate_range(r, 1, 100)) 
  |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 20:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:20:22
   |
20 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                      ^
error: Expected LParen at line 20:27 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:20:27
   |
20 |   |> result.flat_map(fn r => validate_range(r, 1, 100))
   |                           ^
error: Expected LParen at line 21:22 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:21:22
   |
21 |   |> result.map(fn n => string.format("valid: {}", int.to_string(n)))
   |                      ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:10:52
  in call to string.format()
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
10 |     else err(string.format("must be positive: {}", n))
   |                                                    ^
error[E002]: undefined function 'string.format'
  --> /tmp/dojo-result-pipeline-3.almd:15:48
  in call to string.format()
  hint: No function 'format' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
15 |     else err(string.format("out of range: {}", n))
   |                                                ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
