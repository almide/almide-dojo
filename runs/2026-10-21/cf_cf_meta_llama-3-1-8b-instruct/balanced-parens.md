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

fn is
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:13:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   }
   |   ^
error: Expected LBrace at line 18:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:18:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 32:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:32:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
32 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 46:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:46:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 60:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:60:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
60 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 74:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:74:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
74 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 88:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:88:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
88 |   for c in string.chars(s) do
   |                            ^
error: Expected LBrace at line 102:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:102:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
102 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 116:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:116:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
116 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 130:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:130:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
130 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 144:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:144:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
144 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 158:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:158:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
158 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 172:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:172:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
172 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 186:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:186:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
186 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 200:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:200:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
200 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 214:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:214:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
214 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 228:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:228:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
228 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 242:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:242:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
242 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 256:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:256:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
256 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 270:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:270:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
270 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 284:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:284:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
284 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 298:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:298:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
298 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 312:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:312:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
312 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 326:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:326:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
326 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 340:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:340:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
340 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 354:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:354:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
354 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 368:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:368:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
368 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 382:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:382:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
382 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 396:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:396:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
396 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 410:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:410:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
410 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 424:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:424:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
424 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 438:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:438:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
438 |   for c in string.chars(s) do
    |                            ^
error: Expected LBrace at line 452:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:452:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
452 |   for c in string.chars(s) do
    |                            ^
error: Expected LParen at line 464:6 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:464:6
  here: fn is
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
464 | fn is
    |      ^
error[E012]: duplicate function 'is_balanced'
  at line 16
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
16 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 30
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
30 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 44
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
44 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 58
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
58 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 72
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
72 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 86
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
86 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 100
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
100 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 114
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
114 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 128
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
128 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 142
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
142 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 156
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
156 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 170
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
170 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 184
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
184 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 198
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
198 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 212
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
212 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 226
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
226 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 240
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
240 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 254
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
254 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 268
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
268 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 282
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
282 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 296
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
296 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 310
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
310 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 324
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
324 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 338
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
338 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 352
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
352 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 366
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
366 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 380
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
380 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 394
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
394 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 408
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
408 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 422
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
422 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 436
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
436 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 450
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
450 | fn is_balanced(s: String) -> Bool =
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
  --> /tmp/dojo-balanced-parens-1.almd:17:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
