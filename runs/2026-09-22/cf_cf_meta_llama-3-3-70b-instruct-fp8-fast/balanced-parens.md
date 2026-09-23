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
          list.push(stack, ch) |> list.len(_) > 0
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(stack) then false
          else 
            let 
              last_bracket = list.last(stack) |> option.unwrap_or("")
              matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last_bracket == matching_pair then 
                list.drop_end(stack, 1) |> list.len(_) >= 0
              else false
        else true
      else false
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
  |       ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:6:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:14:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |             let
   |             ^^^
error: Expected expression at line 17:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:17:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |             in
   |             ^
error: Expected expression at line 21:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:21:9
  here: else true
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |         else true
   |         ^
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
  --> /tmp/dojo-balanced-parens-0.almd:15:40
  in variable stack
  here: last_bracket = list.last(stack) |> option.unwrap_or("")
  hint: Check the variable name
   |
15 |               last_bracket = list.last(stack) |> option.unwrap_or("")
   |                                        ^^^^^
error[E003]: cannot assign to undefined binding 'last_bracket'
  --> /tmp/dojo-balanced-parens-0.almd:15:67
  in last_bracket = ...
  here: last_bracket = list.last(stack) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last_bracket' is in scope to assign to. Declare it first: `var last_bracket = ...`
   |
15 |               last_bracket = list.last(stack) |> option.unwrap_or("")
   |                                                                   ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:16:41
  in variable pairs
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                         ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:16:62
  in variable ch
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                              ^^
error[E003]: cannot assign to undefined binding 'matching_pair'
  --> /tmp/dojo-balanced-parens-0.almd:16:112
  in matching_pair = ...
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching_pair' is in scope to assign to. Declare it first: `var matching_pair = ...`
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E003]: undefined variable 'last_bracket'
  --> /tmp/dojo-balanced-parens-0.almd:18:18
  in variable last_bracket
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                  ^^^^^^^^^^^^
error[E003]: undefined variable 'matching_pair'
  --> /tmp/dojo-balanced-parens-0.almd:18:34
  in variable matching_pair
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                                  ^^^^^^^^^^^^^
error[E046]: placeholder `_` is not valid in a call argument (argument 1 of list.len())
  --> /tmp/dojo-balanced-parens-0.almd:19:53
  in call argument
  here: list.drop_end(stack, 1) |> list.len(_) >= 0
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => list.len(x, /* the other arguments */)
   |
19 |                 list.drop_end(stack, 1) |> list.len(_) >= 0
   |                                                     ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:19:31
  in variable stack
  here: list.drop_end(stack, 1) |> list.len(_) >= 0
  hint: Check the variable name
   |
19 |                 list.drop_end(stack, 1) |> list.len(_) >= 0
   |                               ^^^^^
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-balanced-parens-0.almd:19:53
  in call to list.len()
  here: list.drop_end(stack, 1) |> list.len(_) >= 0
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
   |
19 |                 list.drop_end(stack, 1) |> list.len(_) >= 0
   |                                                     ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:20:20
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
20 |               else false
   |                    ^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-0.almd:5:13
  in this expression with an unconstrained type
  here: pairs = map.entries(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     pairs = map.entries(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?4])
  --> /tmp/dojo-balanced-parens-0.almd:16:31
  in this expression with an unconstrained type
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-0.almd:19:17
  in this expression with an unconstrained type
  here: list.drop_end(stack, 1) |> list.len(_) >= 0
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |                 list.drop_end(stack, 1) |> list.len(_) >= 0
   |                 ^^^^^^^^^^^^^^^^^^^^^^^

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
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    pairs = map.entries(bracket_map)
  in 
    list.fold(string.chars(s), ([], true), (acc, ch) => 
      if acc.1 then 
        if list.any(pairs, (x) => x.0 == ch) then 
          (acc.0 + [ch], true)
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(acc.0) then 
            ([], false)
          else 
            let 
              last_bracket = list.last(acc.0) |> option.unwrap_or("")
              matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last_bracket == matching_pair then 
                (list.drop_end(acc.0, 1), true)
              else 
                ([], false)
        else 
          (acc.0, true)
      else 
        (acc.0, false)
    ).1 && list.is_empty(list.fold(string.chars(s), ([], true), (acc, ch) => 
      if acc.1 then 
        if list.any(pairs, (x) => x.0 == ch) then 
          (acc.0 + [ch], true)
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(acc.0) then 
            ([], false)
          else 
            let 
              last_bracket = list.last(acc.0) |> option.unwrap_or("")
              matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last_bracket == matching_pair then 
                (list.drop_end(acc.0, 1), true)
              else 
                ([], false)
        else 
          (acc.0, true)
      else 
        (acc.0, false)
    ).0)
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
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:5:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:14:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |             let
   |             ^^^
