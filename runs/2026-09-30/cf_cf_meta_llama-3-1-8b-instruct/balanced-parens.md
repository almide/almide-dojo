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
  }
  list.is_empty(stack)

fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')'
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 28:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:28:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
28 |   }
   |   ^
error: Expected LBrace at line 33:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:33:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
33 |   for c in string.chars(s) do
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 43:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:43:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
43 |   }
   |   ^
error: Expected LBrace at line 48:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:48:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
48 |   for c in string.chars(s) do
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 58:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:58:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
58 |   }
   |   ^
error: Expected LBrace at line 63:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:63:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
63 |   for c in string.chars(s) do
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 73:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:73:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
73 |   }
   |   ^
error: Expected LBrace at line 78:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:78:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
78 |   for c in string.chars(s) do
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 88:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:88:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
88 |   }
   |   ^
error: Expected LBrace at line 93:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:93:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
93 |   for c in string.chars(s) do
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 103:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:103:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
103 |   }
    |   ^
error: Expected LBrace at line 108:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:108:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
108 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 118:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:118:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
118 |   }
    |   ^
error: Expected LBrace at line 123:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:123:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
123 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 133:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:133:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
133 |   }
    |   ^
error: Expected LBrace at line 138:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:138:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
138 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 148:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:148:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
148 |   }
    |   ^
error: Expected LBrace at line 153:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:153:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
153 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 163:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:163:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
163 |   }
    |   ^
error: Expected LBrace at line 168:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:168:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
168 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 178:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:178:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
178 |   }
    |   ^
error: Expected LBrace at line 183:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:183:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
183 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 193:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:193:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
193 |   }
    |   ^
error: Expected LBrace at line 198:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:198:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
198 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 208:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:208:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
208 |   }
    |   ^
error: Expected LBrace at line 213:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:213:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
213 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 223:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:223:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
223 |   }
    |   ^
error: Expected LBrace at line 228:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:228:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
228 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 238:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:238:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
238 |   }
    |   ^
error: Expected LBrace at line 243:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:243:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
243 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 253:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:253:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
253 |   }
    |   ^
error: Expected LBrace at line 258:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:258:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
258 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 268:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:268:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
268 |   }
    |   ^
error: Expected LBrace at line 273:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:273:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
273 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 283:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:283:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
283 |   }
    |   ^
error: Expected LBrace at line 288:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:288:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
288 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 298:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:298:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
298 |   }
    |   ^
error: Expected LBrace at line 303:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:303:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
303 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 313:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:313:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
313 |   }
    |   ^
error: Expected LBrace at line 318:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:318:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
318 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 328:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:328:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
328 |   }
    |   ^
error: Expected LBrace at line 333:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:333:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
333 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 343:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:343:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
343 |   }
    |   ^
error: Expected LBrace at line 348:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:348:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
348 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 358:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:358:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
358 |   }
    |   ^
error: Expected LBrace at line 363:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:363:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
363 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 373:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:373:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
373 |   }
    |   ^
error: Expected LBrace at line 378:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:378:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
378 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 388:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:388:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
388 |   }
    |   ^
error: Expected LBrace at line 393:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:393:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
393 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 403:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:403:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
403 |   }
    |   ^
error: Expected LBrace at line 408:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:408:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
408 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 418:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:418:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
418 |   }
    |   ^
error: Expected LBrace at line 423:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:423:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
423 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 433:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:433:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
433 |   }
    |   ^
error: Expected LBrace at line 438:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:438:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
438 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 448:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:448:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
448 |   }
    |   ^
error: Expected LBrace at line 453:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:453:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
453 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 463:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:463:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
463 |   }
    |   ^
error: Expected LBrace at line 468:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:468:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
468 |   for c in string.chars(s) do
    |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 478:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:478:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
478 |   }
    |   ^
error: Expected LBrace at line 483:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:483:28
  here: for c in string.chars(s) do
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
483 |   for c in string.chars(s) do
    |                            ^
