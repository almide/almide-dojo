# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  in 
  list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |       ^
error: Expected ')' to close parenthesized expression opened at line 3:13
  --> /tmp/dojo-anagram-check-0.almd:4:3
  here: in
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |     clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |             --------------- '(' opened here
...
4 |   in
  |   ^^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:13
  in call to clean()
  here: list.sort(clean(a)) == list.sort(clean(b))
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |             ^^^^^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:36
  in call to clean()
  here: list.sort(clean(a)) == list.sort(clean(b))
  hint: Check the function name
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                                    ^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-0.almd:5:3
  in this expression with an unconstrained type
  here: list.sort(clean(a)) == list.sort(clean(b))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |   ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-0.almd:5:26
  in this expression with an unconstrained type
  here: list.sort(clean(a)) == list.sort(clean(b))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |   list.sort(clean(a)) == list.sort(clean(b))
  |                          ^^^^^^^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-anagram-check-0.almd
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean = (x) => list.sort(list.filter(string.chars(string.to_lower(x)), (y) => y != " "))
  in 
  clean(a) == clean(b)
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |       ^
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:4:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |   in
  |   ^
error[E003]: cannot assign to undefined binding 'clean'
  --> /tmp/dojo-anagram-check-1.almd:3:88
  in clean = ...
  here: clean = (x) => list.sort(list.filter(string.chars(string.to_lower(x)), (y) => y != " "))
  hint: No `let`/`var` named 'clean' is in scope to assign to. Declare it first: `var clean = ...`
  |
3 |     clean = (x) => list.sort(list.filter(string.chars(string.to_lower(x)), (y) => y != " "))
  |                                                                                        ^^^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:5:3
  in call to clean()
  here: clean(a) == clean(b)
  hint: Check the function name
  |
5 |   clean(a) == clean(b)
  |   ^^^^^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-1.almd:5:15
  in call to clean()
  here: clean(a) == clean(b)
  hint: Check the function name
  |
5 |   clean(a) == clean(b)
  |               ^^^^^

5 error(s) found
FAILED: /tmp/dojo-anagram-check-1.almd
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  list.sort(list.filter(string.chars(string.to_lower(a)), (y) => y != " ")) == list.sort(list.filter(string.chars(string.to_lower(b)), (y) => y != " "))
```
