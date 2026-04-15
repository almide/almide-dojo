# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected ')' to close function call opened at line 11:18
  --> /tmp/dojo-result-pipeline-0.almd:16:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 |   result.flat_map(parse_int(input), (n) =>
   |                  --------------- '(' opened here
...
16 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^
error: Expected ')' to close function call opened at line 11:18 at line 16:1
  --> /tmp/dojo-result-pipeline-0.almd:11:18
   |
11 |   result.flat_map(parse_int(input), (n) =>
   |                  ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:22:59
  in call to validate_range()
  hint: Check the function name
   |
22 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:23:61
  in call to validate_range()
  hint: Check the function name
   |
23 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:24:60
  in call to validate_range()
  hint: Check the function name
   |
24 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:25:42
  in call to process()
  hint: Check the function name
   |
25 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:26:50
  in call to process()
  hint: Check the function name
   |
26 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:27:45
  in call to process()
  hint: Check the function name
   |
27 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:28:49
  in call to process()
  hint: Check the function name
   |
28 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:29:47
  in call to process()
  hint: Check the function name
   |
29 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:30:49
  in call to process()
  hint: Check the function name
   |
30 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

12 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => "valid: " + int.to_string(n))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected ')' to close function call opened at line 11:18
  --> /tmp/dojo-result-pipeline-1.almd:16:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 |   result.flat_map(parse_int(input), (n) =>
   |                  --------------- '(' opened here
...
16 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^
error: Expected ')' to close function call opened at line 11:18 at line 16:1
  --> /tmp/dojo-result-pipeline-1.almd:11:18
   |
11 |   result.flat_map(parse_int(input), (n) =>
   |                  ^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:25:42
  in call to process()
  hint: Check the function name
   |
25 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:26:50
  in call to process()
  hint: Check the function name
   |
26 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:27:45
  in call to process()
  hint: Check the function name
   |
27 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:28:49
  in call to process()
  hint: Check the function name
   |
28 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:29:47
  in call to process()
  hint: Check the function name
   |
29 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:30:49
  in call to process()
  hint: Check the function name
   |
30 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

8 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(
    int.parse(input), 
    (n) => result.flat_map(
      validate_positive(n), 
      (n) => result.flat_map(
        validate_range(n, 1, 100), 
        (n) => result.map(ok(n), (n) => "valid: " + int.to_string(n))
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(
    parse_int(input), 
    (n) => result.flat_map(
      validate_positive(n), 
      (n) => result.flat_map(
        validate_range(n, 1, 100), 
        (n) => result.map(ok(n), (x) => "valid: " + int.to_string(x))
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
