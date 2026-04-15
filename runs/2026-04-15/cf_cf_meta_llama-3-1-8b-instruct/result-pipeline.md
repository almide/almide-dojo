# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|_| "not a number: " ++ s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map(fn(n) => validate_range(n, 1, 100))
  |> map(fn(n) => "valid: " ++ int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-0.almd:2:24
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|_| "not a number: " ++ s)
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-0.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " ++ int.to_string(n))
  |              ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-result-pipeline-0.almd:13:15
   |
13 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |               ^
error: Expected function name at line 13:17 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:13:17
   |
13 |   |> flat_map(fn(n) => validate_range(n, 1, 100))
   |                 ^
error: Expected function name at line 14:12 (got LParen '(')
  --> /tmp/dojo-result-pipeline-0.almd:14:12
   |
14 |   |> map(fn(n) => "valid: " ++ int.to_string(n))
   |            ^
error: operator '++' has been removed. Use '+' for concatenation
  --> /tmp/dojo-result-pipeline-0.almd:5:70
  in operator ++
  hint: Replace ++ with +
  |
5 |   if n > 0 then ok(n) else err("must be positive: " ++ int.to_string(n))
  |                                                                      ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|e| "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map((n) => validate_range(n, 1, 100))
  |> map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-1.almd:2:24
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|e| "not a number: " + s)
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-1.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error[E002]: undefined function 'flat_map'
  --> /tmp/dojo-result-pipeline-1.almd:12:15
  in call to flat_map()
  hint: Did you mean `float.max`?
   |
12 |   |> flat_map(validate_positive)
   |               ^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'flat_map'
  --> /tmp/dojo-result-pipeline-1.almd:13:43
  in call to flat_map()
  hint: Did you mean `float.max`?
   |
13 |   |> flat_map((n) => validate_range(n, 1, 100))
   |                                           ^^^
error[E002]: undefined function 'map'
  --> /tmp/dojo-result-pipeline-1.almd:14:43
  in call to map()
  hint: Check the function name
   |
14 |   |> map((n) => "valid: " + int.to_string(n))
   |                                           ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|e| "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map((n) => validate_range(n, 1, 100))
  |> map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-2.almd:2:24
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|e| "not a number: " + s)
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-2.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error[E002]: undefined function 'flat_map'
  --> /tmp/dojo-result-pipeline-2.almd:12:15
  in call to flat_map()
  hint: Did you mean `float.max`?
   |
12 |   |> flat_map(validate_positive)
   |               ^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'flat_map'
  --> /tmp/dojo-result-pipeline-2.almd:13:43
  in call to flat_map()
  hint: Did you mean `float.max`?
   |
13 |   |> flat_map((n) => validate_range(n, 1, 100))
   |                                           ^^^
error[E002]: undefined function 'map'
  --> /tmp/dojo-result-pipeline-2.almd:14:43
  in call to map()
  hint: Check the function name
   |
14 |   |> map((n) => "valid: " + int.to_string(n))
   |                                           ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|e| "not a number: " + s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input)
  |> flat_map(validate_positive)
  |> flat_map((n) => validate_range(n, 1, 100))
  |> map((n) => "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-3.almd:2:24
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|e| "not a number: " + s)
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-3.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if lo <= n && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error[E002]: undefined function 'flat_map'
  --> /tmp/dojo-result-pipeline-3.almd:12:15
  in call to flat_map()
  hint: Did you mean `float.max`?
   |
12 |   |> flat_map(validate_positive)
   |               ^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'flat_map'
  --> /tmp/dojo-result-pipeline-3.almd:13:43
  in call to flat_map()
  hint: Did you mean `float.max`?
   |
13 |   |> flat_map((n) => validate_range(n, 1, 100))
   |                                           ^^^
error[E002]: undefined function 'map'
  --> /tmp/dojo-result-pipeline-3.almd:14:43
  in call to map()
  hint: Check the function name
   |
14 |   |> map((n) => "valid: " + int.to_string(n))
   |                                           ^

5 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
