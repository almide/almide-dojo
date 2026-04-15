# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
  let words = s.split(" ")
  let capitalized_words = words.map((word) => word.capitalize())
  let joined_string = capitalized_words.join(" ")
  joined_string
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
  let words = s.split(" ")
  let capitalized_words = words.map((word) => word.capitalize())
  let joined_string = capitalized_words.join(" ")
  joined_string
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error[E005]: argument 'f' expects fn(String) -> B but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-title-case-1.almd:3:27
  in call to list.map()
  hint: Fix the argument type
  |
3 |   let capitalized_words = words.map((word) => word.capitalize())
  |                           ^^^^^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-title-case-1.almd:3:27
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |   let capitalized_words = words.map((word) => word.capitalize())
  |                           ^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = s.split(" ")
  let capitalized_words = words.map((word) => {
    let capitalized = word.capitalize()
    let lower = word.to_lower()
    if capitalized == lower {
      lower
    } else {
      capitalized
    }
  })
  let joined_string = capitalized_words.join(" ")
  joined_string
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error: Expected Then at line 6:29 (got LBrace '{')
  --> /tmp/dojo-title-case-2.almd:6:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if capitalized == lower {
  |                             ^
error: Expected ')' to close function call opened at line 3:36
  --> /tmp/dojo-title-case-2.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let capitalized_words = words.map((word) => {
  |                                    --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-title-case-2.almd:11:3
   |
11 |   })
   |   ^
error[E003]: undefined variable 'capitalized'
  --> /tmp/dojo-title-case-2.almd:9:7
  in variable capitalized
  hint: Check the variable name
  |
9 |       capitalized
  |       ^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = s.split(" ")
  let capitalized_words = words.map((word) => {
    let capitalized = word.capitalize()
    let lower = word.to_lower()
    if capitalized == lower {
      lower
    } else {
      capitalized
    }
  })
  let joined_string = capitalized_words.join(" ")
  joined_string
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error: Expected Then at line 6:29 (got LBrace '{')
  --> /tmp/dojo-title-case-3.almd:6:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |     if capitalized == lower {
  |                             ^
error: Expected ')' to close function call opened at line 3:36
  --> /tmp/dojo-title-case-3.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let capitalized_words = words.map((word) => {
  |                                    --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-title-case-3.almd:11:3
   |
11 |   })
   |   ^
error[E003]: undefined variable 'capitalized'
  --> /tmp/dojo-title-case-3.almd:9:7
  in variable capitalized
  hint: Check the variable name
  |
9 |       capitalized
  |       ^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
