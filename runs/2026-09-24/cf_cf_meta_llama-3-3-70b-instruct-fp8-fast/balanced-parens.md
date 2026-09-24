# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = list.new[String]()
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    pairs = map.entries(bracket_map)
  in 
    list.fold(string.chars(s), true, (acc, ch) => 
      if acc then 
        if list.any(pairs, (x) => x.0 == ch) then 
          list.push(stack, ch)
          |> ignore
          true
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(stack) then false
          else 
            let 
              top = list.last(stack)
            in 
              if top == none then false
              else 
                let 
                  top_val = top |> option.unwrap_or("")
                  pair = list.find(pairs, (x) => x.1 == ch)
                in 
                  if pair == none then false
                  else 
                    let 
                      pair_val = pair |> option.unwrap_or(("", ""))
                    in 
                      if pair_val.0 == top_val then 
                        stack |> list.drop_end(1)
                        |> ignore
                        true
                      else false
        else true
      else false
    )
    |> (fn x => x)
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
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:6:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   in
  |   ^
error: Missing ',' between function arguments at line 12:11
  --> /tmp/dojo-balanced-parens-0.almd:12:11
  here: true
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
12 |           true
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:16:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
16 |             let
   |             ^^^
error: Expected expression at line 18:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:18:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |             in
   |             ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:21:17
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |                 let
   |                 ^^^
error: Expected expression at line 24:17 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:24:17
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |                 in
   |                 ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:27:21
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
27 |                     let
   |                     ^^^
error: Expected expression at line 29:21 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:29:21
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |                     in
   |                     ^
error: Expected expression at line 34:23 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:34:23
  here: else false
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |                       else false
   |                       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  here: stack = list.new[String]()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
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
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:5:25
  in variable bracket_map
  here: pairs = map.entries(bracket_map)
  hint: Check the variable name
  |
5 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:5:25
  in pairs = ...
  here: pairs = map.entries(bracket_map)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
  |
5 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:17:31
  in variable stack
  here: top = list.last(stack)
  hint: Check the variable name
   |
17 |               top = list.last(stack)
   |                               ^^^^^
error[E003]: cannot assign to undefined binding 'top'
  --> /tmp/dojo-balanced-parens-0.almd:17:31
  in top = ...
  here: top = list.last(stack)
  hint: No `let`/`var` named 'top' is in scope to assign to. Declare it first: `var top = ...`
   |
17 |               top = list.last(stack)
   |                               ^^^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-0.almd:22:29
  in variable top
  here: top_val = top |> option.unwrap_or("")
  hint: Check the variable name
   |
22 |                   top_val = top |> option.unwrap_or("")
   |                             ^^^
error[E003]: cannot assign to undefined binding 'top_val'
  --> /tmp/dojo-balanced-parens-0.almd:22:53
  in top_val = ...
  here: top_val = top |> option.unwrap_or("")
  hint: No `let`/`var` named 'top_val' is in scope to assign to. Declare it first: `var top_val = ...`
   |
22 |                   top_val = top |> option.unwrap_or("")
   |                                                     ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:23:36
  in variable pairs
  here: pair = list.find(pairs, (x) => x.1 == ch)
  hint: Check the variable name
   |
23 |                   pair = list.find(pairs, (x) => x.1 == ch)
   |                                    ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:23:57
  in variable ch
  here: pair = list.find(pairs, (x) => x.1 == ch)
  hint: Did you mean `s`?
  try:
      s
   |
23 |                   pair = list.find(pairs, (x) => x.1 == ch)
   |                                                         ^^
error[E003]: cannot assign to undefined binding 'pair'
  --> /tmp/dojo-balanced-parens-0.almd:23:57
  in pair = ...
  here: pair = list.find(pairs, (x) => x.1 == ch)
  hint: No `let`/`var` named 'pair' is in scope to assign to. Declare it first: `var pair = ...`
   |
23 |                   pair = list.find(pairs, (x) => x.1 == ch)
   |                                                         ^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-0.almd:28:34
  in variable pair
  here: pair_val = pair |> option.unwrap_or(("", ""))
  hint: Did you mean `panic`?
  try:
      panic
   |
28 |                       pair_val = pair |> option.unwrap_or(("", ""))
   |                                  ^^^^
error[E003]: cannot assign to undefined binding 'pair_val'
  --> /tmp/dojo-balanced-parens-0.almd:28:64
  in pair_val = ...
  here: pair_val = pair |> option.unwrap_or(("", ""))
  hint: No `let`/`var` named 'pair_val' is in scope to assign to. Declare it first: `var pair_val = ...`
   |
28 |                       pair_val = pair |> option.unwrap_or(("", ""))
   |                                                                ^^