error: Expected FatArrow at line 488:10 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:488:10
  here: ')'
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
488 |       ')'
    |          ^
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
  at line 31
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
31 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 46
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
46 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 61
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
61 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 76
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
76 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 91
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
91 | fn is_balanced(s: String) -> Bool =
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 106
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
106 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 121
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
121 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 136
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
136 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 151
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
151 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 166
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
166 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 181
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
181 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 196
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
196 | fn is_balanced(s: String) -> Bool =
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
  at line 241
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
241 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 256
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
256 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 271
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
271 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 286
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
286 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 301
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
301 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 316
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
316 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 331
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
331 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 346
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
346 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 361
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
361 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 376
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
376 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 391
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
391 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 406
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
406 | fn is_balanced(s: String) -> Bool =
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
  at line 451
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
451 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 466
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
466 | fn is_balanced(s: String) -> Bool =
    | ^
error[E012]: duplicate function 'is_balanced'
  at line 481
  in fn is_balanced
  here: fn is_balanced(s: String) -> Bool =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn is_balanced(s: String) -> Bool =
    | -------------------------------------- first definition of 'is_balanced' here
 ...
481 | fn is_balanced(s: String) -> Bool =
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
  --> /tmp/dojo-balanced-parens-1.almd:32:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
32 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:34:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
34 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:35:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
35 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:36:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
36 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:37:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
37 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:38:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
38 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:39:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
39 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:40:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
40 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:47:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
47 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:49:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
49 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:50:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
50 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:51:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
51 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:52:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
52 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:53:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
53 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:54:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
54 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:55:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
55 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:62:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
62 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:64:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
64 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:65:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
65 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:66:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
66 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:67:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
67 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:68:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
68 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:69:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
69 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:70:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
70 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:77:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
77 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:79:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
79 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:80:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
80 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:81:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
81 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:82:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
82 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:83:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
83 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:84:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
84 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:85:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
85 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:92:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
92 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:94:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
94 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:95:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
95 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:96:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
96 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:97:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
97 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:98:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
98 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:99:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
99 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:100:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
100 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:107:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
107 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:109:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
109 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:110:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
110 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:111:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
111 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:112:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
112 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:113:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
113 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:114:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
114 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:115:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
115 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:122:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
122 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:124:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
124 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:125:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
125 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:126:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
126 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:127:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
127 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:128:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
128 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:129:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
129 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:130:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
130 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:137:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
137 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:139:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
139 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:140:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
140 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:141:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
141 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:142:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
142 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:143:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
143 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:144:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
144 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:145:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
145 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:152:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
152 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:154:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
154 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:155:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
155 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:156:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
156 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:157:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
157 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:158:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
158 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:159:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
159 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:160:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
160 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:167:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
167 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:169:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
169 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:170:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
170 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:171:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
171 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:172:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
172 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:173:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
173 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:174:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
174 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:175:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
175 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:182:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
182 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:184:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
184 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:185:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
185 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:186:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
186 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:187:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
187 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:188:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
188 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:189:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
189 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:190:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
190 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:197:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
197 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:199:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
199 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:200:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
200 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:201:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
201 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:202:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
202 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:203:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
203 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:204:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
204 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:205:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
205 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
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
  --> /tmp/dojo-balanced-parens-1.almd:242:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
