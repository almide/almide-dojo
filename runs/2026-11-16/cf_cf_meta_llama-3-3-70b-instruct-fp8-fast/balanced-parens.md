# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E032`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = list.new[String]()
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    bracket_set = set.from_list(["(", "[", "{"])
  in 
    list.fold(string.to_list(s), true, (acc, c) => 
      if set.contains(bracket_set, c) then 
        list.push(stack, c) |> list.len(_) > 0
      else if list.contains([")", "]", "}"], c) then 
        if list.is_empty(stack) then false
        else 
          let 
            top = list.last(stack) ?? ""
            expected = map.get(bracket_map, top) ?? ""
          in 
            if expected == c then 
              list.drop_end(stack, 1) |> list.len(_) >= 0
            else false
      else acc
    ) 
    && list.is_empty(stack)
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |      ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:6:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:13:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |           let
   |           ^^^
error: Expected expression at line 16:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:16:11
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |           in
   |           ^
error: Expected expression at line 20:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:20:7
  here: else acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |       else acc
   |       ^
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
error[E003]: cannot assign to undefined binding 'bracket_set'
  --> /tmp/dojo-balanced-parens-0.almd:5:44
  in bracket_set = ...
  here: bracket_set = set.from_list(["(", "[", "{"])
  hint: No `let`/`var` named 'bracket_set' is in scope to assign to. Declare it first: `var bracket_set = ...`
  |
5 |     bracket_set = set.from_list(["(", "[", "{"])
  |                                            ^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:14:29
  in variable stack
  here: top = list.last(stack) ?? ""
  hint: Check the variable name
   |
14 |             top = list.last(stack) ?? ""
   |                             ^^^^^
error[E003]: cannot assign to undefined binding 'top'
  --> /tmp/dojo-balanced-parens-0.almd:14:39
  in top = ...
  here: top = list.last(stack) ?? ""
  hint: No `let`/`var` named 'top' is in scope to assign to. Declare it first: `var top = ...`
   |
14 |             top = list.last(stack) ?? ""
   |                                       ^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:15:32
  in variable bracket_map
  here: expected = map.get(bracket_map, top) ?? ""
  hint: Check the variable name
   |
15 |             expected = map.get(bracket_map, top) ?? ""
   |                                ^^^^^^^^^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-0.almd:15:45
  in variable top
  here: expected = map.get(bracket_map, top) ?? ""
  hint: Check the variable name
   |
15 |             expected = map.get(bracket_map, top) ?? ""
   |                                             ^^^
error[E003]: cannot assign to undefined binding 'expected'
  --> /tmp/dojo-balanced-parens-0.almd:15:53
  in expected = ...
  here: expected = map.get(bracket_map, top) ?? ""
  hint: No `let`/`var` named 'expected' is in scope to assign to. Declare it first: `var expected = ...`
   |
15 |             expected = map.get(bracket_map, top) ?? ""
   |                                                     ^^
error[E003]: undefined variable 'expected'
  --> /tmp/dojo-balanced-parens-0.almd:17:16
  in variable expected
  here: if expected == c then
  hint: Check the variable name
   |
17 |             if expected == c then
   |                ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:17:28
  in variable c
  here: if expected == c then
  hint: Did you mean `s`?
  try:
      s
   |
17 |             if expected == c then
   |                            ^
error[E046]: placeholder `_` is not valid in a call argument (argument 1 of list.len()): `|>` already passes the value as the first argument
  --> /tmp/dojo-balanced-parens-0.almd:18:51
  in call argument
  here: list.drop_end(stack, 1) |> list.len(_) >= 0
  hint: Drop the `_`: `x |> f(a, b)` is `f(x, a, b)`. There is no pipe placeholder — the left side always goes first; for any other position, write a lambda: `x |> (v) => f(a, v)`.
  try:
      list.len()
   |
18 |               list.drop_end(stack, 1) |> list.len(_) >= 0
   |                                                   ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:18:29
  in variable stack
  here: list.drop_end(stack, 1) |> list.len(_) >= 0
  hint: Check the variable name
   |
18 |               list.drop_end(stack, 1) |> list.len(_) >= 0
   |                             ^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:19:18
  in fn 'is_balanced'
  here: else false
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
19 |             else false
   |                  ^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-balanced-parens-0.almd:18:15
  in this expression with an unconstrained type
  here: list.drop_end(stack, 1) |> list.len(_) >= 0
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |               list.drop_end(stack, 1) |> list.len(_) >= 0
   |               ^^^^^^^^^^^^^^^^^^^^^^^