17 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:19:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
19 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:20:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
20 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:21:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
21 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:22:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
22 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:23:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
23 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:24:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
24 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:25:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
25 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:31:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
31 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:33:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
33 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:34:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
34 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:35:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
35 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:36:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
36 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:37:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
37 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:38:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
38 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:39:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
39 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:45:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
45 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:47:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
47 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:48:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
48 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:49:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
49 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:50:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
50 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:51:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
51 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:52:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
52 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:53:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
53 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:59:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
59 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:61:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
61 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:62:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
62 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:63:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
63 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:64:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
64 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:65:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
65 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:66:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
66 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:67:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
67 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:73:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
73 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:75:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
75 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:76:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
76 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:77:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
77 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:78:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
78 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:79:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
79 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:80:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
80 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:81:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
81 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:87:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
87 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:89:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
89 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:90:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
90 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:91:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
91 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:92:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
92 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:93:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
93 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:94:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
94 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:95:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
95 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:101:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
101 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:103:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
103 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:104:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
104 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:105:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
105 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:106:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
106 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:107:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
107 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:108:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
108 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:109:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
109 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:115:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
115 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:117:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
117 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:118:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
118 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:119:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
119 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:120:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
120 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:121:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
121 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:122:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
122 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:123:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
123 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:129:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
129 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:131:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
131 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:132:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
132 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:133:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
133 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:134:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
134 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:135:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
135 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:136:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
136 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:137:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
137 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:143:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
143 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:145:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
145 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:146:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
146 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:147:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
147 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:148:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
148 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:149:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
149 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:150:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
150 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:151:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
151 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:157:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
157 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:159:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
159 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:160:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
160 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:161:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
161 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:162:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
162 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:163:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
163 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:164:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
164 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:165:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
165 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:171:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
171 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:173:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
173 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:174:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
174 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:175:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
175 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:176:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
176 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:177:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
177 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:178:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
178 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:179:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
179 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:185:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
185 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:187:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
187 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:188:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
188 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:189:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
189 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:190:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
190 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:191:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
191 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:192:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
192 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:193:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
193 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:199:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
199 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:201:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
201 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:202:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
202 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:203:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
203 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:204:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
204 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:205:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
205 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:206:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
206 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:207:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
207 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:213:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
213 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:215:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
215 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:216:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
216 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:217:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
217 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:218:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
218 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:219:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
219 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:220:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
220 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:221:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
221 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:227:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
227 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:229:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
229 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:230:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
230 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:231:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
231 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:232:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
232 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:233:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
233 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:234:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
234 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:235:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
235 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:241:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
241 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:243:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
243 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:244:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
244 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:245:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
245 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:246:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
246 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:247:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
247 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:248:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
248 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:249:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
249 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:255:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
255 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:257:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
257 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:258:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
258 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:259:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
259 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:260:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
260 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:261:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
261 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:262:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
262 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:263:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
263 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:269:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
269 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:271:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
271 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:272:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
272 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:273:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
273 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:274:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
274 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:275:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
275 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:276:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
276 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:277:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
277 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:283:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
283 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:285:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
285 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:286:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
286 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:287:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
287 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:288:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
288 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:289:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
289 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:290:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
290 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:291:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
291 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:297:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
297 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:299:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
299 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:300:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
300 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:301:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
301 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:302:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
302 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:303:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
303 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:304:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
304 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:305:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
305 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:311:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
311 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:313:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
313 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:314:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
314 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:315:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
315 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:316:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
316 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:317:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
317 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:318:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
318 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:319:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
319 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:325:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
325 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:327:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
327 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:328:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
328 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:329:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
329 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:330:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
330 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:331:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
331 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:332:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
332 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:333:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
333 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:339:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
339 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:341:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
341 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:342:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
342 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:343:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
343 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:344:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
344 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:345:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
345 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:346:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
346 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:347:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
347 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:353:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
353 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:355:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
355 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:356:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
356 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:357:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
357 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:358:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
358 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:359:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
359 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:360:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
360 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:361:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
361 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:367:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
367 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:369:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
369 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:370:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
370 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:371:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
371 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:372:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
372 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:373:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
373 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:374:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
374 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:375:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
375 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:381:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
381 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:383:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
383 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:384:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
384 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:385:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
385 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:386:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
386 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:387:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
387 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:388:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
388 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:389:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
389 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:395:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
395 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:397:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
397 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:398:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
398 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:399:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
399 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:400:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
400 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:401:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
401 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:402:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
402 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:403:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
403 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:409:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
409 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:411:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
411 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:412:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
412 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:413:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
413 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:414:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
414 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:415:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
415 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:416:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
416 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:417:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
417 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:423:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
423 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:425:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
425 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:426:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
426 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:427:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
427 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:428:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
428 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:429:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
429 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:430:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
430 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:431:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
431 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:437:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
437 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:439:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
439 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:440:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
440 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:441:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
441 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:442:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
442 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:443:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
443 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:444:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
444 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:445:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
445 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:451:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
451 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:453:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
453 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:454:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
454 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:455:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
455 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:456:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
456 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:457:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
457 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:458:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
458 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:459:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
459 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:11:12
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
error[E001]: type mismatch in if branches: expected Bool but got Option[?7]
  --> /tmp/dojo-balanced-parens-1.almd:23:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
23 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?9]
  --> /tmp/dojo-balanced-parens-1.almd:24:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
24 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?11]
  --> /tmp/dojo-balanced-parens-1.almd:25:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
25 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:26:12
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
26 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:26:12
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
26 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:26:12
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
26 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?14]
  --> /tmp/dojo-balanced-parens-1.almd:37:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
37 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?16]
  --> /tmp/dojo-balanced-parens-1.almd:38:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
38 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?18]
  --> /tmp/dojo-balanced-parens-1.almd:39:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
39 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:40:12
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
40 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:40:12
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
40 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:40:12
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
40 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?21]
  --> /tmp/dojo-balanced-parens-1.almd:51:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
51 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?23]
  --> /tmp/dojo-balanced-parens-1.almd:52:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
52 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?25]
  --> /tmp/dojo-balanced-parens-1.almd:53:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
53 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:54:12
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
54 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:54:12
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
54 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:54:12
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
54 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?28]
  --> /tmp/dojo-balanced-parens-1.almd:65:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
65 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?30]
  --> /tmp/dojo-balanced-parens-1.almd:66:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
66 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?32]
  --> /tmp/dojo-balanced-parens-1.almd:67:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
67 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:68:12
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
68 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:68:12
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
68 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:68:12
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
68 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?35]
  --> /tmp/dojo-balanced-parens-1.almd:79:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
