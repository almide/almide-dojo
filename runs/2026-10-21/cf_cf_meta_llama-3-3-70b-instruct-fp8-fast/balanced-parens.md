# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = list.new[String]()
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    opening_brackets = list.from_list(["(", "[", "{"])
    closing_brackets = list.from_list([")", "]", "}"])
  in 
    list.fold(string.chars(s), true, (acc, ch) => 
      if list.contains(opening_brackets, ch) then 
        list.push(stack, ch) |> ignore; acc
      else if list.contains(closing_brackets, ch) then 
        if list.is_empty(stack) then false
        else 
          let 
            top = list.last(stack) |> option.unwrap_or("")
            expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
          in 
            if ch == expected_closing then 
              stack |> list.drop_end(1) |> ignore; acc
            else false
      else acc
    )
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |       ^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:7:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   in
  |   ^
error: Semicolons are not used in Almide at line 10:39
  --> /tmp/dojo-balanced-parens-0.almd:10:39
  here: list.push(stack, ch) |> ignore; acc
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
10 |         list.push(stack, ch) |> ignore; acc
   |                                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:14:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |           let
   |           ^^^
error: Expected expression at line 17:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:17:11
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |           in
   |           ^
error: Expected expression at line 20:13 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:20:13
  here: else false
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |             else false
   |             ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:13
  in call to list.new()
  here: stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |             ^^^^^^^^
error[E003]: cannot assign to undefined binding 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in stack = ...
  here: stack = list.new[String]()
  hint: No `let`/`var` named 'stack' is in scope to assign to. Declare it first: `var stack = ...`
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:4:64
  in bracket_map = ...
  here: bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
4 |     bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  |                                                                ^^^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-balanced-parens-0.almd:5:24
  in call to list.from_list()
  here: opening_brackets = list.from_list(["(", "[", "{"])
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |     opening_brackets = list.from_list(["(", "[", "{"])
  |                        ^^^^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'opening_brackets'
  --> /tmp/dojo-balanced-parens-0.almd:5:50
  in opening_brackets = ...
  here: opening_brackets = list.from_list(["(", "[", "{"])
  hint: No `let`/`var` named 'opening_brackets' is in scope to assign to. Declare it first: `var opening_brackets = ...`
  |
5 |     opening_brackets = list.from_list(["(", "[", "{"])
  |                                                  ^^^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-balanced-parens-0.almd:6:24
  in call to list.from_list()
  here: closing_brackets = list.from_list([")", "]", "}"])
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
6 |     closing_brackets = list.from_list([")", "]", "}"])
  |                        ^^^^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'closing_brackets'
  --> /tmp/dojo-balanced-parens-0.almd:6:50
  in closing_brackets = ...
  here: closing_brackets = list.from_list([")", "]", "}"])
  hint: No `let`/`var` named 'closing_brackets' is in scope to assign to. Declare it first: `var closing_brackets = ...`
  |
6 |     closing_brackets = list.from_list([")", "]", "}"])
  |                                                  ^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:15:29
  in variable stack
  here: top = list.last(stack) |> option.unwrap_or("")
  hint: Check the variable name
   |
15 |             top = list.last(stack) |> option.unwrap_or("")
   |                             ^^^^^
error[E003]: cannot assign to undefined binding 'top'
  --> /tmp/dojo-balanced-parens-0.almd:15:56
  in top = ...
  here: top = list.last(stack) |> option.unwrap_or("")
  hint: No `let`/`var` named 'top' is in scope to assign to. Declare it first: `var top = ...`
   |
15 |             top = list.last(stack) |> option.unwrap_or("")
   |                                                        ^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:16:40
  in variable bracket_map
  here: expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |             expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
   |                                        ^^^^^^^^^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-0.almd:16:53
  in variable top
  here: expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |             expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
   |                                                     ^^^
error[E003]: cannot assign to undefined binding 'expected_closing'
  --> /tmp/dojo-balanced-parens-0.almd:16:78
  in expected_closing = ...
  here: expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
  hint: No `let`/`var` named 'expected_closing' is in scope to assign to. Declare it first: `var expected_closing = ...`
   |
16 |             expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
   |                                                                              ^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:18:16
  in variable ch
  here: if ch == expected_closing then
  hint: Did you mean `s`?
  try:
      s
   |
18 |             if ch == expected_closing then
   |                ^^
error[E003]: undefined variable 'expected_closing'
  --> /tmp/dojo-balanced-parens-0.almd:18:22
  in variable expected_closing
  here: if ch == expected_closing then
  hint: Check the variable name
   |
18 |             if ch == expected_closing then
   |                      ^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:19:15
  in variable stack
  here: stack |> list.drop_end(1) |> ignore; acc
  hint: Check the variable name
   |
