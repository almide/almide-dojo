# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
        sorted_a = list.sort(clean(a))
        sorted_b = list.sort(clean(b))
    in 
    sorted_a == sorted_b
```

**Diagnostic:**

```
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |     let
  |         ^
error: Expected ')' to close parenthesized expression opened at line 3:17
  --> /tmp/dojo-anagram-check-0.almd:4:9
  here: sorted_a = list.sort(clean(a))
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |         clean = (string.to_lower >> (string.chars >> list.filter((x) => x != " "))
  |                 --------------- '(' opened here
...
4 |         sorted_a = list.sort(clean(a))
  |         ^^^^^^^^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:6:5
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:5:30
  in call to clean()
  here: sorted_b = list.sort(clean(b))
  hint: Check the function name
  |
5 |         sorted_b = list.sort(clean(b))
  |                              ^^^^^
error[E003]: cannot assign to undefined binding 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:5:36
  in sorted_b = ...
  here: sorted_b = list.sort(clean(b))
  hint: No `let`/`var` named 'sorted_b' is in scope to assign to. Declare it first: `var sorted_b = ...`
  |
5 |         sorted_b = list.sort(clean(b))
  |                                    ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:7:5
  in variable sorted_a
  here: sorted_a == sorted_b
  hint: Check the variable name
  |
7 |     sorted_a == sorted_b
  |     ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:7:17
  in variable sorted_b
  here: sorted_a == sorted_b
  hint: Check the variable name
  |
7 |     sorted_a == sorted_b
  |                 ^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?0])
  --> /tmp/dojo-anagram-check-0.almd:5:20
  in this expression with an unconstrained type
  here: sorted_b = list.sort(clean(b))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |         sorted_b = list.sort(clean(b))
  |                    ^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-anagram-check-0.almd
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
    let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
    in clean_a == clean_b
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:2:41
  in call to list.filter()
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Fix the argument type
...
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                                         ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:2:58
  in call to list.filter()
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Fix the argument type
...
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-1.almd:3:41
  in call to list.filter()
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Fix the argument type
...
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                                         ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-1.almd:3:58
  in call to list.filter()
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Fix the argument type
...
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-1.almd:2:29
  in this expression with an unconstrained type
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-1.almd:2:19
  in this expression with an unconstrained type
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-1.almd:3:29
  in this expression with an unconstrained type
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-1.almd:3:19
  in this expression with an unconstrained type
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-1.almd:4:5
  in this expression with an unconstrained type
  here: clean_a == clean_b
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     clean_a == clean_b
  |     ^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-anagram-check-1.almd
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
    let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
    in clean_a == clean_b 

is incorrect. The correct version is:

fn is_anagram(a: String, b: String) -> Bool = 
    let chars_a = string.chars(string.to_lower(a))
    let chars_b = string.chars(string.to_lower(b))
    let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
    let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
    in clean_a == clean_b
```

**Diagnostic:**

```
error: Expected expression at line 6:37 (got Colon ':')
  --> /tmp/dojo-anagram-check-2.almd:6:37
  here: is incorrect. The correct version is:
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 | is incorrect. The correct version is:
  |                                     ^
