# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool {
  let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> list.to_lower |> list.sort;
  let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> list.to_lower |> list.sort;
  list.eq(a_chars, b_chars)
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:45
  --> /tmp/dojo-anagram-check-0.almd:1:45
  here: fn is_anagram(a: String, b: String) -> Bool {
  hint: Almide requires '=' before the body. Write: fn is_anagram(...) -> Type = { ... }
  |
1 | fn is_anagram(a: String, b: String) -> Bool {
  |                                             ^
error: Expected function name at line 2:50 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:2:50
  here: let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> list.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> list.to_lower |> list.sort;
  |                                                  ^
error: Expected function name at line 3:50 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:3:50
  here: let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> list.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> list.to_lower |> list.sort;
  |                                                  ^

3 error(s) found
FAILED: /tmp/dojo-anagram-check-0.almd
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  list.eq(a_chars, b_chars)
}
```

**Diagnostic:**

```
error: Expected expression at line 2:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:48
  here: let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  |                                                ^
error: Expected expression at line 3:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:48
  here: let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  |                                                ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:11
  in variable a_chars
  here: list.eq(a_chars, b_chars)
  hint: Check the variable name
  |
4 |   list.eq(a_chars, b_chars)
  |           ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:20
  in variable b_chars
  here: list.eq(a_chars, b_chars)
  hint: Check the variable name
  |
4 |   list.eq(a_chars, b_chars)
  |                    ^^^^^^^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-anagram-check-1.almd:4:20
  in call to list.eq()
  here: list.eq(a_chars, b_chars)
  hint: Did you mean `list.get`?
  try:
      list.get
  |
4 |   list.eq(a_chars, b_chars)
  |                    ^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-anagram-check-1.almd
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  list.len(a_chars) == list.len(b_chars) && list.eq(list.sort(a_chars), list.sort(b_chars))
}
```

**Diagnostic:**

```
error: Expected expression at line 2:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:48
  here: let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  |                                                ^
error: Expected expression at line 3:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:48
  here: let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  |                                                ^
error: '&&' is not valid in Almide at line 4:42
  --> /tmp/dojo-anagram-check-2.almd:4:42
  here: list.len(a_chars) == list.len(b_chars) && list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |   list.len(a_chars) == list.len(b_chars) && list.eq(list.sort(a_chars), list.sort(b_chars))
  |                                          ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-2.almd:1:47
  in fn 'is_anagram'
  here: fn is_anagram(a: String, b: String) -> Bool = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
1 | fn is_anagram(a: String, b: String) -> Bool = {
  |                                               ^

4 error(s) found
FAILED: /tmp/dojo-anagram-check-2.almd
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
}
```

**Diagnostic:**

```
error: Expected expression at line 2:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:2:48
  here: let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  |                                                ^
error: Expected expression at line 3:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:48
  here: let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(c) => string.is_alphanumeric(c)) |> string.to_lower |> list.sort;
  |                                                ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-3.almd:4:12
  in variable a_chars
  here: list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Check the variable name
  |
4 |   list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  |            ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-3.almd:4:33
  in variable b_chars
  here: list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Check the variable name
  |
4 |   list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  |                                 ^^^^^^^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-3.almd:4:64
  in variable a_chars
  here: list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Check the variable name
  |
4 |   list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  |                                                                ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-3.almd:4:84
  in variable b_chars
  here: list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Check the variable name
  |
4 |   list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  |                                                                                    ^^^^^^^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-anagram-check-3.almd:4:84
  in call to list.eq()
  here: list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Did you mean `list.get`?
  try:
      list.get
  |
4 |   list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  |                                                                                    ^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?2])
  --> /tmp/dojo-anagram-check-3.almd:4:54
  in this expression with an unconstrained type
  here: list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  |                                                      ^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-3.almd:4:74
  in this expression with an unconstrained type
  here: list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   list.len(a_chars) == list.len(b_chars) and list.eq(list.sort(a_chars), list.sort(b_chars))
  |                                                                          ^^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-anagram-check-3.almd
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