79 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?37]
  --> /tmp/dojo-balanced-parens-1.almd:80:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
80 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?39]
  --> /tmp/dojo-balanced-parens-1.almd:81:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
81 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:82:12
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
82 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:82:12
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
82 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:82:12
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
82 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?42]
  --> /tmp/dojo-balanced-parens-1.almd:93:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
93 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?44]
  --> /tmp/dojo-balanced-parens-1.almd:94:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
94 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?46]
  --> /tmp/dojo-balanced-parens-1.almd:95:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
95 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:96:12
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
96 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:96:12
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
96 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:96:12
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
96 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?49]
  --> /tmp/dojo-balanced-parens-1.almd:107:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
107 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?51]
  --> /tmp/dojo-balanced-parens-1.almd:108:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
108 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?53]
  --> /tmp/dojo-balanced-parens-1.almd:109:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
109 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:110:12
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
110 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:110:12
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
110 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:110:12
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
110 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?56]
  --> /tmp/dojo-balanced-parens-1.almd:121:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
121 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?58]
  --> /tmp/dojo-balanced-parens-1.almd:122:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
122 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?60]
  --> /tmp/dojo-balanced-parens-1.almd:123:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
123 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:124:12
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
124 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:124:12
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
124 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:124:12
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
124 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?63]
  --> /tmp/dojo-balanced-parens-1.almd:135:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
135 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?65]
  --> /tmp/dojo-balanced-parens-1.almd:136:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
136 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?67]
  --> /tmp/dojo-balanced-parens-1.almd:137:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
137 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:138:12
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
138 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:138:12
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
138 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:138:12
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
138 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?70]
  --> /tmp/dojo-balanced-parens-1.almd:149:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
149 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?72]
  --> /tmp/dojo-balanced-parens-1.almd:150:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
150 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?74]
  --> /tmp/dojo-balanced-parens-1.almd:151:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
151 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:152:12
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
152 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:152:12
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
152 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:152:12
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
152 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?77]
  --> /tmp/dojo-balanced-parens-1.almd:163:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
163 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?79]
  --> /tmp/dojo-balanced-parens-1.almd:164:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
164 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?81]
  --> /tmp/dojo-balanced-parens-1.almd:165:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
165 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:166:12
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
166 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:166:12
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
166 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:166:12
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
166 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?84]
  --> /tmp/dojo-balanced-parens-1.almd:177:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
177 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?86]
  --> /tmp/dojo-balanced-parens-1.almd:178:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
178 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?88]
  --> /tmp/dojo-balanced-parens-1.almd:179:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
179 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:180:12
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
180 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:180:12
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
180 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:180:12
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
180 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?91]
  --> /tmp/dojo-balanced-parens-1.almd:191:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
191 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?93]
  --> /tmp/dojo-balanced-parens-1.almd:192:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
192 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?95]
  --> /tmp/dojo-balanced-parens-1.almd:193:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
193 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:194:12
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
194 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:194:12
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
194 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:194:12
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
194 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?98]
  --> /tmp/dojo-balanced-parens-1.almd:205:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
205 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?100]
  --> /tmp/dojo-balanced-parens-1.almd:206:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
206 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?102]
  --> /tmp/dojo-balanced-parens-1.almd:207:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
207 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:208:12
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
208 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:208:12
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
208 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:208:12
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
208 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?105]
  --> /tmp/dojo-balanced-parens-1.almd:219:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
219 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?107]
  --> /tmp/dojo-balanced-parens-1.almd:220:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
220 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?109]
  --> /tmp/dojo-balanced-parens-1.almd:221:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
221 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:222:12
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
222 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:222:12
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
222 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:222:12
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
222 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?112]
  --> /tmp/dojo-balanced-parens-1.almd:233:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
233 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?114]
  --> /tmp/dojo-balanced-parens-1.almd:234:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
234 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?116]
  --> /tmp/dojo-balanced-parens-1.almd:235:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
235 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:236:12
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
236 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:236:12
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
236 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:236:12
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
236 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?119]
  --> /tmp/dojo-balanced-parens-1.almd:247:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
247 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?121]
  --> /tmp/dojo-balanced-parens-1.almd:248:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
248 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?123]
  --> /tmp/dojo-balanced-parens-1.almd:249:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
249 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:250:12
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
250 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:250:12
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
250 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:250:12
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
250 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?126]
  --> /tmp/dojo-balanced-parens-1.almd:261:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
261 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?128]
  --> /tmp/dojo-balanced-parens-1.almd:262:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
