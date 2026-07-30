# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  match int.parse(s) {
    ok(n) => ok(n),
    err(e) => err(e)
  }

fn validate_positive(n: Int) -> Result[Int, String] = 
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo && n <= hi {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, fn(n) => 
    result.flat_map(validate_positive, fn(n) => 
      result.map(validate_range(n, 1, 100), fn(n) => 
        "valid: " + int.to_string(n)
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 14:17
  --> /tmp/dojo-result-pipeline-0.almd:14:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match n >= lo && n <= hi {
   |                 ^
error: Expected expression at line 20:30 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:20:30
   |
20 |   result.flat_map(parse_int, fn(n) =>
   |                              ^
error: Expected function name at line 20:32 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:20:32
   |
20 |   result.flat_map(parse_int, fn(n) =>
   |                                ^
error: Expected function name at line 21:42 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:21:42
   |
21 |     result.flat_map(validate_positive, fn(n) =>
   |                                          ^
error: Expected function name at line 22:47 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:22:47
   |
22 |       result.map(validate_range(n, 1, 100), fn(n) =>
   |                                               ^

5 error(s) found
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
  match n > 0 {
    true => ok(n),
    false => err("must be positive: " + int.to_string(n))
  }

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  match n >= lo && n <= hi {
    true => ok(n),
    false => err("out of range: " + int.to_string(n))
  }

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, (n) => 
    result.flat_map(validate_positive, (n) => 
      result.map(validate_range(n, 1, 100), (n) => 
        "valid: " + int.to_string(n)
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '&&' is not valid in Almide at line 14:17
  --> /tmp/dojo-result-pipeline-1.almd:14:17
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |   match n >= lo && n <= hi {
   |                 ^
error[E005]: argument 'r' expects Result[A, E] but got fn(Int) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-1.almd:23:35
  in call to result.flat_map()
  hint: Fix the argument type
   |
23 |         "valid: " + int.to_string(n)
   |                                   ^
error[E005]: argument 'r' expects Result[A, E] but got fn(String) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-1.almd:23:35
  in call to result.flat_map()
  hint: Fix the argument type
   |
23 |         "valid: " + int.to_string(n)
   |                                   ^
error[E001]: type mismatch in call to result.flat_map(): expected Result[?1, String] but got fn(Int) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-1.almd:23:35
  in call to result.flat_map()
  hint: Fix the expression type or change the expected type
   |
23 |         "valid: " + int.to_string(n)
   |                                   ^
error[E001]: type mismatch in call to result.flat_map(): expected Result[?0, String] but got fn(String) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-1.almd:23:35
  in call to result.flat_map()
  hint: Fix the expression type or change the expected type
   |
23 |         "valid: " + int.to_string(n)
   |                                   ^

5 error(s) found
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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, (r) => 
    result.flat_map(validate_positive, (r) => 
      result.map(validate_range(int.to_int(r), 1, 100), (n) => 
        "valid: " + int.to_string(n)
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: '&&' is not valid in Almide at line 11:14
  --> /tmp/dojo-result-pipeline-2.almd:11:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
   |              ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-result-pipeline-2.almd:16:44
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
16 |       result.map(validate_range(int.to_int(r), 1, 100), (n) =>
   |                                            ^
error[E005]: argument 'r' expects Result[A, E] but got fn(Int) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-2.almd:17:35
  in call to result.flat_map()
  hint: Fix the argument type
   |
17 |         "valid: " + int.to_string(n)
   |                                   ^
error[E005]: argument 'r' expects Result[A, E] but got fn(String) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-2.almd:17:35
  in call to result.flat_map()
  hint: Fix the argument type
   |
17 |         "valid: " + int.to_string(n)
   |                                   ^
error[E001]: type mismatch in call to result.flat_map(): expected Result[?1, String] but got fn(Int) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-2.almd:17:35
  in call to result.flat_map()
  hint: Fix the expression type or change the expected type
   |
17 |         "valid: " + int.to_string(n)
   |                                   ^
error[E001]: type mismatch in call to result.flat_map(): expected Result[?0, String] but got fn(String) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-2.almd:17:35
  in call to result.flat_map()
  hint: Fix the expression type or change the expected type
   |
17 |         "valid: " + int.to_string(n)
   |                                   ^

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
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int, (r) => 
    result.map(r, (n) => 
      result.flat_map(validate_positive, (r) => 
        result.map(r, (n) => 
          result.map(validate_range(n, 1, 100), (n) => 
            "valid: " + int.to_string(n)
          )
        )
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error[E005]: argument 'r' expects Result[A, E] but got fn(Int) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:19:39
  in call to result.flat_map()
  hint: Fix the argument type
   |
19 |             "valid: " + int.to_string(n)
   |                                       ^
error[E005]: argument 'r' expects Result[A, E] but got fn(String) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:19:39
  in call to result.flat_map()
  hint: Fix the argument type
   |
19 |             "valid: " + int.to_string(n)
   |                                       ^
error[E001]: type mismatch in call to result.flat_map(): expected Result[Result[Int, E], ?5] but got fn(Int) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:19:39
  in call to result.flat_map()
  hint: Fix the expression type or change the expected type
   |
19 |             "valid: " + int.to_string(n)
   |                                       ^
error[E001]: type mismatch in call to result.flat_map(): expected Result[Result[?1, E], ?6] but got fn(String) -> Result[Int, String]
  --> /tmp/dojo-result-pipeline-3.almd:19:39
  in call to result.flat_map()
  hint: Fix the expression type or change the expected type
   |
19 |             "valid: " + int.to_string(n)
   |                                       ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Result[Result[Result[String, String], ?5], ?6]
  --> /tmp/dojo-result-pipeline-3.almd:19:39
  in fn 'process'
  hint: Fix the expression type or change the expected type
   |
19 |             "valid: " + int.to_string(n)
   |                                       ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
