# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
    let words = string.split(s, " ")
    string.join(
        words.map(
            (word) => string.capitalize(string.to_lower(word))
        )
    , " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-title-case-0.almd:7:5
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     string.join(
  |                --------------- '(' opened here
...
7 |     , " ")
  |     ^
error[E001]: type mismatch in fn 'title_case': expected String but got Unit
  --> /tmp/dojo-title-case-0.almd:2:33
  in fn 'title_case'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |     let words = string.split(s, " ")
  |                                 ^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
    let words = string.split(s, " ")
    string.join(
        words.map(
            (word) => string.capitalize(string.to_lower(word))
        )
    , " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-title-case-1.almd:7:5
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     string.join(
  |                --------------- '(' opened here
...
7 |     , " ")
  |     ^
error[E001]: type mismatch in fn 'title_case': expected String but got Unit
  --> /tmp/dojo-title-case-1.almd:2:33
  in fn 'title_case'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |     let words = string.split(s, " ")
  |                                 ^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
    string.join(
        string.split(s, " ").map(
            (word) => string.capitalize(string.to_lower(word))
        )
    , " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error: Expected ')' to close function call opened at line 2:16
  --> /tmp/dojo-title-case-2.almd:6:5
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.join(
  |                --------------- '(' opened here
...
6 |     , " ")
  |     ^

1 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
    string.join(
        string.split(s, " ").map(
            (word) => string.capitalize(string.to_lower(word))
        )
    , " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error: Expected ')' to close function call opened at line 2:16
  --> /tmp/dojo-title-case-3.almd:6:5
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |     string.join(
  |                --------------- '(' opened here
...
6 |     , " ")
  |     ^

1 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
