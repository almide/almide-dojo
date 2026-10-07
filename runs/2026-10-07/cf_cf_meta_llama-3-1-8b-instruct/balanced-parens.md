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
  --> /tmp/dojo-balanced-parens-0.almd:2:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |               ^^^^^^^^
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
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-0.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-0.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-0.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-0.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-0.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
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
  list.is_empty(stack)

fn is_balanced
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
error: Expected LBrace at line 31:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:31:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 45:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:45:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
45 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 59:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:59:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
59 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 73:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:73:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
73 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 87:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:87:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
87 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 101:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:101:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
101 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 115:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:115:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
115 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 129:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:129:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
129 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 143:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:143:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
143 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 157:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:157:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
157 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 171:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:171:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
171 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 185:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:185:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
185 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 199:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:199:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
199 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 213:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:213:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
213 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 227:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:227:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
227 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 241:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:241:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
241 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 255:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:255:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
255 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 269:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:269:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
269 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 283:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:283:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
283 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 297:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:297:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
297 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 311:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:311:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
311 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 325:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:325:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
325 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 339:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:339:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
339 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 353:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:353:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
353 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 367:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:367:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
367 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 381:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:381:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
381 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 395:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:395:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
395 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 409:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:409:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
409 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 423:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:423:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
423 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 437:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:437:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
437 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 451:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:451:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
451 |   for c in string.chars(s) do
    |                            ^