error: Expected expression at line 17:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:17:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |             in
   |             ^
error: Expected expression at line 22:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:22:9
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |         else
   |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:34:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
34 |             let
   |             ^^^
error: Expected expression at line 37:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:37:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 |             in
   |             ^
error: Expected expression at line 42:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:42:9
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 |         else
   |         ^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:3:64
  in bracket_map = ...
  here: bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
3 |     bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  |                                                                ^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:4:25
  in variable bracket_map
  here: pairs = map.entries(bracket_map)
  hint: Check the variable name
  |
4 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:4:25
  in pairs = ...
  here: pairs = map.entries(bracket_map)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
  |
4 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:15:40
  in variable acc
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
15 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                        ^^^
error[E003]: cannot assign to undefined binding 'last_bracket'
  --> /tmp/dojo-balanced-parens-1.almd:15:67
  in last_bracket = ...
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last_bracket' is in scope to assign to. Declare it first: `var last_bracket = ...`
   |
15 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                                                   ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:16:41
  in variable pairs
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                         ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-1.almd:16:62
  in variable ch
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                              ^^
error[E003]: cannot assign to undefined binding 'matching_pair'
  --> /tmp/dojo-balanced-parens-1.almd:16:112
  in matching_pair = ...
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching_pair' is in scope to assign to. Declare it first: `var matching_pair = ...`
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E003]: undefined variable 'last_bracket'
  --> /tmp/dojo-balanced-parens-1.almd:18:18
  in variable last_bracket
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                  ^^^^^^^^^^^^
error[E003]: undefined variable 'matching_pair'
  --> /tmp/dojo-balanced-parens-1.almd:18:34
  in variable matching_pair
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                                  ^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:19:32
  in variable acc
  here: (list.drop_end(acc.0, 1), true)
  hint: Check the variable name
   |
19 |                 (list.drop_end(acc.0, 1), true)
   |                                ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:35:40
  in variable acc
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
35 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                        ^^^
error[E003]: cannot assign to undefined binding 'last_bracket'
  --> /tmp/dojo-balanced-parens-1.almd:35:67
  in last_bracket = ...
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last_bracket' is in scope to assign to. Declare it first: `var last_bracket = ...`
   |
35 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                                                   ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:36:41
  in variable pairs
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                         ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-1.almd:36:62
  in variable ch
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                              ^^
error[E003]: cannot assign to undefined binding 'matching_pair'
  --> /tmp/dojo-balanced-parens-1.almd:36:112
  in matching_pair = ...
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching_pair' is in scope to assign to. Declare it first: `var matching_pair = ...`
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E003]: undefined variable 'last_bracket'
  --> /tmp/dojo-balanced-parens-1.almd:38:18
  in variable last_bracket
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
38 |               if last_bracket == matching_pair then
   |                  ^^^^^^^^^^^^
error[E003]: undefined variable 'matching_pair'
  --> /tmp/dojo-balanced-parens-1.almd:38:34
  in variable matching_pair
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
38 |               if last_bracket == matching_pair then
   |                                  ^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:39:32
  in variable acc
  here: (list.drop_end(acc.0, 1), true)
  hint: Check the variable name
   |
