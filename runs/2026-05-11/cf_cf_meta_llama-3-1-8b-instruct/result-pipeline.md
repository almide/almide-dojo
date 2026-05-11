# result-pipeline

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] {
    int.parse(s).map_err(|_| format!("not a number: {}", s))
}

fn validate_positive(n: Int) -> Result[Int, String] {
    if n > 0 {
        Ok(n)
    } else {
        Err(format!("must be positive: {}", n))
    }
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] {
    if lo <= n && n <= hi {
        Ok(n)
    } else {
        Err(format!("out of range: {}", n))
    }
}

fn process(input: String) -> Result[String, String] {
    parse_int(input)
        .flat_map(|n| validate_positive(n))
        .flat_map(|n| validate_range(n, 1, 100))
        .map(|n| format!("valid: {}", int.to_string(n)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-0.almd
error: Missing '=' before function body at line 1:48
  --> /tmp/dojo-result-pipeline-0.almd:1:48
  hint: Almide requires '=' before the body. Write: fn parse_int(...) -> Type = { ... }
  |
1 | fn parse_int(s: String) -> Result[Int, String] {
  |                                                ^
error: Missing '=' before function body at line 5:53
  --> /tmp/dojo-result-pipeline-0.almd:5:53
  hint: Almide requires '=' before the body. Write: fn validate_positive(...) -> Type = { ... }
  |
5 | fn validate_positive(n: Int) -> Result[Int, String] {
  |                                                     ^
error: Missing '=' before function body at line 13:68
  --> /tmp/dojo-result-pipeline-0.almd:13:68
  hint: Almide requires '=' before the body. Write: fn validate_range(...) -> Type = { ... }
   |
13 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] {
   |                                                                    ^
error: Missing '=' before function body at line 21:53
  --> /tmp/dojo-result-pipeline-0.almd:21:53
  hint: Almide requires '=' before the body. Write: fn process(...) -> Type = { ... }
   |
21 | fn process(input: String) -> Result[String, String] {
   |                                                     ^

4 error(s) found
Compile error for /tmp/dojo-result-pipeline-0.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = {
    int.parse(s).map_err(|_| format!("not a number: {}", s))
}

fn validate_positive(n: Int) -> Result[Int, String] = {
    if n > 0 {
        Ok(n)
    } else {
        Err(format!("must be positive: {}", n))
    }
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
    if lo < n && n < hi {
        Ok(n)
    } else {
        Err(format!("out of range: {}", n))
    }
}

fn process(input: String) -> Result[String, String] = {
    parse_int(input)
        .flat_map(|n| validate_positive(n))
        .flat_map(|n| validate_range(n, 1, 100))
        .map(|n| format!("valid: {}", int.to_string(n)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:26
  --> /tmp/dojo-result-pipeline-1.almd:2:26
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     int.parse(s).map_err(|_| format!("not a number: {}", s))
  |                          ^
error: Expected Then at line 6:14 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-1.almd:6:14
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if n > 0 {
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-result-pipeline-1.almd:8:7
  |
8 |     } else {
  |       ^
error: '&&' is not valid in Almide at line 14:15
  --> /tmp/dojo-result-pipeline-1.almd:14:15
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |     if lo < n && n < hi {
   |               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:7 (got Else 'else')
  --> /tmp/dojo-result-pipeline-1.almd:16:7
   |
16 |     } else {
   |       ^
error: Expected expression at line 23:9 (got Dot '.')
  --> /tmp/dojo-result-pipeline-1.almd:23:9
   |
23 |         .flat_map(|n| validate_positive(n))
   |         ^
error[E001]: type mismatch in fn 'parse_int': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-1.almd:1:50
  in fn 'parse_int'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
  |
1 | fn parse_int(s: String) -> Result[Int, String] = {
  |                                                  ^
error[E001]: type mismatch in fn 'validate_positive': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-1.almd:5:55
  in fn 'validate_positive'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
  |
5 | fn validate_positive(n: Int) -> Result[Int, String] = {
  |                                                       ^
error[E001]: type mismatch in fn 'validate_range': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-1.almd:13:70
  in fn 'validate_range'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
   |
13 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
   |                                                                      ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Unit
  --> /tmp/dojo-result-pipeline-1.almd:22:15
  in fn 'process'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[String, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[String, String]
   |
22 |     parse_int(input)
   |               ^^^^^

10 error(s) found
Compile error for /tmp/dojo-result-pipeline-1.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = {
    int.parse(s).map_err(|_| format!("not a number: {}", s))
}

fn validate_positive(n: Int) -> Result[Int, String] = {
    if n > 0 {
        Ok(n)
    } else {
        Err(format!("must be positive: {}", n))
    }
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
    if lo <= n && n <= hi {
        Ok(n)
    } else {
        Err(format!("out of range: {}", n))
    }
}

fn process(input: String) -> Result[String, String] = {
    parse_int(input)
        .flat_map(|n| validate_positive(n))
        .flat_map(|n| validate_range(n, 1, 100))
        .map(|n| format!("valid: {}", int.to_string(n)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:26
  --> /tmp/dojo-result-pipeline-2.almd:2:26
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     int.parse(s).map_err(|_| format!("not a number: {}", s))
  |                          ^
error: Expected Then at line 6:14 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-2.almd:6:14
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if n > 0 {
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-result-pipeline-2.almd:8:7
  |
8 |     } else {
  |       ^
error: '&&' is not valid in Almide at line 14:16
  --> /tmp/dojo-result-pipeline-2.almd:14:16
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |     if lo <= n && n <= hi {
   |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:7 (got Else 'else')
  --> /tmp/dojo-result-pipeline-2.almd:16:7
   |
16 |     } else {
   |       ^
error: Expected expression at line 23:9 (got Dot '.')
  --> /tmp/dojo-result-pipeline-2.almd:23:9
   |
23 |         .flat_map(|n| validate_positive(n))
   |         ^
error[E001]: type mismatch in fn 'parse_int': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-2.almd:1:50
  in fn 'parse_int'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
  |
1 | fn parse_int(s: String) -> Result[Int, String] = {
  |                                                  ^
error[E001]: type mismatch in fn 'validate_positive': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-2.almd:5:55
  in fn 'validate_positive'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
  |
5 | fn validate_positive(n: Int) -> Result[Int, String] = {
  |                                                       ^
error[E001]: type mismatch in fn 'validate_range': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-2.almd:13:70
  in fn 'validate_range'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
   |
13 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
   |                                                                      ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Unit
  --> /tmp/dojo-result-pipeline-2.almd:22:15
  in fn 'process'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[String, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[String, String]
   |
22 |     parse_int(input)
   |               ^^^^^

10 error(s) found
Compile error for /tmp/dojo-result-pipeline-2.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn parse_int(s: String) -> Result[Int, String] = {
    int.parse(s).map_err(|e| format!("not a number: {}", e))
}

fn validate_positive(n: Int) -> Result[Int, String] = {
    if n > 0 {
        Ok(n)
    } else {
        Err(format!("must be positive: {}", n))
    }
}

fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
    if lo <= n && n <= hi {
        Ok(n)
    } else {
        Err(format!("out of range: {}", n))
    }
}

fn process(input: String) -> Result[String, String] = {
    parse_int(input)
        .flat_map(|n| validate_positive(n))
        .flat_map(|n| validate_range(n, 1, 100))
        .map(|n| format!("valid: {}", int.to_string(n)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-result-pipeline-3.almd
error: '|x|' closure syntax is not valid in Almide at line 2:26
  --> /tmp/dojo-result-pipeline-3.almd:2:26
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     int.parse(s).map_err(|e| format!("not a number: {}", e))
  |                          ^
error: Expected Then at line 6:14 (got LBrace '{')
  --> /tmp/dojo-result-pipeline-3.almd:6:14
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if n > 0 {
  |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-result-pipeline-3.almd:8:7
  |
8 |     } else {
  |       ^
error: '&&' is not valid in Almide at line 14:16
  --> /tmp/dojo-result-pipeline-3.almd:14:16
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
14 |     if lo <= n && n <= hi {
   |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:7 (got Else 'else')
  --> /tmp/dojo-result-pipeline-3.almd:16:7
   |
16 |     } else {
   |       ^
error: Expected expression at line 23:9 (got Dot '.')
  --> /tmp/dojo-result-pipeline-3.almd:23:9
   |
23 |         .flat_map(|n| validate_positive(n))
   |         ^
error[E001]: type mismatch in fn 'parse_int': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-3.almd:1:50
  in fn 'parse_int'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
  |
1 | fn parse_int(s: String) -> Result[Int, String] = {
  |                                                  ^
error[E001]: type mismatch in fn 'validate_positive': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-3.almd:5:55
  in fn 'validate_positive'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
  |
5 | fn validate_positive(n: Int) -> Result[Int, String] = {
  |                                                       ^
error[E001]: type mismatch in fn 'validate_range': expected Result[Int, String] but got Unit
  --> /tmp/dojo-result-pipeline-3.almd:13:70
  in fn 'validate_range'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[Int, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[Int, String]
   |
13 | fn validate_range(n: Int, lo: Int, hi: Int) -> Result[Int, String] = {
   |                                                                      ^
error[E001]: type mismatch in fn 'process': expected Result[String, String] but got Unit
  --> /tmp/dojo-result-pipeline-3.almd:22:15
  in fn 'process'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Result[String, String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Result[String, String]
   |
22 |     parse_int(input)
   |               ^^^^^

10 error(s) found
Compile error for /tmp/dojo-result-pipeline-3.almd:
compile failed
FAILED: /tmp/dojo-result-pipeline-3.almd

1/1 test file(s) failed

```