error[E003]: undefined variable 'pair_val'
  --> /tmp/dojo-balanced-parens-0.almd:30:26
  in variable pair_val
  here: if pair_val.0 == top_val then
  hint: Check the variable name
   |
30 |                       if pair_val.0 == top_val then
   |                          ^^^^^^^^
error[E003]: undefined variable 'top_val'
  --> /tmp/dojo-balanced-parens-0.almd:30:40
  in variable top_val
  here: if pair_val.0 == top_val then
  hint: Check the variable name
   |
30 |                       if pair_val.0 == top_val then
   |                                        ^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:31:25
  in variable stack
  here: stack |> list.drop_end(1)
  hint: Check the variable name
   |
31 |                         stack |> list.drop_end(1)
   |                         ^^^^^
error[E002]: undefined function 'ignore'
  --> /tmp/dojo-balanced-parens-0.almd:31:48
  in call to ignore()
  here: stack |> list.drop_end(1)
  hint: Check the function name
   |
31 |                         stack |> list.drop_end(1)
   |                                                ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:33:25
  in fn 'is_balanced'
  here: true
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
33 |                         true
   |                         ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-0.almd:5:13
  in this expression with an unconstrained type
  here: pairs = map.entries(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     pairs = map.entries(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?2])
  --> /tmp/dojo-balanced-parens-0.almd:17:21
  in this expression with an unconstrained type
  here: top = list.last(stack)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |               top = list.last(stack)
   |                     ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?4])
  --> /tmp/dojo-balanced-parens-0.almd:23:26
  in this expression with an unconstrained type
  here: pair = list.find(pairs, (x) => x.1 == ch)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |                   pair = list.find(pairs, (x) => x.1 == ch)
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

32 error(s) found
FAILED: /tmp/dojo-balanced-parens-0.almd
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = []
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in list.fold(string.chars(s), (true, stack), (acc, ch) => 
    if acc.0 then 
      if list.any(map.entries(bracket_map), (x) => x.0 == ch) then 
        (true, acc.1 + [ch])
      else if list.any(map.entries(bracket_map), (x) => x.1 == ch) then 
        if list.is_empty(acc.1) then (false, acc.1)
        else 
          let top = list.last(acc.1) 
          in if top == none then (false, acc.1)
          else 
            let top_val = top |> option.unwrap_or("")
            in 
              let pair = list.find(map.entries(bracket_map), (x) => x.1 == ch)
              in if pair == none then (false, acc.1)
              else 
                let pair_val = pair |> option.unwrap_or(("", ""))
                in if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
                else (false, acc.1)
      else (true, acc.1)
    else (false, acc.1)
  ).0
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:11:11
  in let-in
  here: let top = list.last(acc.1)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |           let top = list.last(acc.1)
   |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:14:13
  in let-in
  here: let top_val = top |> option.unwrap_or("")
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |             let top_val = top |> option.unwrap_or("")
   |             ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:19:17
  in let-in
  here: let pair_val = pair |> option.unwrap_or(("", ""))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
19 |                 let pair_val = pair |> option.unwrap_or(("", ""))
   |                 ^^^
