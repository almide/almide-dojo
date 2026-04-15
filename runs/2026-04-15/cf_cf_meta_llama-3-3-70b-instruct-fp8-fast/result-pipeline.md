# result-pipeline

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if int.gt(n, 0) 
  then ok(n) 
  else err(string.concat("must be positive: ", int.to_string(n)))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if int.ge(n, lo) && int.le(n, hi) 
  then ok(n) 
  else err(string.concat("out of range: ", int.to_string(n)))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => string.concat("valid: ", int.to_string(n)))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: '&&' is not valid in Almide at line 10:20
  --> /tmp/dojo-result-pipeline-0.almd:10:20
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
10 |   if int.ge(n, lo) && int.le(n, hi)
   |                    ^
error: Expected ')' to close function call opened at line 15:18
  --> /tmp/dojo-result-pipeline-0.almd:20:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   result.flat_map(parse_int(input), (n) =>
   |                  --------------- '(' opened here
...
20 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^
error[E002]: undefined function 'int.gt'
  --> /tmp/dojo-result-pipeline-0.almd:5:16
  in call to int.gt()
  hint: No function 'gt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   if int.gt(n, 0)
  |                ^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-0.almd:7:62
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |   else err(string.concat("must be positive: ", int.to_string(n)))
  |                                                              ^

4 error(s) found
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
  if int.gt(n, 0) 
  then ok(n) 
  else err(string.concat("must be positive: ", int.to_string(n)))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if int.ge(n, lo) and int.le(n, hi) 
  then ok(n) 
  else err(string.concat("out of range: ", int.to_string(n)))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => string.concat("valid: ", int.to_string(n)))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: Expected ')' to close function call opened at line 15:18
  --> /tmp/dojo-result-pipeline-1.almd:20:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   result.flat_map(parse_int(input), (n) =>
   |                  --------------- '(' opened here
...
20 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^
error[E002]: undefined function 'int.gt'
  --> /tmp/dojo-result-pipeline-1.almd:5:16
  in call to int.gt()
  hint: No function 'gt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   if int.gt(n, 0)
  |                ^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-1.almd:7:62
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |   else err(string.concat("must be positive: ", int.to_string(n)))
  |                                                              ^
error[E002]: undefined function 'int.ge'
  --> /tmp/dojo-result-pipeline-1.almd:10:16
  in call to int.ge()
  hint: No function 'ge' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
10 |   if int.ge(n, lo) and int.le(n, hi)
   |                ^^
error[E002]: undefined function 'int.le'
  --> /tmp/dojo-result-pipeline-1.almd:10:34
  in call to int.le()
  hint: No function 'le' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
10 |   if int.ge(n, lo) and int.le(n, hi)
   |                                  ^^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-1.almd:12:58
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |   else err(string.concat("out of range: ", int.to_string(n)))
   |                                                          ^

6 error(s) found
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
  if int.gt(n, 0) 
  then ok(n) 
  else err(string.concat(["must be positive: ", int.to_string(n)]))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if int.gte(n, lo) and int.lte(n, hi) 
  then ok(n) 
  else err(string.concat(["out of range: ", int.to_string(n)]))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => string.concat(["valid: ", int.to_string(n)]))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: Expected ')' to close function call opened at line 15:18
  --> /tmp/dojo-result-pipeline-2.almd:20:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   result.flat_map(parse_int(input), (n) =>
   |                  --------------- '(' opened here
...
20 | test "parse_int valid" { assert_eq(parse_int("42"), ok(42)) }
   | ^^^^
error[E002]: undefined function 'int.gt'
  --> /tmp/dojo-result-pipeline-2.almd:5:16
  in call to int.gt()
  hint: No function 'gt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   if int.gt(n, 0)
  |                ^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-2.almd:7:63
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |   else err(string.concat(["must be positive: ", int.to_string(n)]))
  |                                                               ^
error[E002]: undefined function 'int.gte'
  --> /tmp/dojo-result-pipeline-2.almd:10:17
  in call to int.gte()
  hint: No function 'gte' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
10 |   if int.gte(n, lo) and int.lte(n, hi)
   |                 ^^
error[E002]: undefined function 'int.lte'
  --> /tmp/dojo-result-pipeline-2.almd:10:36
  in call to int.lte()
  hint: No function 'lte' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
10 |   if int.gte(n, lo) and int.lte(n, hi)
   |                                    ^^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-2.almd:12:59
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |   else err(string.concat(["out of range: ", int.to_string(n)]))
   |                                                           ^

6 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = 
  int.parse(s)

fn validate_positive(n: Int) -> Result[Int, String] = 
  if int.gt(n, 0) 
  then ok(n) 
  else err(string.concat(["must be positive: ", int.to_string(n)]))

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = 
  if int.gte(n, lo) and int.lte(n, hi) 
  then ok(n) 
  else err(string.concat(["out of range: ", int.to_string(n)]))

fn process(input: String) -> Result[String, String] = 
  result.flat_map(parse_int(input), (n) => 
    result.flat_map(validate_positive(n), (n) => 
      result.flat_map(validate_range(n, 1, 100), (n) => 
        result.map(ok(n), (n) => string.concat(["valid: ", int.to_string(n)]))))

fn int.gt(a: Int, b: Int) -> Bool = int.sub(a, b) > 0
fn int.gte(a: Int, b: Int) -> Bool = int.sub(a,
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: Missing ',' between function arguments at line 20:1
  --> /tmp/dojo-result-pipeline-3.almd:20:1
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
20 | fn int.gt(a: Int, b: Int) -> Bool = int.sub(a, b) > 0
   | ^
error: Expected LParen at line 20:7 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:20:7
   |
20 | fn int.gt(a: Int, b: Int) -> Bool = int.sub(a, b) > 0
   |       ^
error: Expected LParen at line 21:7 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:21:7
   |
21 | fn int.gte(a: Int, b: Int) -> Bool = int.sub(a,
   |       ^
error[E002]: undefined function 'int.gt'
  --> /tmp/dojo-result-pipeline-3.almd:5:16
  in call to int.gt()
  hint: No function 'gt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   if int.gt(n, 0)
  |                ^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-3.almd:7:63
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |   else err(string.concat(["must be positive: ", int.to_string(n)]))
  |                                                               ^
error[E002]: undefined function 'int.gte'
  --> /tmp/dojo-result-pipeline-3.almd:10:17
  in call to int.gte()
  hint: No function 'gte' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
10 |   if int.gte(n, lo) and int.lte(n, hi)
   |                 ^^
error[E002]: undefined function 'int.lte'
  --> /tmp/dojo-result-pipeline-3.almd:10:36
  in call to int.lte()
  hint: No function 'lte' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
10 |   if int.gte(n, lo) and int.lte(n, hi)
   |                                    ^^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-result-pipeline-3.almd:12:59
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |   else err(string.concat(["out of range: ", int.to_string(n)]))
   |                                                           ^

8 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
