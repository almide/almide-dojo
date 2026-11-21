# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String =
  let
    parts = string.split(s, " ")
    capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  in
  list.join(capitalized_parts, " ")
```

**Diagnostic:**

```
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-title-case-0.almd:2:6
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-title-case-0.almd:5:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in
  |   ^
error[E003]: cannot assign to undefined binding 'parts'
  --> /tmp/dojo-title-case-0.almd:3:29
  in parts = ...
  here: parts = string.split(s, " ")
  hint: No `let`/`var` named 'parts' is in scope to assign to. Declare it first: `var parts = ...`
  |
3 |     parts = string.split(s, " ")
  |                             ^^^
error[E003]: undefined variable 'parts'
  --> /tmp/dojo-title-case-0.almd:4:34
  in variable parts
  here: capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  hint: Check the variable name
  |
4 |     capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  |                                  ^^^^^
error[E003]: cannot assign to undefined binding 'capitalized_parts'
  --> /tmp/dojo-title-case-0.almd:4:85
  in capitalized_parts = ...
  here: capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  hint: No `let`/`var` named 'capitalized_parts' is in scope to assign to. Declare it first: `var capitalized_parts = ...`
  |
4 |     capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  |                                                                                     ^^^^
error[E003]: undefined variable 'capitalized_parts'
  --> /tmp/dojo-title-case-0.almd:6:13
  in variable capitalized_parts
  here: list.join(capitalized_parts, " ")
  hint: Check the variable name
  |
6 |   list.join(capitalized_parts, " ")
  |             ^^^^^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-title-case-0.almd
  parse error: Expected identifier at line 2:6 (got Newline '')
  parse error: Expected expression at line 5:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-title-case-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String =
  string.split(s, " ") 
  |> list.map((word) => string.capitalize(string.to_lower(word)))
  |> list.join(_, " ")
```

**Diagnostic:**

```
error[E046]: placeholder `_` is not valid in a call argument (argument 1 of list.join()): `|>` already passes the value as the first argument
  --> /tmp/dojo-title-case-1.almd:4:16
  in call argument
  here: |> list.join(_, " ")
  hint: Drop the `_`: `x |> f(a, b)` is `f(x, a, b)`. There is no pipe placeholder — the left side always goes first; for any other position, write a lambda: `x |> (v) => f(a, v)`.
  try:
      list.join(" ")
  |
4 |   |> list.join(_, " ")
  |                ^

1 error(s) found
FAILED: /tmp/dojo-title-case-1.almd
Compile error for /tmp/dojo-title-case-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn title_case(s: String) -> String =
  string.split(s, " ") 
  |> list.map((word) => string.capitalize(string.to_lower(word)))
  |> (parts) => list.join(parts, " ")
```
