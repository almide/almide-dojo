# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
def parse_int(s: String): Result[Int, String] = int.parse(s)

def validate_positive(n: Int): Result[Int, String] = 
  if n > 0 then ok(n) else err(s"must be positive: $n")

def validate_range(n: Int, lo: Int, hi: Int): Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err(s"out of range: $n")

def process(input: String): Result[String, String] = 
  parse_int(input).flat_map(n => 
    validate_positive(n).flat_map(n => 
      validate_range(n, 1, 100).map(n => 
        s"valid: $n"
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-result-pipeline-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def parse_int(s: String): Result[Int, String] = int.parse(s)
  | ^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-0.almd:18:46
  in call to parse_int()
  hint: Check the function name
   |
18 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   |                                              ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-0.almd:19:49
  in call to parse_int()
  hint: Check the function name
   |
19 | test "parse_int negative" { assert_eq(parse_int("-5"), ok(-5)) }
   |                                                 ^^^^
error[E002]: undefined function 'parse_int'
  --> /tmp/dojo-result-pipeline-0.almd:20:48
  in call to parse_int()
  hint: Check the function name
   |
20 | test "parse_int invalid" { assert_eq(parse_int("abc"), err("not a number: abc")) }
   |                                                ^^^^^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-0.almd:21:59
  in call to validate_positive()
  hint: Check the function name
   |
21 | test "validate_positive ok" { assert_eq(validate_positive(5), ok(5)) }
   |                                                           ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-0.almd:22:61
  in call to validate_positive()
  hint: Check the function name
   |
22 | test "validate_positive zero" { assert_eq(validate_positive(0), err("must be positive: 0")) }
   |                                                             ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-0.almd:23:66
  in call to validate_positive()
  hint: Check the function name
   |
23 | test "validate_positive negative" { assert_eq(validate_positive(-1), err("must be positive: -1")) }
   |                                                                  ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:24:59
  in call to validate_range()
  hint: Check the function name
   |
24 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:25:61
  in call to validate_range()
  hint: Check the function name
   |
25 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-0.almd:26:60
  in call to validate_range()
  hint: Check the function name
   |
26 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:27:42
  in call to process()
  hint: Check the function name
   |
27 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:28:50
  in call to process()
  hint: Check the function name
   |
28 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:29:45
  in call to process()
  hint: Check the function name
   |
29 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:30:49
  in call to process()
  hint: Check the function name
   |
30 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:31:47
  in call to process()
  hint: Check the function name
   |
31 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-0.almd:32:49
  in call to process()
  hint: Check the function name
   |
32 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

16 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err(s"must be positive: $n")

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err(s"out of range: $n")

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map(n => 
    validate_positive(n).flat_map(n => 
      validate_range(n, 1, 100).map(n => 
        s"valid: ${int.to_string(n)}"
      )
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected ')' to close err() opened at line 4:31
  --> /tmp/dojo-result-pipeline-1.almd:4:33
  hint: Add ')' or check for a missing delimiter inside the err()
  |
4 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                               --------------- '(' opened here
  |
4 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                                 ^^^^^^^^^^^^^^^^^^^^^^
error: Expected ')' to close err() opened at line 4:31 at line 4:33
  --> /tmp/dojo-result-pipeline-1.almd:4:31
  |
4 |   if n > 0 then ok(n) else err(s"must be positive: $n")
  |                               ^
error: '&&' is not valid in Almide at line 7:14
  --> /tmp/dojo-result-pipeline-1.almd:7:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |   if lo <= n && n <= hi then ok(n) else err(s"out of range: $n")
  |              ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-result-pipeline-1.almd:10:31
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
10 |   parse_int(input).flat_map(n =>
   |                               ^^
error: Lambda parameter must be wrapped in parentheses at line 10:31
  --> /tmp/dojo-result-pipeline-1.almd:10:31
   |
10 |   parse_int(input).flat_map(n =>
   |                               ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-1.almd:21:59
  in call to validate_positive()
  hint: Check the function name
   |
21 | test "validate_positive ok" { assert_eq(validate_positive(5), ok(5)) }
   |                                                           ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-1.almd:22:61
  in call to validate_positive()
  hint: Check the function name
   |
22 | test "validate_positive zero" { assert_eq(validate_positive(0), err("must be positive: 0")) }
   |                                                             ^
error[E002]: undefined function 'validate_positive'
  --> /tmp/dojo-result-pipeline-1.almd:23:66
  in call to validate_positive()
  hint: Check the function name
   |
23 | test "validate_positive negative" { assert_eq(validate_positive(-1), err("must be positive: -1")) }
   |                                                                  ^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:24:59
  in call to validate_range()
  hint: Check the function name
   |
24 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:25:61
  in call to validate_range()
  hint: Check the function name
   |
25 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /tmp/dojo-result-pipeline-1.almd:26:60
  in call to validate_range()
  hint: Check the function name
   |
26 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:27:42
  in call to process()
  hint: Check the function name
   |
27 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:28:50
  in call to process()
  hint: Check the function name
   |
28 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:29:45
  in call to process()
  hint: Check the function name
   |
29 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:30:49
  in call to process()
  hint: Check the function name
   |
30 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:31:47
  in call to process()
  hint: Check the function name
   |
31 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /tmp/dojo-result-pipeline-1.almd:32:49
  in call to process()
  hint: Check the function name
   |
32 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

17 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map((n) => 
    validate_positive(n).flat_map((n) => 
      validate_range(n, 1, 100).map((n) => 
        "valid: " + int.to_string(n)
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
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map((n) => 
    validate_positive(n).flat_map((n) => 
      validate_range(n, 1, 100).map((n) => "valid: " + int.to_string(n))
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