error: Expected LParen at line 463:15 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:463:15
  here: fn is_balanced
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
463 | fn is_balanced
    |               ^
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
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 29
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
29 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 43
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
43 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 57
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
57 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 71
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
71 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 85
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
85 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 99
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
99 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 113
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
113 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 127
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
127 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 141
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
141 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 155
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
155 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 169
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
169 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 183
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
183 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 197
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
197 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 211
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
211 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 225
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
225 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 239
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
239 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 253
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
253 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 267
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
267 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 281
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
281 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 295
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
295 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 309
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
309 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 323
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
323 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 337
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
337 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 351
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
351 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 365
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
365 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 379
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
379 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 393
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
393 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 407
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
407 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 421
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
421 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 435
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
435 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 449
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
449 | fn is_balanced(s: String) -> Bool =
    | ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |               ^^^^^^^^
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
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:16:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
16 |   let stack = list.new[String]()
   |               ^^^^^^^^
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
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
19 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:20:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
20 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:21:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
21 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:22:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
22 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:23:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
23 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:24:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
24 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:30:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
30 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:32:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
32 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:33:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
33 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:34:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
34 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:35:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
35 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:36:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
36 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:37:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
37 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:38:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
38 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:44:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
44 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:46:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
46 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:47:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
47 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:48:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
48 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:49:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
49 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:50:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
50 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:51:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
51 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:52:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
52 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:58:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
58 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:60:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
60 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:61:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
61 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:62:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
62 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:63:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
63 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:64:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
64 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:65:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
65 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:66:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
66 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:72:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
72 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:74:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
74 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:75:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
75 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:76:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
76 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:77:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
77 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:78:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
78 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:79:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
79 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:80:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
80 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:86:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
86 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:88:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
88 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:89:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
89 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:90:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
90 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:91:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
91 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:92:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
92 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:93:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
93 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:94:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
94 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:100:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
100 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:102:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
102 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:103:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
103 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:104:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
104 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:105:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
105 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:106:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
106 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:107:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
107 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:108:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
108 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:114:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
114 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:116:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
116 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:117:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
117 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:118:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
118 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:119:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
119 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:120:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
120 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:121:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
121 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:122:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
122 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:128:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
128 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:130:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
130 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:131:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
131 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:132:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
132 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:133:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
133 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:134:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
134 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:135:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
135 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:136:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
136 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:142:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
142 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:144:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
144 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:145:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
145 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:146:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
146 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:147:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
147 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:148:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
148 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:149:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
149 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:150:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
150 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:156:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
156 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:158:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
158 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:159:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
159 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:160:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
160 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:161:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
161 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:162:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
162 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:163:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
163 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:164:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
164 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:170:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
170 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:172:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
172 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:173:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
173 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:174:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
174 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:175:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
175 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:176:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
176 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:177:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
177 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:178:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
178 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:184:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
184 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:186:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
186 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:187:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
187 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:188:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
188 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:189:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
189 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:190:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
190 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:191:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
191 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:192:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
192 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:198:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
198 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:200:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
200 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:201:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
201 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:202:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
202 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:203:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
203 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:204:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
204 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:205:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
205 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:206:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
206 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:212:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
212 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:214:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
214 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:215:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
215 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:216:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
216 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:217:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
217 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:218:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
218 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:219:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
219 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:220:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
220 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:226:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
226 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:228:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
228 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:229:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
229 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:230:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
230 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:231:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
231 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:232:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
232 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:233:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
233 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:234:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
234 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:240:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
240 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:242:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
242 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:243:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
243 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:244:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
244 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:245:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
245 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:246:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
246 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:247:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
247 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:248:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
248 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:254:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
254 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:256:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
256 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:257:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
257 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:258:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
258 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:259:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
259 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:260:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
260 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:261:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
261 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:262:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
262 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:268:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
268 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:270:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
270 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:271:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
271 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:272:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
272 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:273:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
273 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:274:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
274 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:275:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
275 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:276:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
276 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:282:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
282 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:284:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
284 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:285:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
285 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:286:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
286 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:287:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
287 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:288:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
288 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:289:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
289 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:290:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
290 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:296:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
296 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:298:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
298 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:299:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
299 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:300:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
300 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:301:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
301 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:302:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
302 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:303:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
303 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:304:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
304 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:310:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
310 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:312:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
312 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:313:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
313 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:314:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
314 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:315:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
315 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:316:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
316 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:317:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
317 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:318:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
318 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:324:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
324 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:326:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
326 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:327:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
327 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:328:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
328 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:329:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
329 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:330:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
330 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:331:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
331 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:332:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
332 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:338:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
338 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:340:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
340 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:341:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
341 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:342:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
342 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:343:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
343 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:344:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
344 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:345:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
345 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:346:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
346 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:352:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
352 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:354:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
354 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:355:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
355 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:356:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
356 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:357:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
357 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:358:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
358 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:359:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
359 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:360:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
360 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:366:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
366 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:368:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
368 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:369:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
369 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:370:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
370 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:371:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
371 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:372:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
372 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:373:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
373 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:374:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
374 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:380:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
380 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:382:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
382 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:383:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
383 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:384:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
384 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:385:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
385 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:386:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
386 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:387:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
387 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:388:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
388 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:394:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
394 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:396:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
396 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:397:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
397 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:398:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
398 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:399:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
399 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:400:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
400 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:401:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
401 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:402:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
402 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:408:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
408 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:410:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
410 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:411:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
411 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:412:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
412 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:413:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
413 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:414:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
414 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:415:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
415 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:416:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
416 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:422:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
422 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:424:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
424 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:425:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
425 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:426:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
426 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:427:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
427 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:428:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
428 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:429:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
429 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:430:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
430 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:436:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
436 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:438:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
438 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:439:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
439 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:440:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
440 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:441:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
441 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:442:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
442 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:443:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
443 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:444:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
444 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:450:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
450 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:452:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
452 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:453:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
453 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:454:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
454 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:455:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
455 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:456:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
456 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:457:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
457 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:458:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
458 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
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
error[E001]: type mismatch in if branches: expected Bool but got Option[?15]
  --> /tmp/dojo-balanced-parens-1.almd:36:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
36 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?17]
  --> /tmp/dojo-balanced-parens-1.almd:37:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
37 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?19]
  --> /tmp/dojo-balanced-parens-1.almd:38:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
38 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:39:12
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
39 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:39:12
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
39 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:39:12
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
39 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?22]
  --> /tmp/dojo-balanced-parens-1.almd:50:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
50 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?24]
  --> /tmp/dojo-balanced-parens-1.almd:51:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
51 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?26]
  --> /tmp/dojo-balanced-parens-1.almd:52:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
52 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:53:12
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
53 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:53:12
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
53 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:53:12
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
53 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?29]
  --> /tmp/dojo-balanced-parens-1.almd:64:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
64 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?31]
  --> /tmp/dojo-balanced-parens-1.almd:65:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
