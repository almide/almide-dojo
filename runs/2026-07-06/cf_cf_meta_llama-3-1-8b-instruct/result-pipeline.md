# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_| "not a number: ")

fn validate_positive(n: Int) -> Result[Int, String] = match n {
  some(x) => if x > 0 then ok(x) else err("must be positive: " + int.to_string(x))
  none => err("must be positive: none")
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = match n {
  some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
  none => err("out of range: none")
}

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map(fn(x) => validate_positive(x))
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '|x|' closure syntax is not valid in Almide at line 1:71
  --> /tmp/dojo-result-pipeline-0.almd:1:71
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_| "not a number: ")
  |                                                                       ^
error: '&&' is not valid in Almide at line 9:25
  --> /tmp/dojo-result-pipeline-0.almd:9:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
9 |   some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
  |                         ^
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
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-result-pipeline-0.almd:3:61
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
3 | fn validate_positive(n: Int) -> Result[Int, String] = match n {
  |                                                             ^

7 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = result.map_err(int.parse(s), |err| "not a number: " + err)

fn validate_positive(n: Int) -> Result[Int, String] = match n {
  some(x) => if x > 0 then ok(x) else err("must be positive: " + int.to_string(x))
  none => err("must be positive: none")
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = match n {
  some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
  none => err("out of range: none")
}

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(fn(x) => validate_range(x, 1, 100))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected expression at line 1:79 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-1.almd:1:79
  |
1 | fn parse_int(s: String) -> Result[Int, String] = result.map_err(int.parse(s), |err| "not a number: " + err)
  |                                                                               ^
error: '&&' is not valid in Almide at line 9:25
  --> /tmp/dojo-result-pipeline-1.almd:9:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
9 |   some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
  |                         ^
error: Expected expression at line 16:22 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-1.almd:16:22
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                      ^
error: Expected function name at line 16:24 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:16:24
   |
16 |   |> result.flat_map(fn(x) => validate_range(x, 1, 100))
   |                        ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-1.almd:17:19
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-result-pipeline-1.almd:3:61
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
3 | fn validate_positive(n: Int) -> Result[Int, String] = match n {
  |                                                             ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = result.map_err(int.parse(s), |err| "not a number: " + err)

fn validate_positive(n: Int) -> Result[Int, String] = match n {
  some(x) => if x > 0 then ok(x) else err("must be positive: " + int.to_string(x))
  none => err("must be positive: none")
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = match n {
  some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
  none => err("out of range: none")
}

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(validate_range(1, 100, _))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected expression at line 1:79 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-2.almd:1:79
  |
1 | fn parse_int(s: String) -> Result[Int, String] = result.map_err(int.parse(s), |err| "not a number: " + err)
  |                                                                               ^
error: '&&' is not valid in Almide at line 9:25
  --> /tmp/dojo-result-pipeline-2.almd:9:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
9 |   some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
  |                         ^
error: Expected expression at line 17:17 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-2.almd:17:17
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                 ^
error: Expected function name at line 17:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-2.almd:17:19
   |
17 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-result-pipeline-2.almd:3:61
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
3 | fn validate_positive(n: Int) -> Result[Int, String] = match n {
  |                                                             ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = result.map_err(int.parse(s), |err| "not a number: " + err)

fn validate_positive(n: Int) -> Result[Int, String] = match n {
  some(x) => if x > 0 then ok(x) else err("must be positive: " + int.to_string(x))
  none => err("must be positive: none")
  _ => err("must be positive: none")  // add catch-all
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = match n {
  some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
  none => err("out of range: none")
  _ => err("out of range: none")  // add catch-all
}

fn process(input: String) -> Result[String, String] =
  parse_int(input)
  |> result.flat_map(validate_positive)
  |> result.flat_map(validate_range(1, 100, _))
  |> result.map(fn(x) => "valid: " + int.to_string(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Expected expression at line 1:79 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-3.almd:1:79
  |
1 | fn parse_int(s: String) -> Result[Int, String] = result.map_err(int.parse(s), |err| "not a number: " + err)
  |                                                                               ^
error: '&&' is not valid in Almide at line 10:25
  --> /tmp/dojo-result-pipeline-3.almd:10:25
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |   some(x) => if x >= lo && x <= hi then ok(x) else err("out of range: " + int.to_string(x))
   |                         ^
error: Expected expression at line 19:17 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-3.almd:19:17
   |
19 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                 ^
error: Expected function name at line 19:19 (got LParen '(')
  --> /tmp/dojo-result-pipeline-3.almd:19:19
   |
19 |   |> result.map(fn(x) => "valid: " + int.to_string(x))
   |                   ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