39 |                 (list.drop_end(acc.0, 1), true)
   |                                ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:41:22
  in fn 'is_balanced'
  here: ([], false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
41 |                 ([], false)
   |                      ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-1.almd:21:18
  in empty list `[]` with no element-type context
  here: ([], false)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
21 |                 ([], false)
   |                  ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-1.almd:41:18
  in empty list `[]` with no element-type context
  here: ([], false)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
41 |                 ([], false)
   |                  ^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-1.almd:4:13
  in this expression with an unconstrained type
  here: pairs = map.entries(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     pairs = map.entries(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?4])
  --> /tmp/dojo-balanced-parens-1.almd:16:31
  in this expression with an unconstrained type
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-1.almd:19:18
  in this expression with an unconstrained type
  here: (list.drop_end(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |                 (list.drop_end(acc.0, 1), true)
   |                  ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?8], Bool))
  --> /tmp/dojo-balanced-parens-1.almd:18:15
  in this expression with an unconstrained type
  here: if last_bracket == matching_pair then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Bool) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |               if last_bracket == matching_pair then
   |               ^^
error[E025]: cannot infer a concrete type for this expression (type Option[?12])
  --> /tmp/dojo-balanced-parens-1.almd:36:31
  in this expression with an unconstrained type
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?16])
  --> /tmp/dojo-balanced-parens-1.almd:39:18
  in this expression with an unconstrained type
  here: (list.drop_end(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
39 |                 (list.drop_end(acc.0, 1), true)
   |                  ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?16], Bool))
  --> /tmp/dojo-balanced-parens-1.almd:38:15
  in this expression with an unconstrained type
  here: if last_bracket == matching_pair then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Bool) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |               if last_bracket == matching_pair then
   |               ^^

37 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    pairs = map.entries(bracket_map)
  in 
    list.fold(string.chars(s), ([], true), (acc, ch) => 
      if acc.1 then 
        if list.any(pairs, (x) => x.0 == ch) then 
          (acc.0 + [ch], true)
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(acc.0) then 
            ([], false)
          else 
            let 
              last_bracket = list.last(acc.0) |> option.unwrap_or("")
              matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last_bracket == matching_pair then 
                (list.drop_end(acc.0, 1), true)
              else 
                ([], false)
        else 
          (acc.0, true)
      else 
        (acc.0, false)
    ).1 && list.is_empty(list.fold(string.chars(s), ([], true), (acc, ch) => 
      if acc.1 then 
        if list.any(pairs, (x) => x.0 == ch) then 
          (acc.0 + [ch], true)
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(acc.0) then 
            ([:String] [], false)
          else 
            let 
              last_bracket = list.last(acc.0) |> option.unwrap_or("")
              matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last_bracket == matching_pair then 
                (list.drop_end(acc.0, 1), true)
              else 
                ([:String] [], false)
        else 
          (acc.0, true)
      else 
        (acc.0, false)
    ).0)
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:5:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:14:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |             let
   |             ^^^
error: Expected expression at line 17:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:17:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |             in
   |             ^
error: Expected expression at line 22:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:22:9
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |         else
   |         ^
error: Expected ']' to close empty map opened at line 32:14
  --> /tmp/dojo-balanced-parens-2.almd:32:16
  here: ([:String] [], false)
  hint: Add ']' or check for a missing delimiter inside the empty map
   |
32 |             ([:String] [], false)
   |              --------------- '[' opened here
   |
32 |             ([:String] [], false)
   |                ^^^^^^
error: Expected identifier at line 34:17 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:34:17
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |             let
   |                 ^
error: Expected expression at line 37:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:37:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 |             in
   |             ^
error: Expected ']' to close empty map opened at line 41:18
  --> /tmp/dojo-balanced-parens-2.almd:41:20
  here: ([:String] [], false)
  hint: Add ']' or check for a missing delimiter inside the empty map
   |
41 |                 ([:String] [], false)
   |                  --------------- '[' opened here
   |
41 |                 ([:String] [], false)
   |                    ^^^^^^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:3:64
  in bracket_map = ...
  here: bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
3 |     bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  |                                                                ^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:4:25
  in variable bracket_map
  here: pairs = map.entries(bracket_map)
  hint: Check the variable name
  |
4 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:4:25
  in pairs = ...
  here: pairs = map.entries(bracket_map)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
  |
4 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:15:40
  in variable acc
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
15 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                        ^^^
error[E003]: cannot assign to undefined binding 'last_bracket'
  --> /tmp/dojo-balanced-parens-2.almd:15:67
  in last_bracket = ...
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last_bracket' is in scope to assign to. Declare it first: `var last_bracket = ...`
   |