65 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?33]
  --> /tmp/dojo-balanced-parens-1.almd:66:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
66 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:67:12
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
67 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:67:12
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
67 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:67:12
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
67 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?36]
  --> /tmp/dojo-balanced-parens-1.almd:78:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
78 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?38]
  --> /tmp/dojo-balanced-parens-1.almd:79:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
79 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?40]
  --> /tmp/dojo-balanced-parens-1.almd:80:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
80 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:81:12
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
81 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:81:12
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
81 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:81:12
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
81 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?43]
  --> /tmp/dojo-balanced-parens-1.almd:92:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
92 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?45]
  --> /tmp/dojo-balanced-parens-1.almd:93:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
93 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?47]
  --> /tmp/dojo-balanced-parens-1.almd:94:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
94 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:95:12
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
95 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:95:12
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
95 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:95:12
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
95 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?50]
  --> /tmp/dojo-balanced-parens-1.almd:106:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
106 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?52]
  --> /tmp/dojo-balanced-parens-1.almd:107:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
107 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?54]
  --> /tmp/dojo-balanced-parens-1.almd:108:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
108 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:109:12
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
109 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:109:12
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
109 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:109:12
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
109 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?57]
  --> /tmp/dojo-balanced-parens-1.almd:120:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
120 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?59]
  --> /tmp/dojo-balanced-parens-1.almd:121:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
121 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?61]
  --> /tmp/dojo-balanced-parens-1.almd:122:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
122 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:123:12
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
123 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:123:12
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
123 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:123:12
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
123 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?64]
  --> /tmp/dojo-balanced-parens-1.almd:134:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
134 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?66]
  --> /tmp/dojo-balanced-parens-1.almd:135:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
135 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?68]
  --> /tmp/dojo-balanced-parens-1.almd:136:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
136 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:137:12
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
137 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:137:12
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
137 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:137:12
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
137 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?71]
  --> /tmp/dojo-balanced-parens-1.almd:148:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
148 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?73]
  --> /tmp/dojo-balanced-parens-1.almd:149:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
149 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?75]
  --> /tmp/dojo-balanced-parens-1.almd:150:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
150 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:151:12
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
151 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:151:12
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
151 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:151:12
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
151 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?78]
  --> /tmp/dojo-balanced-parens-1.almd:162:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
162 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?80]
  --> /tmp/dojo-balanced-parens-1.almd:163:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
163 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?82]
  --> /tmp/dojo-balanced-parens-1.almd:164:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
164 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:165:12
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
165 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:165:12
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
165 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:165:12
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
165 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?85]
  --> /tmp/dojo-balanced-parens-1.almd:176:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
176 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?87]
  --> /tmp/dojo-balanced-parens-1.almd:177:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
177 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?89]
  --> /tmp/dojo-balanced-parens-1.almd:178:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
178 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:179:12
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
179 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:179:12
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
179 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:179:12
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
179 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?92]
  --> /tmp/dojo-balanced-parens-1.almd:190:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
190 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?94]
  --> /tmp/dojo-balanced-parens-1.almd:191:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
191 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?96]
  --> /tmp/dojo-balanced-parens-1.almd:192:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
192 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:193:12
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
193 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:193:12
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
193 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:193:12
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
193 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?99]
  --> /tmp/dojo-balanced-parens-1.almd:204:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
204 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?101]
  --> /tmp/dojo-balanced-parens-1.almd:205:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
205 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?103]
  --> /tmp/dojo-balanced-parens-1.almd:206:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
206 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:207:12
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
207 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:207:12
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
207 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:207:12
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
207 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?106]
  --> /tmp/dojo-balanced-parens-1.almd:218:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
218 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?108]
  --> /tmp/dojo-balanced-parens-1.almd:219:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
219 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?110]
  --> /tmp/dojo-balanced-parens-1.almd:220:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
220 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:221:12
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
221 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:221:12
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
221 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:221:12
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
221 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?113]
  --> /tmp/dojo-balanced-parens-1.almd:232:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
232 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?115]
  --> /tmp/dojo-balanced-parens-1.almd:233:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
233 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?117]
  --> /tmp/dojo-balanced-parens-1.almd:234:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