error: Expected expression at line 22:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:22:7
  here: else (true, acc.1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |       else (true, acc.1)
   |       ^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-1.almd:16:76
  in variable ch
  here: let pair = list.find(map.entries(bracket_map), (x) => x.1 == ch)
  hint: Did you mean `s`?
  try:
      s
   |
16 |               let pair = list.find(map.entries(bracket_map), (x) => x.1 == ch)
   |                                                                            ^^
error[E003]: undefined variable 'pair_val'
  --> /tmp/dojo-balanced-parens-1.almd:20:20
  in variable pair_val
  here: if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
  hint: Check the variable name
   |
20 |                 if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
   |                    ^^^^^^^^
error[E003]: undefined variable 'top_val'
  --> /tmp/dojo-balanced-parens-1.almd:20:34
  in variable top_val
  here: if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
  hint: Check the variable name
   |
20 |                 if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
   |                                  ^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:20:68
  in variable acc
  here: if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
  hint: Check the variable name
   |
20 |                 if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
   |                                                                    ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:21:30
  in variable acc
  here: else (false, acc.1)
  hint: Check the variable name
   |
21 |                 else (false, acc.1)
   |                              ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:21:30
  in fn 'is_balanced'
  here: else (false, acc.1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |                 else (false, acc.1)
   |                              ^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-1.almd:2:15
  in empty list `[]` with no element-type context
  here: let stack = []
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
2 |   let stack = []
  |               ^
error[E025]: cannot infer a concrete type for binding 'stack' (type List[?0])
  --> /tmp/dojo-balanced-parens-1.almd:2:15
  in binding 'stack' with an unconstrained type
  here: let stack = []
  hint: Annotate the binding with the full type, e.g. `let stack: List[Int] = ...`. An unconstrained slot (such as the error type of a value that is always `ok(...)`, reachable only through an un-exercised branch) cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  try:
      let stack: List[Int] = ...
  |
2 |   let stack = []
  |               ^
error[E025]: cannot infer a concrete type for this expression (type List[?2])
  --> /tmp/dojo-balanced-parens-1.almd:20:54
  in this expression with an unconstrained type
  here: if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |                 if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
   |                                                      ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (Bool, List[?2]))
  --> /tmp/dojo-balanced-parens-1.almd:20:17
  in this expression with an unconstrained type
  here: if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (Bool, List[Int]) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |                 if pair_val.0 == top_val then (true, list.drop_end(acc.1, 1))
   |                 ^^

14 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.chars(s), (true, []: List[String]), (acc, ch) => 
    if acc.0 then 
      if list.any(map.entries(map.from_list([("(", ")"), ("[", "]"), ("{", "}")]), (x) => x.0 == ch) then 
        (true, acc.1 + [ch])
      else if list.any(map.entries(map.from_list([("(", ")"), ("[", "]"), ("{", "}")]), (x) => x.1 == ch) then 
        if list.is_empty(acc.1) then (false, acc.1)
        else 
          let top = list.last(acc.1) |> option.unwrap_or("")
          in 
            let pair = list.find(map.entries(map.from_list([("(", ")"), ("[", "]"), ("{", "}")]), (x) => x.1 == ch)
            in if pair == none then (false, acc.1)
            else 
              let pair_val = pair |> option.unwrap_or(("", ""))
              in if pair_val.0 == top then (true, list.drop_end(acc.1, 1))
              else (false, acc.1)
      else (true, acc.1)
    else (false, acc.1)
  ).0
```

**Diagnostic:**

```
error: Expected ')' to close tuple opened at line 2:30
  --> /tmp/dojo-balanced-parens-2.almd:2:39
  here: list.fold(string.chars(s), (true, []: List[String]), (acc, ch) =>
  hint: Add ')' or check for a missing delimiter inside the tuple
  |
2 |   list.fold(string.chars(s), (true, []: List[String]), (acc, ch) =>
  |                              --------------- '(' opened here
  |
2 |   list.fold(string.chars(s), (true, []: List[String]), (acc, ch) =>
  |                                       ^
error: Expected ')' to close tuple opened at line 2:30 at line 2:39
  --> /tmp/dojo-balanced-parens-2.almd:2:30
  here: list.fold(string.chars(s), (true, []: List[String]), (acc, ch) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.fold(string.chars(s), (true, []: List[String]), (acc, ch) =>
  |                              ^

2 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.chars(s), (true, []: List[String]), ((acc, ch)) => 
    if acc.0 then 
      if list.any(map.entries(map.from_list([("(", ")"), ("[", "]"), ("{", "}")]), (x) => x.0 == ch) then 
        (true, acc.1 + [ch])
      else if list.any(map.entries(map.from_list([("(", ")"), ("[", "]"), ("{", "}")]), (x) => x.1 == ch) then 
        if list.is_empty(acc.1) then (false, acc.1)
        else 
          let top = list.last(acc.1) |> option.unwrap_or("")
          in 
            let pair = list.find(map.entries(map.from_list([("(", ")"), ("[", "]"), ("{", "}")]), (x) => x.1 == ch)
            in if pair == none then (false, acc.1)
            else 
              let pair_val = pair |> option.unwrap_or(("", ""))
              in if pair_val.0 == top then (true, list.drop_end(acc.1, 1))
              else (false, acc.1)
      else (true, acc.1)
    else (false, acc.1)
  ).0
```

**Diagnostic:**

```
error: Expected ')' to close tuple opened at line 2:30
  --> /tmp/dojo-balanced-parens-3.almd:2:39
  here: list.fold(string.chars(s), (true, []: List[String]), ((acc, ch)) =>
  hint: Add ')' or check for a missing delimiter inside the tuple
  |
2 |   list.fold(string.chars(s), (true, []: List[String]), ((acc, ch)) =>
  |                              --------------- '(' opened here
  |
2 |   list.fold(string.chars(s), (true, []: List[String]), ((acc, ch)) =>
  |                                       ^
error: Expected ')' to close tuple opened at line 2:30 at line 2:39
  --> /tmp/dojo-balanced-parens-3.almd:2:30
  here: list.fold(string.chars(s), (true, []: List[String]), ((acc, ch)) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.fold(string.chars(s), (true, []: List[String]), ((acc, ch)) =>
  |                              ^

2 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