error[E012]: duplicate function 'is_anagram'
  at line 8
  in fn is_anagram
  here: fn is_anagram(a: String, b: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn is_anagram(a: String, b: String) -> Bool =
  | ------------------------------------- first definition of 'is_anagram' here
...
8 | fn is_anagram(a: String, b: String) -> Bool =
  | ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:2:41
  in call to list.filter()
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Fix the argument type
...
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                                         ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:2:58
  in call to list.filter()
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Fix the argument type
...
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:3:41
  in call to list.filter()
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Fix the argument type
...
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                                         ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:3:58
  in call to list.filter()
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Fix the argument type
...
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'is'
  --> /tmp/dojo-anagram-check-2.almd:6:1
  in variable is
  here: is incorrect. The correct version is:
  hint: Did you mean `b`?
  try:
      b
  |
6 | is incorrect. The correct version is:
  | ^^
error[E003]: undefined variable 'incorrect'
  --> /tmp/dojo-anagram-check-2.almd:6:4
  in variable incorrect
  here: is incorrect. The correct version is:
  hint: Check the variable name
  |
6 | is incorrect. The correct version is:
  |    ^^^^^^^^^
error[E003]: undefined variable 'correct'
  --> /tmp/dojo-anagram-check-2.almd:6:19
  in variable correct
  here: is incorrect. The correct version is:
  hint: Check the variable name
  |
6 | is incorrect. The correct version is:
  |                   ^^^^^^^
error[E003]: undefined variable 'version'
  --> /tmp/dojo-anagram-check-2.almd:6:27
  in variable version
  here: is incorrect. The correct version is:
  hint: Check the variable name
  |
6 | is incorrect. The correct version is:
  |                           ^^^^^^^
error[E003]: undefined variable 'is'
  --> /tmp/dojo-anagram-check-2.almd:6:35
  in variable is
  here: is incorrect. The correct version is:
  hint: Did you mean `b`?
  try:
      b
  |
6 | is incorrect. The correct version is:
  |                                   ^^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:11:41
  in call to list.filter()
  here: let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
  hint: Fix the argument type
...
11 |     let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
   |                                         ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:11:58
  in call to list.filter()
  here: let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
  hint: Fix the argument type
...
11 |     let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
   |                                                          ^^^^^^^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-2.almd:12:41
  in call to list.filter()
  here: let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
  hint: Fix the argument type
...
12 |     let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
   |                                         ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[String]
  --> /tmp/dojo-anagram-check-2.almd:12:58
  in call to list.filter()
  here: let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
  hint: Fix the argument type
...
12 |     let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
   |                                                          ^^^^^^^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-2.almd:6:35
  in fn 'is_anagram'
  here: is incorrect. The correct version is:
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
6 | is incorrect. The correct version is:
  |                                   ^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-2.almd:2:29
  in this expression with an unconstrained type
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-2.almd:2:19
  in this expression with an unconstrained type
  here: let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let clean_a = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(a))))
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-2.almd:3:29
  in this expression with an unconstrained type
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-2.almd:3:19
  in this expression with an unconstrained type
  here: let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |     let clean_b = list.sort(list.filter((x) => x != " ", string.chars(string.to_lower(b))))
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-anagram-check-2.almd:4:5
  in this expression with an unconstrained type
  here: clean_a == clean_b
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     clean_a == clean_b
  |     ^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?11])
  --> /tmp/dojo-anagram-check-2.almd:11:29
  in this expression with an unconstrained type
  here: let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |     let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?11])
  --> /tmp/dojo-anagram-check-2.almd:11:19
  in this expression with an unconstrained type
  here: let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |     let clean_a = list.sort(list.filter((x) => x != " ", chars_a))
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?11])
  --> /tmp/dojo-anagram-check-2.almd:12:29
  in this expression with an unconstrained type
  here: let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
12 |     let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?11])
  --> /tmp/dojo-anagram-check-2.almd:12:19
  in this expression with an unconstrained type
  here: let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
12 |     let clean_b = list.sort(list.filter((x) => x != " ", chars_b))
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?11])
  --> /tmp/dojo-anagram-check-2.almd:13:5
  in this expression with an unconstrained type
  here: clean_a == clean_b
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
13 |     clean_a == clean_b
   |     ^^^^^^^

26 error(s) found
FAILED: /tmp/dojo-anagram-check-2.almd
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let chars_a = string.chars(string.to_lower(string.replace(a, " ", "")))
    let chars_b = string.chars(string.to_lower(string.replace(b, " ", "")))
    let clean_a = list.sort(chars_a)
    let clean_b = list.sort(chars_b)
    in clean_a == clean_b
```