19 |               stack |> list.drop_end(1) |> ignore; acc
   |               ^^^^^
error[E002]: undefined function 'ignore'
  --> /tmp/dojo-balanced-parens-0.almd:19:38
  in call to ignore()
  here: stack |> list.drop_end(1) |> ignore; acc
  hint: Check the function name
   |
19 |               stack |> list.drop_end(1) |> ignore; acc
   |                                      ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:19:52
  in variable acc
  here: stack |> list.drop_end(1) |> ignore; acc
  hint: Check the variable name
   |
19 |               stack |> list.drop_end(1) |> ignore; acc
   |                                                    ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:19:52
  in fn 'is_balanced'
  here: stack |> list.drop_end(1) |> ignore; acc
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
19 |               stack |> list.drop_end(1) |> ignore; acc
   |                                                    ^^^

24 error(s) found
FAILED: /tmp/dojo-balanced-parens-0.almd
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = []
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    opening_brackets = ["(", "[", "{"]
    closing_brackets = [")", "]", "}"]
  in 
    list.fold(string.chars(s), (stack, true), (acc, ch) => 
      if list.contains(opening_brackets, ch) then 
        (acc.0 + [ch], acc.1)
      else if list.contains(closing_brackets, ch) then 
        if list.is_empty(acc.0) then 
          (acc.0, false)
        else 
          let 
            top = list.last(acc.0) |> option.unwrap_or("")
            expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
          in 
            if ch == expected_closing then 
              (list.drop_end(acc.0, 1), acc.1)
            else 
              (acc.0, false)
      else 
        (acc.0, acc.1)
    ).1
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |       ^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:7:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:15:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |           let
   |           ^^^
error: Expected expression at line 18:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:18:11
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |           in
   |           ^
error: Expected expression at line 23:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:23:7
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |       else
   |       ^
error[E003]: cannot assign to undefined binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:3:13
  in stack = ...
  here: stack = []
  hint: No `let`/`var` named 'stack' is in scope to assign to. Declare it first: `var stack = ...`
  |
3 |     stack = []
  |             ^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:4:64
  in bracket_map = ...
  here: bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
4 |     bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  |                                                                ^^^
error[E003]: cannot assign to undefined binding 'opening_brackets'
  --> /tmp/dojo-balanced-parens-1.almd:5:35
  in opening_brackets = ...
  here: opening_brackets = ["(", "[", "{"]
  hint: No `let`/`var` named 'opening_brackets' is in scope to assign to. Declare it first: `var opening_brackets = ...`
  |
5 |     opening_brackets = ["(", "[", "{"]
  |                                   ^^^
error[E003]: cannot assign to undefined binding 'closing_brackets'
  --> /tmp/dojo-balanced-parens-1.almd:6:35
  in closing_brackets = ...
  here: closing_brackets = [")", "]", "}"]
  hint: No `let`/`var` named 'closing_brackets' is in scope to assign to. Declare it first: `var closing_brackets = ...`
  |
6 |     closing_brackets = [")", "]", "}"]
  |                                   ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:16:29
  in variable acc
  here: top = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |             top = list.last(acc.0) |> option.unwrap_or("")
   |                             ^^^
error[E003]: cannot assign to undefined binding 'top'
  --> /tmp/dojo-balanced-parens-1.almd:16:56
  in top = ...
  here: top = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'top' is in scope to assign to. Declare it first: `var top = ...`
   |
16 |             top = list.last(acc.0) |> option.unwrap_or("")
   |                                                        ^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:17:40
  in variable bracket_map
  here: expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
  hint: Check the variable name
   |
17 |             expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
   |                                        ^^^^^^^^^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-1.almd:17:53
  in variable top
  here: expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
  hint: Check the variable name
   |
17 |             expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
   |                                                     ^^^
error[E003]: cannot assign to undefined binding 'expected_closing'
  --> /tmp/dojo-balanced-parens-1.almd:17:78
  in expected_closing = ...
  here: expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
  hint: No `let`/`var` named 'expected_closing' is in scope to assign to. Declare it first: `var expected_closing = ...`
   |
17 |             expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
   |                                                                              ^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-1.almd:19:16
  in variable ch
  here: if ch == expected_closing then
  hint: Did you mean `s`?
  try:
      s
   |
19 |             if ch == expected_closing then
   |                ^^
error[E003]: undefined variable 'expected_closing'
  --> /tmp/dojo-balanced-parens-1.almd:19:22
  in variable expected_closing
  here: if ch == expected_closing then
  hint: Check the variable name
   |