262 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?130]
  --> /tmp/dojo-balanced-parens-1.almd:263:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
263 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:264:12
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
264 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:264:12
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
264 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:264:12
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
264 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?133]
  --> /tmp/dojo-balanced-parens-1.almd:275:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
275 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?135]
  --> /tmp/dojo-balanced-parens-1.almd:276:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
276 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?137]
  --> /tmp/dojo-balanced-parens-1.almd:277:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
277 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:278:12
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
278 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:278:12
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
278 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:278:12
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
278 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?140]
  --> /tmp/dojo-balanced-parens-1.almd:289:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
289 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?142]
  --> /tmp/dojo-balanced-parens-1.almd:290:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
290 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?144]
  --> /tmp/dojo-balanced-parens-1.almd:291:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
291 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:292:12
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
292 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:292:12
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
292 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:292:12
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
292 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?147]
  --> /tmp/dojo-balanced-parens-1.almd:303:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
303 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?149]
  --> /tmp/dojo-balanced-parens-1.almd:304:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
304 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?151]
  --> /tmp/dojo-balanced-parens-1.almd:305:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
305 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:306:12
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
306 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:306:12
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
306 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:306:12
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
306 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?154]
  --> /tmp/dojo-balanced-parens-1.almd:317:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
317 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?156]
  --> /tmp/dojo-balanced-parens-1.almd:318:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
318 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?158]
  --> /tmp/dojo-balanced-parens-1.almd:319:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
319 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:320:12
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
320 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:320:12
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
320 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:320:12
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
320 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?161]
  --> /tmp/dojo-balanced-parens-1.almd:331:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
331 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?163]
  --> /tmp/dojo-balanced-parens-1.almd:332:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
332 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?165]
  --> /tmp/dojo-balanced-parens-1.almd:333:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
333 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:334:12
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
334 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:334:12
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
334 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:334:12
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
334 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?168]
  --> /tmp/dojo-balanced-parens-1.almd:345:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
345 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?170]
  --> /tmp/dojo-balanced-parens-1.almd:346:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
346 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?172]
  --> /tmp/dojo-balanced-parens-1.almd:347:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
347 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:348:12
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
348 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:348:12
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
348 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:348:12
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
348 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?175]
  --> /tmp/dojo-balanced-parens-1.almd:359:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
359 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?177]
  --> /tmp/dojo-balanced-parens-1.almd:360:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
360 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?179]
  --> /tmp/dojo-balanced-parens-1.almd:361:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
361 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:362:12
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
362 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:362:12
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
362 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:362:12
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
362 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?182]
  --> /tmp/dojo-balanced-parens-1.almd:373:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
373 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?184]
  --> /tmp/dojo-balanced-parens-1.almd:374:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
374 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?186]
  --> /tmp/dojo-balanced-parens-1.almd:375:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
375 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:376:12
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
376 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:376:12
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
376 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:376:12
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
376 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?189]
  --> /tmp/dojo-balanced-parens-1.almd:387:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
387 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?191]
  --> /tmp/dojo-balanced-parens-1.almd:388:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
388 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?193]
  --> /tmp/dojo-balanced-parens-1.almd:389:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
389 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:390:12
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
390 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:390:12
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
390 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:390:12
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
390 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?196]
  --> /tmp/dojo-balanced-parens-1.almd:401:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
401 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?198]
  --> /tmp/dojo-balanced-parens-1.almd:402:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
402 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?200]
  --> /tmp/dojo-balanced-parens-1.almd:403:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
403 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:404:12
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
404 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:404:12
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
404 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:404:12
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
404 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?203]
  --> /tmp/dojo-balanced-parens-1.almd:415:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
415 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?205]
  --> /tmp/dojo-balanced-parens-1.almd:416:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
416 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?207]
  --> /tmp/dojo-balanced-parens-1.almd:417:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
417 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:418:12
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
418 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:418:12
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
418 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:418:12
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
418 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?210]
  --> /tmp/dojo-balanced-parens-1.almd:429:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
429 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?212]
  --> /tmp/dojo-balanced-parens-1.almd:430:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
430 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?214]
  --> /tmp/dojo-balanced-parens-1.almd:431:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
431 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:432:12
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
432 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:432:12
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
432 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:432:12
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
432 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?217]
  --> /tmp/dojo-balanced-parens-1.almd:443:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
443 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?219]
  --> /tmp/dojo-balanced-parens-1.almd:444:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
444 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?221]
  --> /tmp/dojo-balanced-parens-1.almd:445:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
