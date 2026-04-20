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
  let words = string.split(s, " ");
  let capitalized_words = words.map(string.capitalize);
  string.join(capitalized_words, " ")
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
  let capitalized_words = words.map(string.capitalize);
  string.join(capitalized_words, " ")
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
  let capitalized_words = words.map(string.capitalize);
  string.join(capitalized_words, " ")
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
  let capitalized_words = words.map(string.capitalize(str));
  string.join(capitalized_words, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error[E003]: undefined variable 'str'
  --> /tmp/dojo-title-case-3.almd:3:55
  in variable str
  hint: Did you mean `s`?
  try:
      // str  →  s
      s
  |
3 |   let capitalized_words = words.map(string.capitalize(str));
  |                                                       ^^^
error[E005]: argument 'f' expects fn(String) -> B but got String
  --> /tmp/dojo-title-case-3.almd:3:27
  in call to list.map()
  hint: Fix the argument type
  |
3 |   let capitalized_words = words.map(string.capitalize(str));
  |                           ^^^^^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got String
  --> /tmp/dojo-title-case-3.almd:3:27
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |   let capitalized_words = words.map(string.capitalize(str));
  |                           ^^^^^

3 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