242 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:244:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
244 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:245:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
245 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:246:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
246 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:247:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
247 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:248:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
248 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:249:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
249 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:250:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
250 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:257:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
257 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:259:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
259 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:260:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
260 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:261:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
261 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:262:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
262 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:263:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
263 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:264:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
264 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:265:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
265 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:272:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
272 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:274:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
274 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:275:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
275 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:276:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
276 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:277:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
277 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:278:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
278 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:279:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
279 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:280:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
280 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:287:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
287 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:289:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
289 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:290:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
290 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:291:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
291 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:292:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
292 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:293:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
293 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:294:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
294 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:295:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
295 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:302:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
302 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:304:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
304 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:305:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
305 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:306:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
306 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:307:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
307 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:308:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
308 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:309:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
309 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:310:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
310 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:317:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
317 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:319:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
319 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:320:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
320 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:321:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
321 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:322:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
322 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:323:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
323 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:324:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
324 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:325:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
325 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:332:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
332 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:334:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
334 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:335:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
335 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:336:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
336 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:337:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
337 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:338:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
338 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:339:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
339 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:340:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
340 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:347:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
347 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:349:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
349 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:350:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
350 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:351:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
351 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:352:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
352 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:353:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
353 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:354:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
354 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:355:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
355 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:362:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
362 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:364:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
364 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:365:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
365 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:366:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
366 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:367:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
367 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:368:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
368 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:369:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
369 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:370:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
370 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:377:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
377 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:379:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
379 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:380:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
380 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:381:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
381 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:382:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
382 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:383:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
383 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:384:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
384 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:385:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
385 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:392:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
392 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:394:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
394 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:395:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
395 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:396:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
396 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:397:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
397 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:398:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
398 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:399:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
399 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:400:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
400 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:407:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
407 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:409:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
409 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:410:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
410 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:411:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
411 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:412:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
412 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:413:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
413 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:414:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
414 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:415:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
415 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
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
  --> /tmp/dojo-balanced-parens-1.almd:452:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
452 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:454:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
454 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:455:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
455 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:456:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
456 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:457:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
457 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:458:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
458 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:459:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
459 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:460:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
460 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:467:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
467 |   let stack = list.new[String]()
    |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:469:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
    |
469 |     match c {
    |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:470:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
470 |       '(' => list.push(stack, ")")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:471:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
471 |       '[' => list.push(stack, "]")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-1.almd:472:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
472 |       '{' => list.push(stack, "}")
    |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:473:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
473 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:474:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
474 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-1.almd:475:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
    |
475 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:482:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
    |
482 |   let stack = list.new[String]()
    |               ^^^^^^^^
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:26:12
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
26 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?13]
  --> /tmp/dojo-balanced-parens-1.almd:38:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
38 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?15]
  --> /tmp/dojo-balanced-parens-1.almd:39:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
39 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?17]
  --> /tmp/dojo-balanced-parens-1.almd:40:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
40 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:41:12
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
41 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:41:12
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
41 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:41:12
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
41 |       _ => ()
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:41:12
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
41 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?19]
  --> /tmp/dojo-balanced-parens-1.almd:53:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
53 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?21]
  --> /tmp/dojo-balanced-parens-1.almd:54:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
54 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?23]
  --> /tmp/dojo-balanced-parens-1.almd:55:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
55 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:56:12
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
56 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:56:12
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
56 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:56:12
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
56 |       _ => ()
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:56:12
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
56 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?25]
  --> /tmp/dojo-balanced-parens-1.almd:68:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
68 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?27]
  --> /tmp/dojo-balanced-parens-1.almd:69:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
69 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?29]
  --> /tmp/dojo-balanced-parens-1.almd:70:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
70 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:71:12
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
71 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:71:12
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
71 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:71:12
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
71 |       _ => ()
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:71:12
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
71 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?31]
  --> /tmp/dojo-balanced-parens-1.almd:83:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
83 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?33]
  --> /tmp/dojo-balanced-parens-1.almd:84:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
84 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?35]
  --> /tmp/dojo-balanced-parens-1.almd:85:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
85 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:86:12
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
86 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:86:12
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
86 |       _ => ()
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:86:12
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
86 |       _ => ()
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:86:12
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
86 |       _ => ()
   |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?37]
  --> /tmp/dojo-balanced-parens-1.almd:98:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
98 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?39]
  --> /tmp/dojo-balanced-parens-1.almd:99:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
99 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?41]
  --> /tmp/dojo-balanced-parens-1.almd:100:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
100 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:101:12
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
101 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:101:12
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
101 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:101:12
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
101 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:101:12
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
101 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?43]
  --> /tmp/dojo-balanced-parens-1.almd:113:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
