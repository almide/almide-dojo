# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
    let words = string.split(s, " ");
    let capitalized = words.map(string.capitalize);
    string.join(capitalized, " ")
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
    let words = string.split(s, " ");
    let capitalized = words.map(string.capitalize);
    string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
    let words = string.split(s, " ");
    let capitalized = words.map(string.capitalize);
    string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = {
    let words = string.split(s, " ");
    let capitalized = words.map(string.capitalize(_));
    string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error[E005]: argument 'f' expects fn(String) -> B but got String
  --> /tmp/dojo-title-case-3.almd:3:23
  in call to list.map()
  hint: Fix the argument type
  |
3 |     let capitalized = words.map(string.capitalize(_));
  |                       ^^^^^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got String
  --> /tmp/dojo-title-case-3.almd:3:23
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     let capitalized = words.map(string.capitalize(_));
  |                       ^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