445 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:446:12
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
446 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:446:12
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
446 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:446:12
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
446 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?224]
  --> /tmp/dojo-balanced-parens-1.almd:457:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
457 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?226]
  --> /tmp/dojo-balanced-parens-1.almd:458:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
458 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?228]
  --> /tmp/dojo-balanced-parens-1.almd:459:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
459 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:460:12
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
460 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:460:12
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
460 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:460:12
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
460 |       _ => ()
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
error[E025]: cannot infer a concrete type for this expression (type Option[?7])
  --> /tmp/dojo-balanced-parens-1.almd:23:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?9])
  --> /tmp/dojo-balanced-parens-1.almd:24:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?11])
  --> /tmp/dojo-balanced-parens-1.almd:25:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
25 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?14])
  --> /tmp/dojo-balanced-parens-1.almd:37:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
37 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?16])
  --> /tmp/dojo-balanced-parens-1.almd:38:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?18])
  --> /tmp/dojo-balanced-parens-1.almd:39:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
39 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?21])
  --> /tmp/dojo-balanced-parens-1.almd:51:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
51 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?23])
  --> /tmp/dojo-balanced-parens-1.almd:52:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
52 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?25])
  --> /tmp/dojo-balanced-parens-1.almd:53:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
53 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?28])
  --> /tmp/dojo-balanced-parens-1.almd:65:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
65 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?30])
  --> /tmp/dojo-balanced-parens-1.almd:66:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
66 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?32])
  --> /tmp/dojo-balanced-parens-1.almd:67:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
67 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?35])
  --> /tmp/dojo-balanced-parens-1.almd:79:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
79 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?37])
  --> /tmp/dojo-balanced-parens-1.almd:80:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
80 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?39])
  --> /tmp/dojo-balanced-parens-1.almd:81:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
81 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?42])
  --> /tmp/dojo-balanced-parens-1.almd:93:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
93 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?44])
  --> /tmp/dojo-balanced-parens-1.almd:94:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
94 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?46])
  --> /tmp/dojo-balanced-parens-1.almd:95:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
95 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?49])
  --> /tmp/dojo-balanced-parens-1.almd:107:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
107 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?51])
  --> /tmp/dojo-balanced-parens-1.almd:108:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
108 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?53])
  --> /tmp/dojo-balanced-parens-1.almd:109:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
109 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?56])
  --> /tmp/dojo-balanced-parens-1.almd:121:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
121 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?58])
  --> /tmp/dojo-balanced-parens-1.almd:122:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
122 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?60])
  --> /tmp/dojo-balanced-parens-1.almd:123:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
123 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?63])
  --> /tmp/dojo-balanced-parens-1.almd:135:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
135 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?65])
  --> /tmp/dojo-balanced-parens-1.almd:136:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
136 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?67])
  --> /tmp/dojo-balanced-parens-1.almd:137:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
137 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?70])
  --> /tmp/dojo-balanced-parens-1.almd:149:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
149 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?72])
  --> /tmp/dojo-balanced-parens-1.almd:150:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
150 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?74])
  --> /tmp/dojo-balanced-parens-1.almd:151:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
151 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?77])
  --> /tmp/dojo-balanced-parens-1.almd:163:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
163 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?79])
  --> /tmp/dojo-balanced-parens-1.almd:164:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
164 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?81])
  --> /tmp/dojo-balanced-parens-1.almd:165:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
165 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?84])
  --> /tmp/dojo-balanced-parens-1.almd:177:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
177 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?86])
  --> /tmp/dojo-balanced-parens-1.almd:178:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
178 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?88])
  --> /tmp/dojo-balanced-parens-1.almd:179:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
179 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?91])
  --> /tmp/dojo-balanced-parens-1.almd:191:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
191 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?93])
  --> /tmp/dojo-balanced-parens-1.almd:192:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
192 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?95])
  --> /tmp/dojo-balanced-parens-1.almd:193:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
193 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?98])
  --> /tmp/dojo-balanced-parens-1.almd:205:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
205 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?100])
  --> /tmp/dojo-balanced-parens-1.almd:206:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
206 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?102])
  --> /tmp/dojo-balanced-parens-1.almd:207:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
207 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?105])
  --> /tmp/dojo-balanced-parens-1.almd:219:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
219 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?107])
  --> /tmp/dojo-balanced-parens-1.almd:220:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
220 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?109])
  --> /tmp/dojo-balanced-parens-1.almd:221:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