113 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?45]
  --> /tmp/dojo-balanced-parens-1.almd:114:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
114 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?47]
  --> /tmp/dojo-balanced-parens-1.almd:115:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
115 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:116:12
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
116 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:116:12
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
116 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:116:12
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
116 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:116:12
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
116 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?49]
  --> /tmp/dojo-balanced-parens-1.almd:128:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
128 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?51]
  --> /tmp/dojo-balanced-parens-1.almd:129:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
129 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?53]
  --> /tmp/dojo-balanced-parens-1.almd:130:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
130 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:131:12
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
131 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:131:12
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
131 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:131:12
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
131 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:131:12
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
131 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?55]
  --> /tmp/dojo-balanced-parens-1.almd:143:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
143 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?57]
  --> /tmp/dojo-balanced-parens-1.almd:144:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
144 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?59]
  --> /tmp/dojo-balanced-parens-1.almd:145:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
145 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:146:12
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
146 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:146:12
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
146 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:146:12
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
146 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:146:12
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
146 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?61]
  --> /tmp/dojo-balanced-parens-1.almd:158:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
158 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?63]
  --> /tmp/dojo-balanced-parens-1.almd:159:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
159 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?65]
  --> /tmp/dojo-balanced-parens-1.almd:160:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
160 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:161:12
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
161 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:161:12
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
161 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:161:12
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
161 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:161:12
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
161 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?67]
  --> /tmp/dojo-balanced-parens-1.almd:173:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
173 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?69]
  --> /tmp/dojo-balanced-parens-1.almd:174:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
174 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?71]
  --> /tmp/dojo-balanced-parens-1.almd:175:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
175 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:176:12
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
176 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:176:12
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
176 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:176:12
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
176 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:176:12
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
176 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?73]
  --> /tmp/dojo-balanced-parens-1.almd:188:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
188 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?75]
  --> /tmp/dojo-balanced-parens-1.almd:189:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
189 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?77]
  --> /tmp/dojo-balanced-parens-1.almd:190:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
190 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:191:12
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
191 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:191:12
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
191 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:191:12
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
191 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:191:12
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
191 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?79]
  --> /tmp/dojo-balanced-parens-1.almd:203:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
203 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?81]
  --> /tmp/dojo-balanced-parens-1.almd:204:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
204 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?83]
  --> /tmp/dojo-balanced-parens-1.almd:205:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
205 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:206:12
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
206 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:206:12
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
206 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:206:12
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
206 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:206:12
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
206 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?85]
  --> /tmp/dojo-balanced-parens-1.almd:218:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
218 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?87]
  --> /tmp/dojo-balanced-parens-1.almd:219:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
219 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?89]
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:221:12
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
221 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?91]
  --> /tmp/dojo-balanced-parens-1.almd:233:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
233 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?93]
  --> /tmp/dojo-balanced-parens-1.almd:234:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
234 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?95]
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:236:12
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
236 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?97]
  --> /tmp/dojo-balanced-parens-1.almd:248:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
248 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?99]
  --> /tmp/dojo-balanced-parens-1.almd:249:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
249 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?101]
  --> /tmp/dojo-balanced-parens-1.almd:250:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
250 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:251:12
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
251 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:251:12
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
251 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:251:12
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
251 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:251:12
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
251 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?103]
  --> /tmp/dojo-balanced-parens-1.almd:263:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
263 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?105]
  --> /tmp/dojo-balanced-parens-1.almd:264:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
264 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?107]
  --> /tmp/dojo-balanced-parens-1.almd:265:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
265 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:266:12
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
266 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:266:12
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
266 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:266:12
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
266 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:266:12
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
266 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?109]
  --> /tmp/dojo-balanced-parens-1.almd:278:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
278 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?111]
  --> /tmp/dojo-balanced-parens-1.almd:279:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
279 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?113]
  --> /tmp/dojo-balanced-parens-1.almd:280:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
