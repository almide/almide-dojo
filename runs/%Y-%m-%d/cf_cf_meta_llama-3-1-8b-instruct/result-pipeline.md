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
    ok(x) => ok(x),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(s"must be positive: $n")

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err(s"out of range: $n")

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => s"valid: $x")
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Expected ')' to close err() opened at line 8:31
  --> /tmp/dojo-result-pipeline-0.almd:8:33
  hint: Add ')' or check for a missing delimiter inside the err()
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                               --------------- '(' opened here
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                                 ^^^^^^^^^^^^^^^^^^^^^^
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-0.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if lo <= n && n <= hi then ok(n) else err(s"out of range: $n")
   |              ^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:15:22
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:15:24
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:16:24
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:17:19
   |
17 |   |> result.map(fn(x) => s"valid: $x")
   |                   ^

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
    ok(x) => ok(x),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(s"must be positive: $n")

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")

fn process(input: String) -> Result[String, String] = 
  parse_int(input) 
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => s"valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected ')' to close err() opened at line 8:31
  --> /tmp/dojo-result-pipeline-1.almd:8:33
  hint: Add ')' or check for a missing delimiter inside the err()
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                               --------------- '(' opened here
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                                 ^^^^^^^^^^^^^^^^^^^^^^
error: Expected ')' to close err() opened at line 11:45
  --> /tmp/dojo-result-pipeline-1.almd:11:47
  hint: Add ')' or check for a missing delimiter inside the err()
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                             --------------- '(' opened here
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                               ^^^^^^^^^^^^^^^^^^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:15:22
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:15:24
   |
15 |   |> result.flat_map(fn(x) => validate_positive(x))
   |                        ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:16:24
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:17:19
   |
17 |   |> result.map(fn(x) => s"valid: " + int.to_string(x))
   |                   ^

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
    ok(x) => ok(x),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(s"must be positive: $n")

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => match r {
    ok(x) => validate_positive(x),
    err(e) => err(e)
  })
  |> result.flat_map(fn(r) => match r {
    ok(x) => validate_range(x, 1, 100),
    err(e) => err(e)
  })
  |> result.map(fn(r) => match r {
    ok(x) => s"valid: " + int.to_string(x),
    err(e) => e
  })
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected ')' to close err() opened at line 8:31
  --> /tmp/dojo-result-pipeline-2.almd:8:33
  hint: Add ')' or check for a missing delimiter inside the err()
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                               --------------- '(' opened here
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                                 ^^^^^^^^^^^^^^^^^^^^^^
error: Expected ')' to close err() opened at line 11:45
  --> /tmp/dojo-result-pipeline-2.almd:11:47
  hint: Add ')' or check for a missing delimiter inside the err()
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                             --------------- '(' opened here
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                               ^^^^^^^^^^^^^^^^^^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:15:22
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:15:24
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 19:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:19:24
   |
19 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:23:19
   |
23 |   |> result.map(fn(r) => match r {
   |                   ^

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
    ok(x) => ok(x),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(s"must be positive: $n")

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn(r) => match r {
    ok(x) => validate_positive(x),
    err(e) => err(e)
  })
  |> result.flat_map(fn(r) => match r {
    ok(x) => validate_range(x, 1, 100),
    err(e) => err(e)
  })
  |> result.map(fn(r) => match r {
    ok(x) => s"valid: " + int.to_string(x),
    err(e) => e
  })

fn process(input: String) -> Result[String,
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected ')' to close err() opened at line 8:31
  --> /tmp/dojo-result-pipeline-3.almd:8:33
  hint: Add ')' or check for a missing delimiter inside the err()
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                               --------------- '(' opened here
  |
8 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                                 ^^^^^^^^^^^^^^^^^^^^^^
error: Expected ')' to close err() opened at line 11:45
  --> /tmp/dojo-result-pipeline-3.almd:11:47
  hint: Add ')' or check for a missing delimiter inside the err()
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                             --------------- '(' opened here
   |
11 |   if lo <= n and n <= hi then ok(n) else err(s"out of range: $n")
   |                                               ^^^^^^^^^^^^^^^^^^
error: Expected expression at line 15:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:15:22
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                      ^
error: Expected function name at line 15:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:15:24
   |
15 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 19:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:19:24
   |
19 |   |> result.flat_map(fn(r) => match r {
   |                        ^
error: Expected function name at line 23:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:23:19
   |
23 |   |> result.map(fn(r) => match r {
   |                   ^
error: Expected type name at line 28:44 (got Newline '')
  --> /tmp/dojo-result-pipeline-3.almd:28:44
   |
28 | fn process(input: String) -> Result[String,
   |                                            ^

7 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
