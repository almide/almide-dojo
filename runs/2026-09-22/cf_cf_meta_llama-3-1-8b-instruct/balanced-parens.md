# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
  let stack = list.new[String]()
  for c in string.chars(s) {
    match c {
      '(' => list.push(stack, ")"),
      '[' => list.push(stack, "]"),
      '{' => list.push(stack, "}"),
      ')' => {
        if list.is_empty(stack) || list.last(stack) != ")" {
          return false
        }
        list.drop_end(stack, 1)
      },
      ']' => {
        if list.is_empty(stack) || list.last(stack) != "]" {
          return false
        }
        list.drop_end(stack, 1)
      },
      '}' => {
        if list.is_empty(stack) || list.last(stack) != "}" {
          return false
        }
        list.drop_end(stack, 1)
      },
      _ => {}
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-balanced-parens-0.almd:1:35
  here: fn is_balanced(s: String) -> Bool {
  hint: Almide requires '=' before the body. Write: fn is_balanced(...) -> Type = { ... }
  |
1 | fn is_balanced(s: String) -> Bool {
  |                                   ^

1 error(s) found
FAILED: /tmp/dojo-balanced-parens-0.almd
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let stack = list.new[String]()
  for c in string.chars(s) {
    match c {
      '(' => list.push(stack, ")"),
      '[' => list.push(stack, "]"),
      '{' => list.push(stack, "}"),
      ')' => {
        if list.is_empty(stack) || list.last(stack) != ")" {
          return false
        }
        list.drop_end(stack, 1)
      },
      ']' => {
        if list.is_empty(stack) || list.last(stack) != "]" {
          return false
        }
        list.drop_end(stack, 1)
      },
      '}' => {
        if list.is_empty(stack) || list.last(stack) != "}" {
          return false
        }
        list.drop_end(stack, 1)
      },
      _ => {}
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
error: '||' is not valid in Almide at line 9:33
  --> /tmp/dojo-balanced-parens-1.almd:9:33
  here: if list.is_empty(stack) || list.last(stack) != ")" {
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
9 |         if list.is_empty(stack) || list.last(stack) != ")" {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:8 (got Comma ',')
  --> /tmp/dojo-balanced-parens-1.almd:13:8
  here: },
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |       },
   |        ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  here: let stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:2:23
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
2 |   let stack = list.new[String]()
  |                       ^

4 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let stack = []
  for c in string.chars(s) {
    match c {
      '(' => list.push(stack, ")"),
      '[' => list.push(stack, "]"),
      '{' => list.push(stack, "}"),
      ')' => {
        if list.is_empty(stack) || list.last(stack) != ")" {
          return false
        }
        list.drop_end(stack, 1)
      },
      ']' => {
        if list.is_empty(stack) || list.last(stack) != "]" {
          return false
        }
        list.drop_end(stack, 1)
      },
      '}' => {
        if list.is_empty(stack) || list.last(stack) != "}" {
          return false
        }
        list.drop_end(stack, 1)
      },
      _ => {}
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
error: '||' is not valid in Almide at line 9:33
  --> /tmp/dojo-balanced-parens-2.almd:9:33
  here: if list.is_empty(stack) || list.last(stack) != ")" {
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
9 |         if list.is_empty(stack) || list.last(stack) != ")" {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 13:8 (got Comma ',')
  --> /tmp/dojo-balanced-parens-2.almd:13:8
  here: },
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |       },
   |        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:2:15
  in fn 'is_balanced'
  here: let stack = []
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = []
  |               ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-2.almd:2:15
  in empty list `[]` with no element-type context
  here: let stack = []
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
2 |   let stack = []
  |               ^
error[E025]: cannot infer a concrete type for binding 'stack' (type List[?0])
  --> /tmp/dojo-balanced-parens-2.almd:2:15
  in binding 'stack' with an unconstrained type
  here: let stack = []
  hint: Annotate the binding with the full type, e.g. `let stack: List[Int] = ...`. An unconstrained slot (such as the error type of a value that is always `ok(...)`, reachable only through an un-exercised branch) cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  try:
      let stack: List[Int] = ...
  |
2 |   let stack = []
  |               ^

5 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let stack: List[String] = []
  for c in string.chars(s) {
    match c {
      '(' => list.push(stack, ")"),
      '[' => list.push(stack, "]"),
      '{' => list.push(stack, "}"),
      ')' => {
        if list.is_empty(stack) {
          return false
        }
        if list.last(stack) != ")" {
          return false
        }
        list.drop_end(stack, 1)
      },
      ']' => {
        if list.is_empty(stack) {
          return false
        }
        if list.last(stack) != "]" {
          return false
        }
        list.drop_end(stack, 1)
      },
      '}' => {
        if list.is_empty(stack) {
          return false
        }
        if list.last(stack) != "}" {
          return false
        }
        list.drop_end(stack, 1)
      },
      _ => {}
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
error: Expected Then at line 9:33 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:9:33
  here: if list.is_empty(stack) {
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |         if list.is_empty(stack) {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 15:9 (got Ident 'list')
  --> /tmp/dojo-balanced-parens-3.almd:15:9
  here: list.drop_end(stack, 1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |         list.drop_end(stack, 1)
   |         ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:2:29
  in fn 'is_balanced'
  here: let stack: List[String] = []
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack: List[String] = []
  |                             ^

3 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