280 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:281:12
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
281 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:281:12
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
281 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:281:12
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
281 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:281:12
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
281 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?115]
  --> /tmp/dojo-balanced-parens-1.almd:293:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
293 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?117]
  --> /tmp/dojo-balanced-parens-1.almd:294:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
294 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?119]
  --> /tmp/dojo-balanced-parens-1.almd:295:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
295 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:296:12
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
296 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:296:12
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
296 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:296:12
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
296 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:296:12
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
296 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?121]
  --> /tmp/dojo-balanced-parens-1.almd:308:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
308 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?123]
  --> /tmp/dojo-balanced-parens-1.almd:309:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
309 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?125]
  --> /tmp/dojo-balanced-parens-1.almd:310:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
310 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:311:12
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
311 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:311:12
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
311 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:311:12
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
311 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:311:12
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
311 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?127]
  --> /tmp/dojo-balanced-parens-1.almd:323:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
323 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?129]
  --> /tmp/dojo-balanced-parens-1.almd:324:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
324 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?131]
  --> /tmp/dojo-balanced-parens-1.almd:325:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
325 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:326:12
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
326 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:326:12
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
326 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:326:12
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
326 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:326:12
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
326 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?133]
  --> /tmp/dojo-balanced-parens-1.almd:338:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
338 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?135]
  --> /tmp/dojo-balanced-parens-1.almd:339:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
339 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?137]
  --> /tmp/dojo-balanced-parens-1.almd:340:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
340 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:341:12
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
341 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:341:12
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
341 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:341:12
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
341 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:341:12
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
341 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?139]
  --> /tmp/dojo-balanced-parens-1.almd:353:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
353 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?141]
  --> /tmp/dojo-balanced-parens-1.almd:354:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
354 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?143]
  --> /tmp/dojo-balanced-parens-1.almd:355:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
355 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:356:12
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
356 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:356:12
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
356 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:356:12
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
356 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:356:12
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
356 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?145]
  --> /tmp/dojo-balanced-parens-1.almd:368:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
368 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?147]
  --> /tmp/dojo-balanced-parens-1.almd:369:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
369 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?149]
  --> /tmp/dojo-balanced-parens-1.almd:370:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
370 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:371:12
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
371 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:371:12
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
371 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:371:12
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
371 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:371:12
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
371 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?151]
  --> /tmp/dojo-balanced-parens-1.almd:383:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
383 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?153]
  --> /tmp/dojo-balanced-parens-1.almd:384:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
384 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?155]
  --> /tmp/dojo-balanced-parens-1.almd:385:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
385 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:386:12
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
386 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:386:12
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
386 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:386:12
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
386 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:386:12
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
386 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?157]
  --> /tmp/dojo-balanced-parens-1.almd:398:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
398 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?159]
  --> /tmp/dojo-balanced-parens-1.almd:399:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
399 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?161]
  --> /tmp/dojo-balanced-parens-1.almd:400:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
400 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:401:12
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
401 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:401:12
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
401 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:401:12
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
401 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:401:12
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
401 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?163]
  --> /tmp/dojo-balanced-parens-1.almd:413:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
413 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?165]
  --> /tmp/dojo-balanced-parens-1.almd:414:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
414 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?167]
  --> /tmp/dojo-balanced-parens-1.almd:415:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
415 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:416:12
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
416 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:416:12
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
416 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:416:12
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
416 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:416:12
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
416 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?169]
  --> /tmp/dojo-balanced-parens-1.almd:428:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
428 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?171]
  --> /tmp/dojo-balanced-parens-1.almd:429:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
429 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?173]
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:431:12
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
431 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?175]
  --> /tmp/dojo-balanced-parens-1.almd:443:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
443 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?177]
  --> /tmp/dojo-balanced-parens-1.almd:444:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
444 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?179]
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:446:12
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
446 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?181]
  --> /tmp/dojo-balanced-parens-1.almd:458:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
458 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?183]
  --> /tmp/dojo-balanced-parens-1.almd:459:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