15 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                                                   ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:16:41
  in variable pairs
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                         ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-2.almd:16:62
  in variable ch
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                              ^^
error[E003]: cannot assign to undefined binding 'matching_pair'
  --> /tmp/dojo-balanced-parens-2.almd:16:112
  in matching_pair = ...
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching_pair' is in scope to assign to. Declare it first: `var matching_pair = ...`
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E003]: undefined variable 'last_bracket'
  --> /tmp/dojo-balanced-parens-2.almd:18:18
  in variable last_bracket
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                  ^^^^^^^^^^^^
error[E003]: undefined variable 'matching_pair'
  --> /tmp/dojo-balanced-parens-2.almd:18:34
  in variable matching_pair
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                                  ^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:19:32
  in variable acc
  here: (list.drop_end(acc.0, 1), true)
  hint: Check the variable name
   |
19 |                 (list.drop_end(acc.0, 1), true)
   |                                ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:35:40
  in variable acc
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
35 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                        ^^^
error[E003]: cannot assign to undefined binding 'last_bracket'
  --> /tmp/dojo-balanced-parens-2.almd:35:67
  in last_bracket = ...
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last_bracket' is in scope to assign to. Declare it first: `var last_bracket = ...`
   |
35 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                                                   ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:36:41
  in variable pairs
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                         ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-2.almd:36:62
  in variable ch
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                              ^^
error[E003]: cannot assign to undefined binding 'matching_pair'
  --> /tmp/dojo-balanced-parens-2.almd:36:112
  in matching_pair = ...
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching_pair' is in scope to assign to. Declare it first: `var matching_pair = ...`
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:36:112
  in fn 'is_balanced'
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-2.almd:21:18
  in empty list `[]` with no element-type context
  here: ([], false)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
21 |                 ([], false)
   |                  ^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-2.almd:4:13
  in this expression with an unconstrained type
  here: pairs = map.entries(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     pairs = map.entries(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?4])
  --> /tmp/dojo-balanced-parens-2.almd:16:31
  in this expression with an unconstrained type
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-2.almd:19:18
  in this expression with an unconstrained type
  here: (list.drop_end(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |                 (list.drop_end(acc.0, 1), true)
   |                  ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?8], Bool))
  --> /tmp/dojo-balanced-parens-2.almd:18:15
  in this expression with an unconstrained type
  here: if last_bracket == matching_pair then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Bool) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |               if last_bracket == matching_pair then
   |               ^^
error[E025]: cannot infer a concrete type for this expression (type Option[?12])
  --> /tmp/dojo-balanced-parens-2.almd:36:31
  in this expression with an unconstrained type
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

32 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    pairs = map.entries(bracket_map)
  in 
    list.fold(string.chars(s), ([], true), (acc, ch) => 
      if acc.1 then 
        if list.any(pairs, (x) => x.0 == ch) then 
          (acc.0 + [ch], true)
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(acc.0) then 
            ([], false)
          else 
            let 
              last_bracket = list.last(acc.0) |> option.unwrap_or("")
              matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last_bracket == matching_pair then 
                (list.drop_end(acc.0, 1), true)
              else 
                ([], false)
        else 
          (acc.0, true)
      else 
        (acc.0, false)
    ).1 && list.is_empty(list.fold(string.chars(s), ([], true), (acc, ch) => 
      if acc.1 then 
        if list.any(pairs, (x) => x.0 == ch) then 
          (acc.0 + [ch], true)
        else if list.any(pairs, (x) => x.1 == ch) then 
          if list.is_empty(acc.0) then 
            ([:String] [], false)
          else 
            let 
              last_bracket = list.last(acc.0) |> option.unwrap_or("")
              matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last_bracket == matching_pair then 
                (list.drop_end(acc.0, 1), true)
              else 
                ([:String] [], false)
        else 
          (acc.0, true)
      else 
        (acc.0, false)
    ).0)
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:5:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:14:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |             let
   |             ^^^
error: Expected expression at line 17:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:17:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |             in
   |             ^
error: Expected expression at line 22:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:22:9
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |         else
   |         ^
error: Expected ']' to close empty map opened at line 32:14
  --> /tmp/dojo-balanced-parens-3.almd:32:16
  here: ([:String] [], false)
  hint: Add ']' or check for a missing delimiter inside the empty map
   |
32 |             ([:String] [], false)
   |              --------------- '[' opened here
   |
