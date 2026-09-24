# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')' => if list.is_empty(stack) then false else list.pop(stack)
      ']' => if list.is_empty(stack) then false else list.pop(stack)
      '}' => if list.is_empty(stack) then false else list.pop(stack)
      _ => ()
    }
  }
  list.is_empty(stack)
```

**Diagnostic:**

```
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-0.almd:3:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-0.almd:13:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   }
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:4:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
  |
4 |     match c {
  |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-0.almd:5:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-0.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-0.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-0.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-0.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-0.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?1]
  --> /tmp/dojo-balanced-parens-0.almd:8:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?3]
  --> /tmp/dojo-balanced-parens-0.almd:9:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?5]
  --> /tmp/dojo-balanced-parens-0.almd:10:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-0.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-0.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-0.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:11:12
  in fn 'is_balanced'
  here: _ => ()
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
11 |       _ => ()
   |            ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-balanced-parens-0.almd:8:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-balanced-parens-0.almd:9:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-0.almd:10:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^

20 error(s) found
FAILED: /tmp/dojo-balanced-parens-0.almd
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')' => if list.is_empty(stack) then false else list.pop(stack)
      ']' => if list.is_empty(stack) then false else list.pop(stack)
      '}' => if list.is_empty(stack) then false else list.pop(stack)
      _ => ()
    }
  list.is_empty(stack)

fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')' => if list.is_empty(stack) then false else list.pop(stack)
      ']' => if list.is_empty(stack) then false else list.pop(stack)
      '}' => if list.is_empty(stack) then false else list.pop(stack)
      _ => ()
    }
  match list.is_empty(stack) {
    true => true
    false => false
  }
```

**Diagnostic:**

```
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:3:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected LBrace at line 17:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:17:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   for c in string.chars(s) do
   |                            ^
error[E012]: duplicate function 'is_balanced'
  at line 15
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
15 | fn is_balanced(s: String) -> Bool =
   | ^^^^^^^^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:4:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
  |
4 |     match c {
  |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:5:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:16:23
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
16 |   let stack = list.new[String]()
   |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:18:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
18 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:19:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
19 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:20:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
20 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:21:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
21 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:22:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
22 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:23:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
23 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:24:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
24 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?1]
  --> /tmp/dojo-balanced-parens-1.almd:8:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?3]
  --> /tmp/dojo-balanced-parens-1.almd:9:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?5]
  --> /tmp/dojo-balanced-parens-1.almd:10:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?8]
  --> /tmp/dojo-balanced-parens-1.almd:22:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
22 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?10]
  --> /tmp/dojo-balanced-parens-1.almd:23:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
23 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?12]
  --> /tmp/dojo-balanced-parens-1.almd:24:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
24 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:25:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
25 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:25:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
25 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:25:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
25 |       _ => ()
   |            ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-balanced-parens-1.almd:8:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-balanced-parens-1.almd:9:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-1.almd:10:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?8])
  --> /tmp/dojo-balanced-parens-1.almd:22:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?10])
  --> /tmp/dojo-balanced-parens-1.almd:23:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?12])
  --> /tmp/dojo-balanced-parens-1.almd:24:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^

37 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')' => if list.is_empty(stack) then false else list.pop(stack)
      ']' => if list.is_empty(stack) then false else list.pop(stack)
      '}' => if list.is_empty(stack) then false else list.pop(stack)
      _ => ()
    }
  match list.is_empty(stack) {
    true => true
    false => false
  }

fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')' => if list.is_empty(stack) then false else list.pop(stack)
      ']' => if list.is_empty(stack) then false else list.pop(stack)
      '}' => if list.is_empty(stack) then false else list.pop(stack)
      _ => ()
    }
  list.is_empty(stack)
```

**Diagnostic:**

```
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:3:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected LBrace at line 20:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:20:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   for c in string.chars(s) do
   |                            ^
error[E012]: duplicate function 'is_balanced'
  at line 18
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
18 | fn is_balanced(s: String) -> Bool =
   | ^^^^^^^^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:2:23
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:4:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
  |
4 |     match c {
  |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:5:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:19:23
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
19 |   let stack = list.new[String]()
   |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:21:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
21 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:22:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
22 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:23:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
23 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:24:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
24 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:25:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
25 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:26:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
26 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:27:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
27 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?1]
  --> /tmp/dojo-balanced-parens-2.almd:8:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?3]
  --> /tmp/dojo-balanced-parens-2.almd:9:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?5]
  --> /tmp/dojo-balanced-parens-2.almd:10:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?8]
  --> /tmp/dojo-balanced-parens-2.almd:25:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
25 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?10]
  --> /tmp/dojo-balanced-parens-2.almd:26:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
26 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?12]
  --> /tmp/dojo-balanced-parens-2.almd:27:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
27 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:28:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
28 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:28:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
28 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:28:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
28 |       _ => ()
   |            ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-balanced-parens-2.almd:8:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-balanced-parens-2.almd:9:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-2.almd:10:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?8])
  --> /tmp/dojo-balanced-parens-2.almd:25:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
25 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?10])
  --> /tmp/dojo-balanced-parens-2.almd:26:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
26 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?12])
  --> /tmp/dojo-balanced-parens-2.almd:27:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
27 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^

37 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')' => if list.is_empty(stack) then false else list.pop(stack)
      ']' => if list.is_empty(stack) then false else list.pop(stack)
      '}' => if list.is_empty(stack) then false else list.pop(stack)
      _ => ()
    }
  list.is_empty(stack)
```

**Diagnostic:**

```
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:3:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   for c in string.chars(s) do
  |                            ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:2:23
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:4:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
  |
4 |     match c {
  |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:5:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?1]
  --> /tmp/dojo-balanced-parens-3.almd:8:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?3]
  --> /tmp/dojo-balanced-parens-3.almd:9:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?5]
  --> /tmp/dojo-balanced-parens-3.almd:10:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:11:12
  in match arm
  here: _ => ()
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => ()
   |            ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-balanced-parens-3.almd:8:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-balanced-parens-3.almd:9:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-3.almd:10:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^

18 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
