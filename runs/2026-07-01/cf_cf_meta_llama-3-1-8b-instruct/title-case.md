# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
    string.split(s, " ")
        .map(string.capitalize)
        .map(string.to_lower)
        .map(string.trim)
        .filter(x => !string.is_empty(x))
        .join(" ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-title-case-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn title_case(...) -> Type = { ... }
  |
1 | fn title_case(s: String) -> String {
  |                                    ^

1 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = {
    string.split(s, " ")
        .map(string.capitalize)
        .map(string.to_lower)
        .filter(x => !string.is_empty(x))
        .join(" ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-title-case-1.almd:3:9
  |
3 |         .map(string.capitalize)
  |         ^
error[E001]: type mismatch in fn 'title_case': expected String but got Unit
  --> /tmp/dojo-title-case-1.almd:2:21
  in fn 'title_case'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |     string.split(s, " ")
  |                     ^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
    let words = string.split(s, " ")
    let capitalized = words.map(string.capitalize)
    let lowercased = capitalized.map(string.to_lower)
    let filtered = lowercased.filter(x => !string.is_empty(x))
    filtered.join(" ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-title-case-2.almd:5:40
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |     let filtered = lowercased.filter(x => !string.is_empty(x))
  |                                        ^^
error[E003]: undefined variable 'filtered'
  --> /tmp/dojo-title-case-2.almd:6:5
  in variable filtered
  hint: Check the variable name
  |
6 |     filtered.join(" ")
  |     ^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = {
    let words = string.split(s, " ")
    let capitalized = words.map(string.capitalize)
    let lowercased = capitalized.map(string.to_lower)
    let filtered = lowercased.filter((x) => !string.is_empty(x))
    filtered.join(" ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error: '!' is not valid in Almide at line 5:45
  --> /tmp/dojo-title-case-3.almd:5:45
  hint: Use 'not' for boolean negation. Write: not x
  |
5 |     let filtered = lowercased.filter((x) => !string.is_empty(x))
  |                                             ^
error[E003]: undefined variable 'filtered'
  --> /tmp/dojo-title-case-3.almd:6:5
  in variable filtered
  hint: Check the variable name
  |
6 |     filtered.join(" ")
  |     ^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
