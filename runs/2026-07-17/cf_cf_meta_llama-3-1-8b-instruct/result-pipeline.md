# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_e| s + " is not a number")

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).and_then(validate_positive).and_then(|n| validate_range(n, 1, 100)).map(|n| "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '|x|' closure syntax is not valid in Almide at line 1:71
  --> /tmp/dojo-result-pipeline-0.almd:1:71
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_e| s + " is not a number")
  |                                                                       ^
error: '&&' is not valid in Almide at line 7:14
  --> /tmp/dojo-result-pipeline-0.almd:7:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: '|x|' closure syntax is not valid in Almide at line 10:57
  --> /tmp/dojo-result-pipeline-0.almd:10:57
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
10 |   parse_int(input).and_then(validate_positive).and_then(|n| validate_range(n, 1, 100)).map(|n| "valid: " + int.to_string(n))
   |                                                         ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_e| s + " is not a number")

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).and_then(validate_positive).and_then(validate_range(1, 100)).map(|n| "valid: " + int.to_string(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '|x|' closure syntax is not valid in Almide at line 1:71
  --> /tmp/dojo-result-pipeline-1.almd:1:71
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
1 | fn parse_int(s: String) -> Result[Int, String] = int.parse(s).map_err(|_e| s + " is not a number")
  |                                                                       ^
error: '&&' is not valid in Almide at line 7:14
  --> /tmp/dojo-result-pipeline-1.almd:7:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: '|x|' closure syntax is not valid in Almide at line 10:85
  --> /tmp/dojo-result-pipeline-1.almd:10:85
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
10 |   parse_int(input).and_then(validate_positive).and_then(validate_range(1, 100)).map(|n| "valid: " + int.to_string(n))
   |                                                                                     ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|_e| s + " is not a number")

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).and_then(validate_positive).and_then(validate_range(1, 100)).map(|n| "valid: " + int.to_string(n)).map_err(|err| err)
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-2.almd:2:24
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|_e| s + " is not a number")
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-2.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: '|x|' closure syntax is not valid in Almide at line 11:85
  --> /tmp/dojo-result-pipeline-2.almd:11:85
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
11 |   parse_int(input).and_then(validate_positive).and_then(validate_range(1, 100)).map(|n| "valid: " + int.to_string(n)).map_err(|err| err)
   |                                                                                     ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s).map_err(|_e| s + " is not a number")

fn validate_positive(n: Int) -> Result[Int, String] = 
  if n > 0 then ok(n) else err("must be positive: " + int.to_string(n))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))

fn process(input: String) -> Result[String, String] = 
  parse_int(input).and_then(validate_positive).and_then((n) => validate_range(n, 1, 100)).map((n) => "valid: " + int.to_string(n)).map_err(|err| err)
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: '|x|' closure syntax is not valid in Almide at line 2:24
  --> /tmp/dojo-result-pipeline-3.almd:2:24
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   int.parse(s).map_err(|_e| s + " is not a number")
  |                        ^
error: '&&' is not valid in Almide at line 8:14
  --> /tmp/dojo-result-pipeline-3.almd:8:14
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |   if n >= lo && n <= hi then ok(n) else err("out of range: " + int.to_string(n))
  |              ^
error: Expected expression at line 11:140 (got Pipe '|')
  --> /tmp/dojo-result-pipeline-3.almd:11:140
   |
11 |   parse_int(input).and_then(validate_positive).and_then((n) => validate_range(n, 1, 100)).map((n) => "valid: " + int.to_string(n)).map_err(|err| err)
   |                                                                                                                                            ^

3 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