19 |             if ch == expected_closing then
   |                      ^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:20:30
  in variable acc
  here: (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
20 |               (list.drop_end(acc.0, 1), acc.1)
   |                              ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:20:41
  in variable acc
  here: (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
20 |               (list.drop_end(acc.0, 1), acc.1)
   |                                         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:22:16
  in variable acc
  here: (acc.0, false)
  hint: Check the variable name
   |
22 |               (acc.0, false)
   |                ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:22:23
  in fn 'is_balanced'
  here: (acc.0, false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
22 |               (acc.0, false)
   |                       ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-1.almd:3:13
  in empty list `[]` with no element-type context
  here: stack = []
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
3 |     stack = []
  |             ^
error[E025]: cannot infer a concrete type for this expression (type List[?4])
  --> /tmp/dojo-balanced-parens-1.almd:20:16
  in this expression with an unconstrained type
  here: (list.drop_end(acc.0, 1), acc.1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |               (list.drop_end(acc.0, 1), acc.1)
   |                ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?4], Unknown))
  --> /tmp/dojo-balanced-parens-1.almd:19:13
  in this expression with an unconstrained type
  here: if ch == expected_closing then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Int) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |             if ch == expected_closing then
   |             ^^

23 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack: List[String] = []
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  let opening_brackets = ["(", "[", "{"]
  let closing_brackets = [")", "]", "}"]
  in 
    list.fold(string.chars(s), (stack, true), (acc, ch) => 
      if list.contains(opening_brackets, ch) then 
        (acc.0 + [ch], acc.1)
      else if list.contains(closing_brackets, ch) then 
        if list.is_empty(acc.0) then 
          (acc.0, false)
        else 
          let top = list.last(acc.0) |> option.unwrap_or("")
          let expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
          in 
            if ch == expected_closing then 
              (list.drop_end(acc.0, 1), acc.1)
            else 
              (acc.0, false)
      else 
        (acc.0, acc.1)
    ).1
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:14:11
  in let-in
  here: let top = list.last(acc.0) |> option.unwrap_or("")
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |           let top = list.last(acc.0) |> option.unwrap_or("")
   |           ^^^
error: Expected expression at line 21:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:21:7
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |       else
   |       ^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-2.almd:15:55
  in variable top
  here: let expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
  hint: Check the variable name
   |
15 |           let expected_closing = map.get(bracket_map, top) |> option.unwrap_or("")
   |                                                       ^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-2.almd:17:16
  in variable ch
  here: if ch == expected_closing then
  hint: Did you mean `s`?
  try:
      s
   |
17 |             if ch == expected_closing then
   |                ^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:18:30
  in variable acc
  here: (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
18 |               (list.drop_end(acc.0, 1), acc.1)
   |                              ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:18:41
  in variable acc
  here: (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
18 |               (list.drop_end(acc.0, 1), acc.1)
   |                                         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:20:16
  in variable acc
  here: (acc.0, false)
  hint: Check the variable name
   |
20 |               (acc.0, false)
   |                ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:20:23
  in fn 'is_balanced'
  here: (acc.0, false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
20 |               (acc.0, false)
   |                       ^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?1])
  --> /tmp/dojo-balanced-parens-2.almd:18:16
  in this expression with an unconstrained type
  here: (list.drop_end(acc.0, 1), acc.1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |               (list.drop_end(acc.0, 1), acc.1)
   |                ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?1], Unknown))
  --> /tmp/dojo-balanced-parens-2.almd:17:13
  in this expression with an unconstrained type
  here: if ch == expected_closing then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Int) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |             if ch == expected_closing then
   |             ^^

10 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.chars(s), ([], true), (acc, ch) => 
    if list.contains(["(", "[", "{"], ch) then 
      (acc.0 + [ch], acc.1)
    else if list.contains([")", "]", "}"], ch) then 
      if list.is_empty(acc.0) then 
        (acc.0, false)
      else 
        let top = list.last(acc.0) |> option.unwrap_or("")
        in 
          if top == "(" && ch == ")" || top == "[" && ch == "]" || top == "{" && ch == "}" then 
            (list.drop_end(acc.0, 1), acc.1)
          else 
            (acc.0, false)
    else 
      (acc.0, acc.1)
  ).1
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:9:9
  in let-in
  here: let top = list.last(acc.0) |> option.unwrap_or("")
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |         let top = list.last(acc.0) |> option.unwrap_or("")
  |         ^^^
error: 'let' is not an expression in Almide at line 9:9
  --> /tmp/dojo-balanced-parens-3.almd:9:9
  here: let top = list.last(acc.0) |> option.unwrap_or("")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |         let top = list.last(acc.0) |> option.unwrap_or("")
  |         ^

2 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