234 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:235:12
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
235 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:235:12
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
235 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:235:12
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
235 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?120]
  --> /tmp/dojo-balanced-parens-1.almd:246:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
246 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?122]
  --> /tmp/dojo-balanced-parens-1.almd:247:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
247 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?124]
  --> /tmp/dojo-balanced-parens-1.almd:248:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
248 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:249:12
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
249 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:249:12
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
249 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:249:12
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
249 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?127]
  --> /tmp/dojo-balanced-parens-1.almd:260:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
260 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?129]
  --> /tmp/dojo-balanced-parens-1.almd:261:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
261 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?131]
  --> /tmp/dojo-balanced-parens-1.almd:262:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
262 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:263:12
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
263 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:263:12
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
263 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:263:12
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
263 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?134]
  --> /tmp/dojo-balanced-parens-1.almd:274:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
274 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?136]
  --> /tmp/dojo-balanced-parens-1.almd:275:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
275 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?138]
  --> /tmp/dojo-balanced-parens-1.almd:276:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
276 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:277:12
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
277 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:277:12
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
277 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:277:12
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
277 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?141]
  --> /tmp/dojo-balanced-parens-1.almd:288:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
288 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?143]
  --> /tmp/dojo-balanced-parens-1.almd:289:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
289 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?145]
  --> /tmp/dojo-balanced-parens-1.almd:290:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
290 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:291:12
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
291 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:291:12
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
291 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:291:12
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
291 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?148]
  --> /tmp/dojo-balanced-parens-1.almd:302:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
302 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?150]
  --> /tmp/dojo-balanced-parens-1.almd:303:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
303 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?152]
  --> /tmp/dojo-balanced-parens-1.almd:304:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
304 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:305:12
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
305 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:305:12
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
305 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:305:12
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
305 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?155]
  --> /tmp/dojo-balanced-parens-1.almd:316:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
316 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?157]
  --> /tmp/dojo-balanced-parens-1.almd:317:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
317 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?159]
  --> /tmp/dojo-balanced-parens-1.almd:318:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
318 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:319:12
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
319 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:319:12
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
319 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:319:12
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
319 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?162]
  --> /tmp/dojo-balanced-parens-1.almd:330:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
330 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?164]
  --> /tmp/dojo-balanced-parens-1.almd:331:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
331 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?166]
  --> /tmp/dojo-balanced-parens-1.almd:332:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
332 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:333:12
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
333 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:333:12
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
333 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:333:12
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
333 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?169]
  --> /tmp/dojo-balanced-parens-1.almd:344:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
344 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?171]
  --> /tmp/dojo-balanced-parens-1.almd:345:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
345 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?173]
  --> /tmp/dojo-balanced-parens-1.almd:346:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
346 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:347:12
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
347 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:347:12
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
347 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:347:12
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
347 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?176]
  --> /tmp/dojo-balanced-parens-1.almd:358:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
358 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?178]
  --> /tmp/dojo-balanced-parens-1.almd:359:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
359 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?180]
  --> /tmp/dojo-balanced-parens-1.almd:360:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
360 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:361:12
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
361 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:361:12
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
361 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:361:12
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
361 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?183]
  --> /tmp/dojo-balanced-parens-1.almd:372:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
372 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?185]
  --> /tmp/dojo-balanced-parens-1.almd:373:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
373 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?187]
  --> /tmp/dojo-balanced-parens-1.almd:374:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
374 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:375:12
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
375 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:375:12
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
375 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:375:12
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
375 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?190]
  --> /tmp/dojo-balanced-parens-1.almd:386:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
386 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?192]
  --> /tmp/dojo-balanced-parens-1.almd:387:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
387 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?194]
  --> /tmp/dojo-balanced-parens-1.almd:388:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
388 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:389:12
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
389 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:389:12
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
389 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:389:12
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
389 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?197]
  --> /tmp/dojo-balanced-parens-1.almd:400:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
400 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?199]
  --> /tmp/dojo-balanced-parens-1.almd:401:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
401 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?201]
  --> /tmp/dojo-balanced-parens-1.almd:402:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
402 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:403:12
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
403 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:403:12
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
403 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:403:12
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
403 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?204]
  --> /tmp/dojo-balanced-parens-1.almd:414:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