459 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?185]
  --> /tmp/dojo-balanced-parens-1.almd:460:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
460 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:461:12
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
461 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:461:12
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
461 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:461:12
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
461 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:461:12
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
461 |       _ => ()
    |            ^
error[E001]: type mismatch in if branches: expected Bool but got Option[?187]
  --> /tmp/dojo-balanced-parens-1.almd:473:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
473 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?189]
  --> /tmp/dojo-balanced-parens-1.almd:474:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
474 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?191]
  --> /tmp/dojo-balanced-parens-1.almd:475:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
    |
475 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:476:12
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
476 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:476:12
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
476 |       _ => ()
    |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:476:12
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
476 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:476:12
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
476 |       _ => ()
    |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:482:23
  in fn 'is_balanced'
  here: let stack = list.new[String]()
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
    |
482 |   let stack = list.new[String]()
    |                       ^
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
error[E025]: cannot infer a concrete type for this expression (type Option[?13])
  --> /tmp/dojo-balanced-parens-1.almd:38:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?15])
  --> /tmp/dojo-balanced-parens-1.almd:39:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
39 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?17])
  --> /tmp/dojo-balanced-parens-1.almd:40:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
40 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?19])
  --> /tmp/dojo-balanced-parens-1.almd:53:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
53 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?21])
  --> /tmp/dojo-balanced-parens-1.almd:54:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
54 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?23])
  --> /tmp/dojo-balanced-parens-1.almd:55:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
55 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?25])
  --> /tmp/dojo-balanced-parens-1.almd:68:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
68 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?27])
  --> /tmp/dojo-balanced-parens-1.almd:69:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
69 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?29])
  --> /tmp/dojo-balanced-parens-1.almd:70:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
70 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?31])
  --> /tmp/dojo-balanced-parens-1.almd:83:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
83 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?33])
  --> /tmp/dojo-balanced-parens-1.almd:84:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
84 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?35])
  --> /tmp/dojo-balanced-parens-1.almd:85:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
85 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?37])
  --> /tmp/dojo-balanced-parens-1.almd:98:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
98 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?39])
  --> /tmp/dojo-balanced-parens-1.almd:99:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
99 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?41])
  --> /tmp/dojo-balanced-parens-1.almd:100:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
100 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?43])
  --> /tmp/dojo-balanced-parens-1.almd:113:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
113 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?45])
  --> /tmp/dojo-balanced-parens-1.almd:114:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
114 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?47])
  --> /tmp/dojo-balanced-parens-1.almd:115:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
115 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?49])
  --> /tmp/dojo-balanced-parens-1.almd:128:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
128 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?51])
  --> /tmp/dojo-balanced-parens-1.almd:129:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
129 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?53])
  --> /tmp/dojo-balanced-parens-1.almd:130:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
130 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?55])
  --> /tmp/dojo-balanced-parens-1.almd:143:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
143 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?57])
  --> /tmp/dojo-balanced-parens-1.almd:144:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
144 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?59])
  --> /tmp/dojo-balanced-parens-1.almd:145:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
145 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?61])
  --> /tmp/dojo-balanced-parens-1.almd:158:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
158 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?63])
  --> /tmp/dojo-balanced-parens-1.almd:159:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
159 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?65])
  --> /tmp/dojo-balanced-parens-1.almd:160:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
160 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?67])
  --> /tmp/dojo-balanced-parens-1.almd:173:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
173 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?69])
  --> /tmp/dojo-balanced-parens-1.almd:174:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
174 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?71])
  --> /tmp/dojo-balanced-parens-1.almd:175:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
175 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?73])
  --> /tmp/dojo-balanced-parens-1.almd:188:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
188 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?75])
  --> /tmp/dojo-balanced-parens-1.almd:189:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
189 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?77])
  --> /tmp/dojo-balanced-parens-1.almd:190:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
190 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?79])
  --> /tmp/dojo-balanced-parens-1.almd:203:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
203 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?81])
  --> /tmp/dojo-balanced-parens-1.almd:204:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