32 |             ([:String] [], false)
   |                ^^^^^^
error: Expected identifier at line 34:17 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:34:17
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |             let
   |                 ^
error: Expected expression at line 37:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:37:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 |             in
   |             ^
error: Expected ']' to close empty map opened at line 41:18
  --> /tmp/dojo-balanced-parens-3.almd:41:20
  here: ([:String] [], false)
  hint: Add ']' or check for a missing delimiter inside the empty map
   |
41 |                 ([:String] [], false)
   |                  --------------- '[' opened here
   |
41 |                 ([:String] [], false)
   |                    ^^^^^^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-3.almd:3:64
  in bracket_map = ...
  here: bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
3 |     bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  |                                                                ^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-3.almd:4:25
  in variable bracket_map
  here: pairs = map.entries(bracket_map)
  hint: Check the variable name
  |
4 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-3.almd:4:25
  in pairs = ...
  here: pairs = map.entries(bracket_map)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
  |
4 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:15:40
  in variable acc
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
15 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                        ^^^
error[E003]: cannot assign to undefined binding 'last_bracket'
  --> /tmp/dojo-balanced-parens-3.almd:15:67
  in last_bracket = ...
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last_bracket' is in scope to assign to. Declare it first: `var last_bracket = ...`
   |
15 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                                                   ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-3.almd:16:41
  in variable pairs
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                         ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-3.almd:16:62
  in variable ch
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                              ^^
error[E003]: cannot assign to undefined binding 'matching_pair'
  --> /tmp/dojo-balanced-parens-3.almd:16:112
  in matching_pair = ...
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching_pair' is in scope to assign to. Declare it first: `var matching_pair = ...`
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E003]: undefined variable 'last_bracket'
  --> /tmp/dojo-balanced-parens-3.almd:18:18
  in variable last_bracket
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                  ^^^^^^^^^^^^
error[E003]: undefined variable 'matching_pair'
  --> /tmp/dojo-balanced-parens-3.almd:18:34
  in variable matching_pair
  here: if last_bracket == matching_pair then
  hint: Check the variable name
   |
18 |               if last_bracket == matching_pair then
   |                                  ^^^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:19:32
  in variable acc
  here: (list.drop_end(acc.0, 1), true)
  hint: Check the variable name
   |
19 |                 (list.drop_end(acc.0, 1), true)
   |                                ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:35:40
  in variable acc
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
35 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                        ^^^
error[E003]: cannot assign to undefined binding 'last_bracket'
  --> /tmp/dojo-balanced-parens-3.almd:35:67
  in last_bracket = ...
  here: last_bracket = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last_bracket' is in scope to assign to. Declare it first: `var last_bracket = ...`
   |
35 |               last_bracket = list.last(acc.0) |> option.unwrap_or("")
   |                                                                   ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-3.almd:36:41
  in variable pairs
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                         ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-3.almd:36:62
  in variable ch
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                              ^^
error[E003]: cannot assign to undefined binding 'matching_pair'
  --> /tmp/dojo-balanced-parens-3.almd:36:112
  in matching_pair = ...
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching_pair' is in scope to assign to. Declare it first: `var matching_pair = ...`
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:36:112
  in fn 'is_balanced'
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                                ^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-3.almd:21:18
  in empty list `[]` with no element-type context
  here: ([], false)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
21 |                 ([], false)
   |                  ^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-3.almd:4:13
  in this expression with an unconstrained type
  here: pairs = map.entries(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     pairs = map.entries(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?4])
  --> /tmp/dojo-balanced-parens-3.almd:16:31
  in this expression with an unconstrained type
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-3.almd:19:18
  in this expression with an unconstrained type
  here: (list.drop_end(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |                 (list.drop_end(acc.0, 1), true)
   |                  ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?8], Bool))
  --> /tmp/dojo-balanced-parens-3.almd:18:15
  in this expression with an unconstrained type
  here: if last_bracket == matching_pair then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Bool) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |               if last_bracket == matching_pair then
   |               ^^
error[E025]: cannot infer a concrete type for this expression (type Option[?12])
  --> /tmp/dojo-balanced-parens-3.almd:36:31
  in this expression with an unconstrained type
  here: matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
36 |               matching_pair = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

32 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
