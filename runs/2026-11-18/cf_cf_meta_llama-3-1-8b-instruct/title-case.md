# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
  let words = string.split(s, " ");
  let capitalized = list.map(words, |word| string.capitalize(word));
  list.join(capitalized, " ")
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-title-case-0.almd:1:36
  here: fn title_case(s: String) -> String {
  hint: Almide requires '=' before the body. Write: fn title_case(...) -> Type = { ... }
  |
1 | fn title_case(s: String) -> String {
  |                                    ^

1 error(s) found
FAILED: /tmp/dojo-title-case-0.almd
  parse error: Missing '=' before function body at line 1:36
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-title-case-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ");
  let capitalized = list.map(words, |word| string.capitalize(word));
  list.join(capitalized, " ")
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-title-case-1.almd:3:37
  in lambda
  here: let capitalized = list.map(words, |word| string.capitalize(word));
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
3 |   let capitalized = list.map(words, |word| string.capitalize(word));
  |                                     ^

1 error(s) found
FAILED: /tmp/dojo-title-case-1.almd
  parse error: '|x|' closure syntax is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-title-case-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ");
  let capitalized = list.map(words, (word) => string.capitalize(word));
  list.join(capitalized, " ")
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-2.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-2.almd:11
  expected: Hello World
  found:    HELLO WORLD
  test: title_case mixed
  at:   /tmp/dojo-title-case-2.almd:12
  expected: Hello World
  found:    HELLO WORLD

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ");
  let capitalized = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)));
  list.join(capitalized, " ")
}
```

**Diagnostic:**

```
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-title-case-3.almd:3:89
  in call to string.capitalize()
  here: let capitalized = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)));
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
3 |   let capitalized = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)));
  |                                                                                         ^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-title-case-3.almd
Compile error for /tmp/dojo-title-case-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