221 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?112])
  --> /tmp/dojo-balanced-parens-1.almd:233:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
233 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?114])
  --> /tmp/dojo-balanced-parens-1.almd:234:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
234 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?116])
  --> /tmp/dojo-balanced-parens-1.almd:235:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
235 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?119])
  --> /tmp/dojo-balanced-parens-1.almd:247:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
247 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?121])
  --> /tmp/dojo-balanced-parens-1.almd:248:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
248 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?123])
  --> /tmp/dojo-balanced-parens-1.almd:249:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
249 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?126])
  --> /tmp/dojo-balanced-parens-1.almd:261:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
261 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?128])
  --> /tmp/dojo-balanced-parens-1.almd:262:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
262 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?130])
  --> /tmp/dojo-balanced-parens-1.almd:263:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
263 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?133])
  --> /tmp/dojo-balanced-parens-1.almd:275:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
275 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?135])
  --> /tmp/dojo-balanced-parens-1.almd:276:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
276 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?137])
  --> /tmp/dojo-balanced-parens-1.almd:277:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
277 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?140])
  --> /tmp/dojo-balanced-parens-1.almd:289:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
289 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?142])
  --> /tmp/dojo-balanced-parens-1.almd:290:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
290 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?144])
  --> /tmp/dojo-balanced-parens-1.almd:291:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
291 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?147])
  --> /tmp/dojo-balanced-parens-1.almd:303:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
303 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?149])
  --> /tmp/dojo-balanced-parens-1.almd:304:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
304 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?151])
  --> /tmp/dojo-balanced-parens-1.almd:305:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
305 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?154])
  --> /tmp/dojo-balanced-parens-1.almd:317:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
317 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?156])
  --> /tmp/dojo-balanced-parens-1.almd:318:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
318 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?158])
  --> /tmp/dojo-balanced-parens-1.almd:319:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
319 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?161])
  --> /tmp/dojo-balanced-parens-1.almd:331:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
331 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?163])
  --> /tmp/dojo-balanced-parens-1.almd:332:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
332 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?165])
  --> /tmp/dojo-balanced-parens-1.almd:333:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
333 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?168])
  --> /tmp/dojo-balanced-parens-1.almd:345:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
345 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?170])
  --> /tmp/dojo-balanced-parens-1.almd:346:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
346 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?172])
  --> /tmp/dojo-balanced-parens-1.almd:347:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
347 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?175])
  --> /tmp/dojo-balanced-parens-1.almd:359:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
359 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?177])
  --> /tmp/dojo-balanced-parens-1.almd:360:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
360 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?179])
  --> /tmp/dojo-balanced-parens-1.almd:361:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
361 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?182])
  --> /tmp/dojo-balanced-parens-1.almd:373:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
373 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?184])
  --> /tmp/dojo-balanced-parens-1.almd:374:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
374 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?186])
  --> /tmp/dojo-balanced-parens-1.almd:375:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
375 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?189])
  --> /tmp/dojo-balanced-parens-1.almd:387:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
387 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?191])
  --> /tmp/dojo-balanced-parens-1.almd:388:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
388 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?193])
  --> /tmp/dojo-balanced-parens-1.almd:389:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
389 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?196])
  --> /tmp/dojo-balanced-parens-1.almd:401:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
401 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?198])
  --> /tmp/dojo-balanced-parens-1.almd:402:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
402 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?200])
  --> /tmp/dojo-balanced-parens-1.almd:403:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
403 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?203])
  --> /tmp/dojo-balanced-parens-1.almd:415:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
415 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?205])
  --> /tmp/dojo-balanced-parens-1.almd:416:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
416 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?207])
  --> /tmp/dojo-balanced-parens-1.almd:417:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
417 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?210])
  --> /tmp/dojo-balanced-parens-1.almd:429:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
429 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?212])
  --> /tmp/dojo-balanced-parens-1.almd:430:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
430 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?214])
  --> /tmp/dojo-balanced-parens-1.almd:431:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
431 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?217])
  --> /tmp/dojo-balanced-parens-1.almd:443:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
443 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?219])
  --> /tmp/dojo-balanced-parens-1.almd:444:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
444 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?221])
  --> /tmp/dojo-balanced-parens-1.almd:445:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
445 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?224])
  --> /tmp/dojo-balanced-parens-1.almd:457:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
457 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?226])
  --> /tmp/dojo-balanced-parens-1.almd:458:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
458 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?228])
  --> /tmp/dojo-balanced-parens-1.almd:459:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
459 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^

629 error(s) found
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