204 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?83])
  --> /tmp/dojo-balanced-parens-1.almd:205:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
205 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?85])
  --> /tmp/dojo-balanced-parens-1.almd:218:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
218 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?87])
  --> /tmp/dojo-balanced-parens-1.almd:219:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
219 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?89])
  --> /tmp/dojo-balanced-parens-1.almd:220:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
220 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?91])
  --> /tmp/dojo-balanced-parens-1.almd:233:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
233 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?93])
  --> /tmp/dojo-balanced-parens-1.almd:234:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
234 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?95])
  --> /tmp/dojo-balanced-parens-1.almd:235:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
235 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?97])
  --> /tmp/dojo-balanced-parens-1.almd:248:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
248 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?99])
  --> /tmp/dojo-balanced-parens-1.almd:249:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
249 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?101])
  --> /tmp/dojo-balanced-parens-1.almd:250:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
250 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?103])
  --> /tmp/dojo-balanced-parens-1.almd:263:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
263 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?105])
  --> /tmp/dojo-balanced-parens-1.almd:264:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
264 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?107])
  --> /tmp/dojo-balanced-parens-1.almd:265:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
265 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?109])
  --> /tmp/dojo-balanced-parens-1.almd:278:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
278 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?111])
  --> /tmp/dojo-balanced-parens-1.almd:279:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
279 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?113])
  --> /tmp/dojo-balanced-parens-1.almd:280:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
280 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?115])
  --> /tmp/dojo-balanced-parens-1.almd:293:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
293 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?117])
  --> /tmp/dojo-balanced-parens-1.almd:294:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
294 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?119])
  --> /tmp/dojo-balanced-parens-1.almd:295:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
295 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?121])
  --> /tmp/dojo-balanced-parens-1.almd:308:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
308 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?123])
  --> /tmp/dojo-balanced-parens-1.almd:309:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
309 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?125])
  --> /tmp/dojo-balanced-parens-1.almd:310:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
310 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?127])
  --> /tmp/dojo-balanced-parens-1.almd:323:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
323 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?129])
  --> /tmp/dojo-balanced-parens-1.almd:324:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
324 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?131])
  --> /tmp/dojo-balanced-parens-1.almd:325:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
325 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?133])
  --> /tmp/dojo-balanced-parens-1.almd:338:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
338 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?135])
  --> /tmp/dojo-balanced-parens-1.almd:339:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
339 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?137])
  --> /tmp/dojo-balanced-parens-1.almd:340:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
340 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?139])
  --> /tmp/dojo-balanced-parens-1.almd:353:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
353 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?141])
  --> /tmp/dojo-balanced-parens-1.almd:354:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
354 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?143])
  --> /tmp/dojo-balanced-parens-1.almd:355:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
355 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?145])
  --> /tmp/dojo-balanced-parens-1.almd:368:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
368 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?147])
  --> /tmp/dojo-balanced-parens-1.almd:369:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
369 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?149])
  --> /tmp/dojo-balanced-parens-1.almd:370:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
370 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?151])
  --> /tmp/dojo-balanced-parens-1.almd:383:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
383 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?153])
  --> /tmp/dojo-balanced-parens-1.almd:384:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
384 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?155])
  --> /tmp/dojo-balanced-parens-1.almd:385:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
385 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?157])
  --> /tmp/dojo-balanced-parens-1.almd:398:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
398 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?159])
  --> /tmp/dojo-balanced-parens-1.almd:399:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
399 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?161])
  --> /tmp/dojo-balanced-parens-1.almd:400:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
400 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?163])
  --> /tmp/dojo-balanced-parens-1.almd:413:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
413 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?165])
  --> /tmp/dojo-balanced-parens-1.almd:414:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
414 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?167])
  --> /tmp/dojo-balanced-parens-1.almd:415:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
415 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?169])
  --> /tmp/dojo-balanced-parens-1.almd:428:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
428 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?171])
  --> /tmp/dojo-balanced-parens-1.almd:429:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
