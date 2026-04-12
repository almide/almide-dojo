# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd
error: Expected ')' to close parenthesized expression opened at line 5:12
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:5:14
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   else err((s"must be positive: $n"))
  |            --------------- '(' opened here
  |
5 |   else err((s"must be positive: $n"))
  |              ^^^^^^^^^^^^^^^^^^^^^^
error: Expected ')' to close parenthesized expression opened at line 5:12 at line 5:14
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:5:12
  |
5 |   else err((s"must be positive: $n"))
  |            ^
error: Expected ')' to close parenthesized expression opened at line 9:12
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:9:14
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
9 |   else err((s"out of range: $n"))
  |            --------------- '(' opened here
  |
9 |   else err((s"out of range: $n"))
  |              ^^^^^^^^^^^^^^^^^^
error: Expected ')' to close parenthesized expression opened at line 9:12 at line 9:14
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:9:12
  |
9 |   else err((s"out of range: $n"))
  |            ^
error: Missing ',' between function arguments at line 12:113
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:12:113
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
12 |   parse_int(input).flat_map((n) => validate_positive(n)).flat_map((n) => validate_range(n, 1, 100)).map((n) => s"valid: ${int.to_string(n)}")
   |                                                                                                                 ^
error[E002]: undefined function 'validate_positive'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:17:59
  in call to validate_positive()
  hint: Check the function name
   |
17 | test "validate_positive ok" { assert_eq(validate_positive(5), ok(5)) }
   |                                                           ^
error[E002]: undefined function 'validate_positive'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:18:61
  in call to validate_positive()
  hint: Check the function name
   |
18 | test "validate_positive zero" { assert_eq(validate_positive(0), err("must be positive: 0")) }
   |                                                             ^
error[E002]: undefined function 'validate_positive'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:19:66
  in call to validate_positive()
  hint: Check the function name
   |
19 | test "validate_positive negative" { assert_eq(validate_positive(-1), err("must be positive: -1")) }
   |                                                                  ^
error[E002]: undefined function 'validate_range'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:20:59
  in call to validate_range()
  hint: Check the function name
   |
20 | test "validate_range in" { assert_eq(validate_range(5, 1, 10), ok(5)) }
   |                                                           ^^
error[E002]: undefined function 'validate_range'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:21:61
  in call to validate_range()
  hint: Check the function name
   |
21 | test "validate_range out" { assert_eq(validate_range(15, 1, 10), err("out of range: 15")) }
   |                                                             ^^
error[E002]: undefined function 'validate_range'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:22:60
  in call to validate_range()
  hint: Check the function name
   |
22 | test "validate_range low" { assert_eq(validate_range(0, 1, 10), err("out of range: 0")) }
   |                                                            ^^
error[E002]: undefined function 'process'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:23:42
  in call to process()
  hint: Check the function name
   |
23 | test "process valid" { assert_eq(process("42"), ok("valid: 42")) }
   |                                          ^^^^
error[E002]: undefined function 'process'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:24:50
  in call to process()
  hint: Check the function name
   |
24 | test "process invalid parse" { assert_eq(process("abc"), err("not a number: abc")) }
   |                                                  ^^^^^
error[E002]: undefined function 'process'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:25:45
  in call to process()
  hint: Check the function name
   |
25 | test "process negative" { assert_eq(process("-5"), err("must be positive: -5")) }
   |                                             ^^^^
error[E002]: undefined function 'process'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:26:49
  in call to process()
  hint: Check the function name
   |
26 | test "process out of range" { assert_eq(process("200"), err("out of range: 200")) }
   |                                                 ^^^^^
error[E002]: undefined function 'process'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:27:47
  in call to process()
  hint: Check the function name
   |
27 | test "process boundary 1" { assert_eq(process("1"), ok("valid: 1")) }
   |                                               ^^^
error[E002]: undefined function 'process'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:28:49
  in call to process()
  hint: Check the function name
   |
28 | test "process boundary 100" { assert_eq(process("100"), ok("valid: 100")) }
   |                                                 ^^^^^

17 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-result-pipeline-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n)
  else err((s"must be positive: $n"))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n and n <= hi then ok(n)
  else err((s"out of range: $n"))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).flat_map((n) => validate_positive(n)).flat_map((n) => validate_range(n, 1, 100)).map((n) => s"valid: ${int.to_string(n)}")
```