414 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?206]
  --> /tmp/dojo-balanced-parens-1.almd:415:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
415 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?208]
  --> /tmp/dojo-balanced-parens-1.almd:416:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
416 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:417:12
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
417 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:417:12
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
417 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:417:12
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
417 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?211]
  --> /tmp/dojo-balanced-parens-1.almd:428:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
428 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?213]
  --> /tmp/dojo-balanced-parens-1.almd:429:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
429 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?215]
  --> /tmp/dojo-balanced-parens-1.almd:430:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
430 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:431:12
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
431 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:431:12
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
431 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:431:12
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
431 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?218]
  --> /tmp/dojo-balanced-parens-1.almd:442:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
442 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?220]
  --> /tmp/dojo-balanced-parens-1.almd:443:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
443 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?222]
  --> /tmp/dojo-balanced-parens-1.almd:444:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
444 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:445:12
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
445 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:445:12
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
445 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:445:12
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
445 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?225]
  --> /tmp/dojo-balanced-parens-1.almd:456:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
456 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?227]
  --> /tmp/dojo-balanced-parens-1.almd:457:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
457 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?229]
  --> /tmp/dojo-balanced-parens-1.almd:458:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
458 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:459:12
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
459 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:459:12
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
459 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:459:12
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
459 |       _ => ()
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
error[E025]: cannot infer a concrete type for this expression (type Option[?15])
  --> /tmp/dojo-balanced-parens-1.almd:36:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?17])
  --> /tmp/dojo-balanced-parens-1.almd:37:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
37 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?19])
  --> /tmp/dojo-balanced-parens-1.almd:38:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?22])
  --> /tmp/dojo-balanced-parens-1.almd:50:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
50 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?24])
  --> /tmp/dojo-balanced-parens-1.almd:51:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
51 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?26])
  --> /tmp/dojo-balanced-parens-1.almd:52:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
52 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?29])
  --> /tmp/dojo-balanced-parens-1.almd:64:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
64 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?31])
  --> /tmp/dojo-balanced-parens-1.almd:65:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
65 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?33])
  --> /tmp/dojo-balanced-parens-1.almd:66:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
66 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?36])
  --> /tmp/dojo-balanced-parens-1.almd:78:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
78 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?38])
  --> /tmp/dojo-balanced-parens-1.almd:79:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
79 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?40])
  --> /tmp/dojo-balanced-parens-1.almd:80:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
80 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?43])
  --> /tmp/dojo-balanced-parens-1.almd:92:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
92 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?45])
  --> /tmp/dojo-balanced-parens-1.almd:93:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
93 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?47])
  --> /tmp/dojo-balanced-parens-1.almd:94:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
94 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?50])
  --> /tmp/dojo-balanced-parens-1.almd:106:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
106 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?52])
  --> /tmp/dojo-balanced-parens-1.almd:107:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
107 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?54])
  --> /tmp/dojo-balanced-parens-1.almd:108:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
108 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?57])
  --> /tmp/dojo-balanced-parens-1.almd:120:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
120 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?59])
  --> /tmp/dojo-balanced-parens-1.almd:121:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
121 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?61])
  --> /tmp/dojo-balanced-parens-1.almd:122:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
122 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?64])
  --> /tmp/dojo-balanced-parens-1.almd:134:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
134 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?66])
  --> /tmp/dojo-balanced-parens-1.almd:135:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
135 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?68])
  --> /tmp/dojo-balanced-parens-1.almd:136:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
136 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?71])
  --> /tmp/dojo-balanced-parens-1.almd:148:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
148 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?73])
  --> /tmp/dojo-balanced-parens-1.almd:149:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
149 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?75])
  --> /tmp/dojo-balanced-parens-1.almd:150:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
150 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?78])
  --> /tmp/dojo-balanced-parens-1.almd:162:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
162 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?80])
  --> /tmp/dojo-balanced-parens-1.almd:163:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
163 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?82])
  --> /tmp/dojo-balanced-parens-1.almd:164:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
164 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?85])
  --> /tmp/dojo-balanced-parens-1.almd:176:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
176 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?87])
  --> /tmp/dojo-balanced-parens-1.almd:177:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