429 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?173])
  --> /tmp/dojo-balanced-parens-1.almd:430:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
430 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?175])
  --> /tmp/dojo-balanced-parens-1.almd:443:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
443 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?177])
  --> /tmp/dojo-balanced-parens-1.almd:444:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
444 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?179])
  --> /tmp/dojo-balanced-parens-1.almd:445:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
445 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?181])
  --> /tmp/dojo-balanced-parens-1.almd:458:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
458 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?183])
  --> /tmp/dojo-balanced-parens-1.almd:459:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
459 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?185])
  --> /tmp/dojo-balanced-parens-1.almd:460:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
460 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?187])
  --> /tmp/dojo-balanced-parens-1.almd:473:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
473 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?189])
  --> /tmp/dojo-balanced-parens-1.almd:474:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
474 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?191])
  --> /tmp/dojo-balanced-parens-1.almd:475:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
    |
475 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
    |                                                      ^^^^^^^^^^^^^^^

676 error(s) found
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
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-2.almd:13:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   }
   |   ^
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
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-2.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-2.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:11:12
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

20 error(s) found
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
      _ => true
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
error: Expected LBrace at line 17:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:17:28
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
   | ^
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
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
5 |       '(' => list.push(stack, ")")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:6:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
6 |       '[' => list.push(stack, "]")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:7:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
7 |       '{' => list.push(stack, "}")
  |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:8:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
8 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:9:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
9 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
  |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:10:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
10 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:16:15
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
   |
16 |   let stack = list.new[String]()
   |               ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:18:11
  in variable c
  here: match c {
  hint: Did you mean `s`?
  try:
      s
   |
18 |     match c {
   |           ^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:19:31
  in call to list.push()
  here: '(' => list.push(stack, ")")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
19 |       '(' => list.push(stack, ")")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:20:31
  in call to list.push()
  here: '[' => list.push(stack, "]")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
20 |       '[' => list.push(stack, "]")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:21:31
  in call to list.push()
  here: '{' => list.push(stack, "}")
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
21 |       '{' => list.push(stack, "}")
   |                               ^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:22:63
  in call to list.pop()
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
22 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:23:63
  in call to list.pop()
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
23 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E032]: cannot pass immutable binding 'stack' to `mut` parameter of list.pop()
  --> /tmp/dojo-balanced-parens-3.almd:24:63
  in call to list.pop()
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Declare 'stack' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
24 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
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
error[E001]: type mismatch in if branches: expected Bool but got Option[?8]
  --> /tmp/dojo-balanced-parens-3.almd:22:63
  in if branches
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
22 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?10]
  --> /tmp/dojo-balanced-parens-3.almd:23:63
  in if branches
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
23 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got Option[?12]
  --> /tmp/dojo-balanced-parens-3.almd:24:63
  in if branches
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Both branches of `if/then/else` must have the same type
   |
24 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                               ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:25:12
  in match arm
  here: _ => true
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
25 |       _ => true
   |            ^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:25:12
  in match arm
  here: _ => true
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
25 |       _ => true
   |            ^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:25:12
  in match arm
  here: _ => true
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
25 |       _ => true
   |            ^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:25:12
  in match arm
  here: _ => true
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
25 |       _ => true
   |            ^^^^
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
error[E025]: cannot infer a concrete type for this expression (type Option[?8])
  --> /tmp/dojo-balanced-parens-3.almd:22:54
  in this expression with an unconstrained type
  here: ')' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 |       ')' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?10])
  --> /tmp/dojo-balanced-parens-3.almd:23:54
  in this expression with an unconstrained type
  here: ']' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |       ']' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?12])
  --> /tmp/dojo-balanced-parens-3.almd:24:54
  in this expression with an unconstrained type
  here: '}' => if list.is_empty(stack) then false else list.pop(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |       '}' => if list.is_empty(stack) then false else list.pop(stack)
   |                                                      ^^^^^^^^^^^^^^^

38 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