19 error(s) found
FAILED: /tmp/dojo-balanced-parens-0.almd
  parse error: Expected identifier at line 2:7 (got Newline '')
  parse error: Expected expression at line 6:3 (got In 'in')
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  in list.fold(string.to_list(s), (stack, true), (acc, c) => 
    let (stack, valid) = acc
    in if set.contains(set.from_list(["(", "[", "{"]), c) then 
      (list.push(stack, c), valid)
    else if list.contains([")", "]", "}"], c) then 
      if list.is_empty(stack) then 
        (stack, false)
      else 
        let top = list.last(stack) ?? ""
        in if (top == "(" && c == ")") || (top == "[" && c == "]") || (top == "{" && c == "}") then 
          (list.drop_end(stack, 1), valid)
        else (stack, false)
    else (stack, valid)
  ).1 && list.is_empty(list.fold(string.to_list(s), (stack, true), (acc, c) => 
    let (stack, valid) = acc
    in if set.contains(set.from_list(["(", "[", "{"]), c) then 
      (list.push(stack, c), valid)
    else if list.contains([")", "]", "}"], c) then 
      if list.is_empty(stack) then 
        (stack, false)
      else 
        let top = list.last(stack) ?? ""
        in if (top == "(" && c == ")") || (top == "[" && c == "]") || (top == "{" && c == "}") then 
          (list.drop_end(stack, 1), valid)
        else (stack, false)
    else (stack, valid)
  ).0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:4:5
  in let-in
  here: let (stack, valid) = acc
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let (stack, valid) = acc
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:11:9
  in let-in
  here: let top = list.last(stack) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |         let top = list.last(stack) ?? ""
   |         ^^^
error: Expected expression at line 18:5 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:18:5
  here: in if set.contains(set.from_list(["(", "[", "{"]), c) then
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |     in if set.contains(set.from_list(["(", "[", "{"]), c) then
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:24:9
  in let-in
  here: let top = list.last(stack) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |         let top = list.last(stack) ?? ""
   |         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:17:26
  in variable acc
  here: let (stack, valid) = acc
  hint: Check the variable name
   |
17 |     let (stack, valid) = acc
   |                          ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:17:26
  in fn 'is_balanced'
  here: let (stack, valid) = acc
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
17 |     let (stack, valid) = acc
   |                          ^^^

6 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 18:5 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.to_list(s), (list.new[String](), true), (acc, c) => 
    if set.contains(set.from_list(["(", "[", "{"]), c) then 
      (list.push(acc.0, c), acc.1)
    else if list.contains([")", "]", "}"], c) then 
      if list.is_empty(acc.0) then 
        (acc.0, false)
      else 
        let top = list.last(acc.0) ?? ""
        in if (top == "(" && c == ")") || (top == "[" && c == "]") || (top == "{" && c == "}") then 
          (list.drop_end(acc.0, 1), acc.1)
        else (acc.0, false)
    else (acc.0, acc.1)
  ).1 && list.is_empty(list.fold(string.to_list(s), (list.new[String](), true), (acc, c) => 
    if set.contains(set.from_list(["(", "[", "{"]), c) then 
      (list.push(acc.0, c), acc.1)
    else if list.contains([")", "]", "}"], c) then 
      if list.is_empty(acc.0) then 
        (acc.0, false)
      else 
        let top = list.last(acc.0) ?? ""
        in if (top == "(" && c == ")") || (top == "[" && c == "]") || (top == "{" && c == "}") then 
          (list.drop_end(acc.0, 1), acc.1)
        else (acc.0, false)
    else (acc.0, acc.1)
  ).0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:9:9
  in let-in
  here: let top = list.last(acc.0) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |         let top = list.last(acc.0) ?? ""
  |         ^^^
error: 'let' is not an expression in Almide at line 9:9
  --> /tmp/dojo-balanced-parens-2.almd:9:9
  here: let top = list.last(acc.0) ?? ""
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |         let top = list.last(acc.0) ?? ""
  |         ^

2 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 9:9
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  list.fold(string.to_list(s), (list.new[String](), true), (acc, c) => 
    if set.contains(set.from_list(["(", "[", "{"]), c) then 
      (list.push(acc.0, c), acc.1)
    else if list.contains([")", "]", "}"], c) then 
      if list.is_empty(acc.0) then 
        (acc.0, false)
      else 
        (
          list.last(acc.0) ?? "",
          if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then 
            (list.drop_end(acc.0, 1), acc.1)
          else (acc.0, false)
        )
    else (acc.0, acc.1)
  ).1 && list.is_empty(list.fold(string.to_list(s), (list.new[String](), true), (acc, c) => 
    if set.contains(set.from_list(["(", "[", "{"]), c) then 
      (list.push(acc.0, c), acc.1)
    else if list.contains([")", "]", "}"], c) then 
      if list.is_empty(acc.0) then 
        (acc.0, false)
      else 
        (
          list.last(acc.0) ?? "",
          if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then 
            (list.drop_end(acc.0, 1), acc.1)
          else (acc.0, false)
        )
    else (acc.0, acc.1)
  ).0)
```

**Diagnostic:**

```
error: '&&' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:11:45
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
11 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                             ^^
error: '||' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:11:58
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
11 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                          ^^
error: '&&' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:11:92
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
11 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                                                            ^^
error: '||' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:11:105
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
11 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                                                                         ^^
error: '&&' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:11:139
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
11 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                                                                                                           ^^
error: '&&' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:16:7
  in operator
  here: ).1 && list.is_empty(list.fold(string.to_list(s), (list.new[String](), true), (acc, c) =>
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
16 |   ).1 && list.is_empty(list.fold(string.to_list(s), (list.new[String](), true), (acc, c) =>
   |       ^^
error: '&&' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:25:45
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
25 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                             ^^
error: '||' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:25:58
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
25 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                          ^^
error: '&&' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:25:92
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
25 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                                                            ^^
error: '||' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:25:105
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
25 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                                                                         ^^
error: '&&' is not valid in Almide
  --> /tmp/dojo-balanced-parens-3.almd:25:139
  in operator
  here: if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
25 |           if (list.last(acc.0) ?? "" == "(" && c == ")") || (list.last(acc.0) ?? "" == "[" && c == "]") || (list.last(acc.0) ?? "" == "{" && c == "}") then
   |                                                                                                                                           ^^
error[E032]: cannot mutate a field of immutable binding 'acc' via `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:4:25
  in call to list.push()
  here: (list.push(acc.0, c), acc.1)
  hint: Declare 'acc' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
  |
4 |       (list.push(acc.0, c), acc.1)
  |                         ^
error[E005]: argument 'f' expects fn((List[String], Bool), String) -> (List[String], Bool) but got fn((List[String], Bool), String) -> (Unit, Bool)
  --> /tmp/dojo-balanced-parens-3.almd:2:60
  in call to list.fold()
  here: list.fold(string.to_list(s), (list.new[String](), true), (acc, c) =>
  hint: Fix the argument type
  |
2 |   list.fold(string.to_list(s), (list.new[String](), true), (acc, c) =>
  |                                                            ^
error[E032]: cannot mutate a field of immutable binding 'acc' via `mut` parameter of list.push()
  --> /tmp/dojo-balanced-parens-3.almd:18:25
  in call to list.push()
  here: (list.push(acc.0, c), acc.1)
  hint: Declare 'acc' with `var` instead of `let` to allow mutation (a helper that writes its caller's value takes it as a `mut` parameter instead)
   |
18 |       (list.push(acc.0, c), acc.1)
   |                         ^
error[E005]: argument 'f' expects fn((List[String], Bool), String) -> (List[String], Bool) but got fn((List[String], Bool), String) -> (Unit, Bool)
  --> /tmp/dojo-balanced-parens-3.almd:16:81
  in call to list.fold()
  here: ).1 && list.is_empty(list.fold(string.to_list(s), (list.new[String](), true), (acc, c) =>
  hint: Fix the argument type
   |
16 |   ).1 && list.is_empty(list.fold(string.to_list(s), (list.new[String](), true), (acc, c) =>
   |                                                                                 ^
error[E001]: type mismatch in if branches: expected (List[String], Bool) but got (String, (List[String], Bool)) — the `then` branch at line 7 fixed the type to (List[String], Bool)
  --> /tmp/dojo-balanced-parens-3.almd:9:9
  in if branches
  here: (
  hint: Both branches of `if/then/else` must have the same type
  |
9 |         (
  |         ^
error[E001]: type mismatch in if branches: expected (Unit, Bool) but got (List[String], Bool) — the `then` branch at line 4 fixed the type to (Unit, Bool)
  --> /tmp/dojo-balanced-parens-3.almd:5:10
  in if branches
  here: else if list.contains([")", "]", "}"], c) then
  hint: Both branches of `if/then/else` must have the same type
  |
5 |     else if list.contains([")", "]", "}"], c) then
  |          ^^
error[E001]: type mismatch in if branches: expected (List[String], Bool) but got (String, (List[String], Bool)) — the `then` branch at line 21 fixed the type to (List[String], Bool)
  --> /tmp/dojo-balanced-parens-3.almd:23:9
  in if branches
  here: (
  hint: Both branches of `if/then/else` must have the same type
   |
23 |         (
   |         ^
error[E001]: type mismatch in if branches: expected (Unit, Bool) but got (List[String], Bool) — the `then` branch at line 18 fixed the type to (Unit, Bool)
  --> /tmp/dojo-balanced-parens-3.almd:19:10
  in if branches
  here: else if list.contains([")", "]", "}"], c) then
  hint: Both branches of `if/then/else` must have the same type
   |
19 |     else if list.contains([")", "]", "}"], c) then
   |          ^^

19 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
  parse error: '&&' is not valid in Almide
  parse error: '||' is not valid in Almide
  parse error: '&&' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
