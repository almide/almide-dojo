# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a_chars = string.chars(a) |> list.filter(fn(x) => not string.is_whitespace(x)) 
  let b_chars = string.chars(b) |> list.filter(fn(x) => not string.is_whitespace(x))
  list.sort(a_chars) == list.sort(b_chars)
```

**Diagnostic:**

```
error: Expected expression at line 2:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:2:48
  here: let a_chars = string.chars(a) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                ^
error: Expected expression at line 3:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:3:48
  here: let b_chars = string.chars(b) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-0.almd:4:13
  in variable a_chars
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-0.almd:4:35
  in variable b_chars
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-0.almd:4:3
  in this expression with an unconstrained type
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |   ^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-0.almd:4:25
  in this expression with an unconstrained type
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                         ^^^^^^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-anagram-check-0.almd
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  list.sort(a_chars) == list.sort(b_chars)
```

**Diagnostic:**

```
error: Expected expression at line 2:65 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:65
  here: let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                                 ^
error: Expected expression at line 3:65 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:65
  here: let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                                 ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:13
  in variable a_chars
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:35
  in variable b_chars
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-1.almd:4:3
  in this expression with an unconstrained type
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |   ^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-1.almd:4:25
  in this expression with an unconstrained type
  here: list.sort(a_chars) == list.sort(b_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                         ^^^^^^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-anagram-check-1.almd
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  let sorted_a = list.sort(a_chars)
  let sorted_b = list.sort(b_chars)
  sorted_a == sorted_b
```

**Diagnostic:**

```
error: Expected expression at line 2:65 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:65
  here: let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                                 ^
error: Expected expression at line 3:65 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:65
  here: let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                                 ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-2.almd:4:28
  in variable a_chars
  here: let sorted_a = list.sort(a_chars)
  hint: Check the variable name
  |
4 |   let sorted_a = list.sort(a_chars)
  |                            ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-2.almd:5:28
  in variable b_chars
  here: let sorted_b = list.sort(b_chars)
  hint: Check the variable name
  |
5 |   let sorted_b = list.sort(b_chars)
  |                            ^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-2.almd:4:18
  in this expression with an unconstrained type
  here: let sorted_a = list.sort(a_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   let sorted_a = list.sort(a_chars)
  |                  ^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-2.almd:5:18
  in this expression with an unconstrained type
  here: let sorted_b = list.sort(b_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |   let sorted_b = list.sort(b_chars)
  |                  ^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-2.almd:6:3
  in this expression with an unconstrained type
  here: sorted_a == sorted_b
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |   sorted_a == sorted_b
  |   ^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-anagram-check-2.almd
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  let sorted_a = list.sort(a_chars)
  let sorted_b = list.sort(b_chars)
  list.sort(sorted_a) == list.sort(sorted_b)
```

**Diagnostic:**

```
error: Expected expression at line 2:65 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:2:65
  here: let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let a_chars = string.chars(string.to_lower(a)) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                                 ^
error: Expected expression at line 3:65 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:65
  here: let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   let b_chars = string.chars(string.to_lower(b)) |> list.filter(fn(x) => not string.is_whitespace(x))
  |                                                                 ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-3.almd:4:28
  in variable a_chars
  here: let sorted_a = list.sort(a_chars)
  hint: Check the variable name
  |
4 |   let sorted_a = list.sort(a_chars)
  |                            ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-3.almd:5:28
  in variable b_chars
  here: let sorted_b = list.sort(b_chars)
  hint: Check the variable name
  |
5 |   let sorted_b = list.sort(b_chars)
  |                            ^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-3.almd:4:18
  in this expression with an unconstrained type
  here: let sorted_a = list.sort(a_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |   let sorted_a = list.sort(a_chars)
  |                  ^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-3.almd:5:18
  in this expression with an unconstrained type
  here: let sorted_b = list.sort(b_chars)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |   let sorted_b = list.sort(b_chars)
  |                  ^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-3.almd:6:3
  in this expression with an unconstrained type
  here: list.sort(sorted_a) == list.sort(sorted_b)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |   list.sort(sorted_a) == list.sort(sorted_b)
  |   ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-3.almd:6:26
  in this expression with an unconstrained type
  here: list.sort(sorted_a) == list.sort(sorted_b)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |   list.sort(sorted_a) == list.sort(sorted_b)
  |                          ^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-anagram-check-3.almd
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