177 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?89])
  --> /tmp/dojo-balanced-parens-1.almd:178:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
178 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?92])
  --> /tmp/dojo-balanced-parens-1.almd:190:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
190 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?94])
  --> /tmp/dojo-balanced-parens-1.almd:191:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
191 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?96])
  --> /tmp/dojo-balanced-parens-1.almd:192:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
192 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?99])
  --> /tmp/dojo-balanced-parens-1.almd:204:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
204 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?101])
  --> /tmp/dojo-balanced-parens-1.almd:205:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
205 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?103])
  --> /tmp/dojo-balanced-parens-1.almd:206:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
206 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?106])
  --> /tmp/dojo-balanced-parens-1.almd:218:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
218 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?108])
  --> /tmp/dojo-balanced-parens-1.almd:219:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
219 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?110])
  --> /tmp/dojo-balanced-parens-1.almd:220:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
220 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?113])
  --> /tmp/dojo-balanced-parens-1.almd:232:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
232 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?115])
  --> /tmp/dojo-balanced-parens-1.almd:233:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
233 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?117])
  --> /tmp/dojo-balanced-parens-1.almd:234:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
234 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?120])
  --> /tmp/dojo-balanced-parens-1.almd:246:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
246 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?122])
  --> /tmp/dojo-balanced-parens-1.almd:247:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
247 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?124])
  --> /tmp/dojo-balanced-parens-1.almd:248:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
248 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?127])
  --> /tmp/dojo-balanced-parens-1.almd:260:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
260 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?129])
  --> /tmp/dojo-balanced-parens-1.almd:261:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
261 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?131])
  --> /tmp/dojo-balanced-parens-1.almd:262:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
262 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?134])
  --> /tmp/dojo-balanced-parens-1.almd:274:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
274 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?136])
  --> /tmp/dojo-balanced-parens-1.almd:275:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
275 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?138])
  --> /tmp/dojo-balanced-parens-1.almd:276:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
276 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?141])
  --> /tmp/dojo-balanced-parens-1.almd:288:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
288 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?143])
  --> /tmp/dojo-balanced-parens-1.almd:289:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
289 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?145])
  --> /tmp/dojo-balanced-parens-1.almd:290:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
290 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?148])
  --> /tmp/dojo-balanced-parens-1.almd:302:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
302 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?150])
  --> /tmp/dojo-balanced-parens-1.almd:303:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
303 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?152])
  --> /tmp/dojo-balanced-parens-1.almd:304:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
304 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?155])
  --> /tmp/dojo-balanced-parens-1.almd:316:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
316 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?157])
  --> /tmp/dojo-balanced-parens-1.almd:317:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
317 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?159])
  --> /tmp/dojo-balanced-parens-1.almd:318:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
318 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?162])
  --> /tmp/dojo-balanced-parens-1.almd:330:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
330 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?164])
  --> /tmp/dojo-balanced-parens-1.almd:331:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
331 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?166])
  --> /tmp/dojo-balanced-parens-1.almd:332:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
332 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?169])
  --> /tmp/dojo-balanced-parens-1.almd:344:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
344 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?171])
  --> /tmp/dojo-balanced-parens-1.almd:345:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
345 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?173])
  --> /tmp/dojo-balanced-parens-1.almd:346:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
346 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?176])
  --> /tmp/dojo-balanced-parens-1.almd:358:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
358 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?178])
  --> /tmp/dojo-balanced-parens-1.almd:359:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
359 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?180])
  --> /tmp/dojo-balanced-parens-1.almd:360:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
360 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?183])
  --> /tmp/dojo-balanced-parens-1.almd:372:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
372 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?185])
  --> /tmp/dojo-balanced-parens-1.almd:373:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
373 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?187])
  --> /tmp/dojo-balanced-parens-1.almd:374:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
374 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?190])
  --> /tmp/dojo-balanced-parens-1.almd:386:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
386 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?192])
  --> /tmp/dojo-balanced-parens-1.almd:387:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
387 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?194])
  --> /tmp/dojo-balanced-parens-1.almd:388:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
388 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?197])
  --> /tmp/dojo-balanced-parens-1.almd:400:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
400 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?199])
  --> /tmp/dojo-balanced-parens-1.almd:401:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
