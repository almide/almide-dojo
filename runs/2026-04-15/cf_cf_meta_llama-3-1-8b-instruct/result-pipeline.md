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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n {
    x when x > 0 => ok(x),
    _ => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n {
    x when lo <= x && x <= hi => ok(x),
    _ => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn) {
    validate_positive(_)
    |> result.flat_map(fn) {
      validate_range(_, 1, 100)
      |> result.map(fn) {
        "valid: " + int.to_string(_)
      }
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Expected FatArrow at line 9:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-0.almd:9:7
  |
9 |     x when x > 0 => ok(x),
  |       ^
error: Expected FatArrow at line 15:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-0.almd:15:7
   |
15 |     x when lo <= x && x <= hi => ok(x),
   |       ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:21:22
   |
21 |   |> result.flat_map(fn) {
   |                      ^
error: Expected function name at line 21:24 (got RParen ')')
  --> /tmp/dojo-result-pipeline-0.almd:21:24
   |
21 |   |> result.flat_map(fn) {
   |                        ^
error: Expected function name at line 23:26 (got RParen ')')
  --> /tmp/dojo-result-pipeline-0.almd:23:26
   |
23 |     |> result.flat_map(fn) {
   |                          ^
error: Expected function name at line 25:23 (got RParen ')')
  --> /tmp/dojo-result-pipeline-0.almd:25:23
   |
25 |       |> result.map(fn) {
   |                       ^

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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n {
    x when x > 0 => ok(x),
    _ => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n {
    x when lo <= x && x <= hi => ok(x),
    _ => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn) {
    validate_positive(_)
    |> result.flat_map(fn) {
      validate_range(_, 1, 100)
      |> result.map(fn) {
        "valid: " + int.to_string(_)
      }
    }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected FatArrow at line 9:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-1.almd:9:7
  |
9 |     x when x > 0 => ok(x),
  |       ^
error: Expected FatArrow at line 15:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-1.almd:15:7
   |
15 |     x when lo <= x && x <= hi => ok(x),
   |       ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:21:22
   |
21 |   |> result.flat_map(fn) {
   |                      ^
error: Expected function name at line 21:24 (got RParen ')')
  --> /tmp/dojo-result-pipeline-1.almd:21:24
   |
21 |   |> result.flat_map(fn) {
   |                        ^
error: Expected function name at line 23:26 (got RParen ')')
  --> /tmp/dojo-result-pipeline-1.almd:23:26
   |
23 |     |> result.flat_map(fn) {
   |                          ^
error: Expected function name at line 25:23 (got RParen ')')
  --> /tmp/dojo-result-pipeline-1.almd:25:23
   |
25 |       |> result.map(fn) {
   |                       ^

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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n {
    x when x > 0 => ok(x),
    _ => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n {
    x when lo <= x && x <= hi => ok(x),
    _ => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn res => 
    match res {
      ok(n) => validate_positive(n)
      |> result.flat_map(fn res => 
        match res {
          ok(n) => validate_range(n, 1, 100)
          |> result.map(fn res => 
            match res {
              ok(n) => "valid: " + int.to_string(n),
              _ => "error"
            }
          ),
          _ =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected FatArrow at line 9:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-2.almd:9:7
  |
9 |     x when x > 0 => ok(x),
  |       ^
error: Expected FatArrow at line 15:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-2.almd:15:7
   |
15 |     x when lo <= x && x <= hi => ok(x),
   |       ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:21:22
   |
21 |   |> result.flat_map(fn res =>
   |                      ^
error: Expected LParen at line 21:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:21:29
   |
21 |   |> result.flat_map(fn res =>
   |                             ^
error: Expected LParen at line 24:33 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:24:33
   |
24 |       |> result.flat_map(fn res =>
   |                                 ^
error: Expected LParen at line 27:32 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-2.almd:27:32
   |
27 |           |> result.map(fn res =>
   |                                ^

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
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n {
    x when x > 0 => ok(x),
    _ => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n {
    x when lo <= x && x <= hi => ok(x),
    _ => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> result.flat_map(fn res => 
    match res {
      ok(n) => validate_positive(n)
      |> result.flat_map(fn res => 
        match res {
          ok(n) => validate_range(n, 1, 100)
          |> result.map(fn res => 
            match res {
              ok(n) => "valid: " + int.to_string(n),
              _ => "error"
            }
          ),
          _ =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected FatArrow at line 9:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-3.almd:9:7
  |
9 |     x when x > 0 => ok(x),
  |       ^
error: Expected FatArrow at line 15:7 (got Ident 'when')
  --> /tmp/dojo-result-pipeline-3.almd:15:7
   |
15 |     x when lo <= x && x <= hi => ok(x),
   |       ^
error: Expected expression at line 21:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:21:22
   |
21 |   |> result.flat_map(fn res =>
   |                      ^
error: Expected LParen at line 21:29 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:21:29
   |
21 |   |> result.flat_map(fn res =>
   |                             ^
error: Expected LParen at line 24:33 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:24:33
   |
24 |       |> result.flat_map(fn res =>
   |                                 ^
error: Expected LParen at line 27:32 (got FatArrow '=>')
  --> /tmp/dojo-result-pipeline-3.almd:27:32
   |
27 |           |> result.map(fn res =>
   |                                ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