401 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?201])
  --> /tmp/dojo-balanced-parens-1.almd:402:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
402 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?204])
  --> /tmp/dojo-balanced-parens-1.almd:414:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
414 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?206])
  --> /tmp/dojo-balanced-parens-1.almd:415:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
415 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?208])
  --> /tmp/dojo-balanced-parens-1.almd:416:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
416 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?211])
  --> /tmp/dojo-balanced-parens-1.almd:428:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
428 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?213])
  --> /tmp/dojo-balanced-parens-1.almd:429:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
429 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?215])
  --> /tmp/dojo-balanced-parens-1.almd:430:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
430 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?218])
  --> /tmp/dojo-balanced-parens-1.almd:442:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
442 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?220])
  --> /tmp/dojo-balanced-parens-1.almd:443:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
443 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?222])
  --> /tmp/dojo-balanced-parens-1.almd:444:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
444 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?225])
  --> /tmp/dojo-balanced-parens-1.almd:456:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
456 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?227])
  --> /tmp/dojo-balanced-parens-1.almd:457:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
457 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?229])
  --> /tmp/dojo-balanced-parens-1.almd:458:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
458 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^

627 error(s) found
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
      '(' => list.push(stack, ")"),
      '[' => list.push(stack, "]"),
      '{' => list.push(stack, "}"),
      ')' => if list.is_empty(stack) then false else list.pop(stack),
      ']' => if list.is_empty(stack) then false else list.pop(stack),
      '}' => if list.is_empty(stack) then false else list.pop(stack),
      _ => (),
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
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:2:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |               ^^^^^^^^
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
  here: '(' => list.push(stack, ")"),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
5 |       '(' => list.push(stack, ")"),
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]"),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
6 |       '[' => list.push(stack, "]"),
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}"),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
7 |       '{' => list.push(stack, "}"),
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack),
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?1]
  --> /tmp/dojo-balanced-parens-2.almd:8:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Both branches of `if/then/else` must have the same type
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?3]
  --> /tmp/dojo-balanced-parens-2.almd:9:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Both branches of `if/then/else` must have the same type
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?5]
  --> /tmp/dojo-balanced-parens-2.almd:10:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Both branches of `if/then/else` must have the same type
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack),
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:11:12
  in match arm
  here: _ => (),
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => (),
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:11:12
  in match arm
  here: _ => (),
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => (),
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:11:12
  in match arm
  here: _ => (),
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => (),
   |            ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-balanced-parens-2.almd:8:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-balanced-parens-2.almd:9:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-2.almd:10:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack),
   |                                                      ^^^^^^^^^^^^^^^

18 error(s) found
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
      '(' => list.push(stack, ")"),
      '[' => list.push(stack, "]"),
      '{' => list.push(stack, "}"),
      ')' => if list.is_empty(stack) then false else list.pop(stack),
      ']' => if list.is_empty(stack) then false else list.pop(stack),
      '}' => if list.is_empty(stack) then false else list.pop(stack),
      _ => (),
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
  --> /tmp/dojo-balanced-parens-3.almd:2:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |               ^^^^^^^^
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
  here: '(' => list.push(stack, ")"),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
5 |       '(' => list.push(stack, ")"),
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]"),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
6 |       '[' => list.push(stack, "]"),
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}"),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
7 |       '{' => list.push(stack, "}"),
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack),
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?1]
  --> /tmp/dojo-balanced-parens-3.almd:8:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Both branches of `if/then/else` must have the same type
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?3]
  --> /tmp/dojo-balanced-parens-3.almd:9:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Both branches of `if/then/else` must have the same type
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?5]
  --> /tmp/dojo-balanced-parens-3.almd:10:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Both branches of `if/then/else` must have the same type
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack),
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:11:12
  in match arm
  here: _ => (),
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => (),
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:11:12
  in match arm
  here: _ => (),
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => (),
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:11:12
  in match arm
  here: _ => (),
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       _ => (),
   |            ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-balanced-parens-3.almd:8:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?3])
  --> /tmp/dojo-balanced-parens-3.almd:9:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack),
  |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-3.almd:10:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack),
   |                                                      ^^^^^^^^^^^^^^^

18 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
