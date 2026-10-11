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
      if list.any(pairs, (x) => x.0 == ch) 
      then list.push(stack, ch) 
      else if list.any(pairs, (x) => x.1 == ch) 
      then 
        if list.is_empty(stack) 
        then false 
        else 
          let 
            last = list.last(stack) |> option.unwrap_or("")
            matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
          in 
            if last == matching 
            then list.drop_end(stack, 1) 
            else false 
      else acc
    ) 
    |> (x) => x && list.is_empty(stack)
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
  --> /tmp/dojo-balanced-parens-0.almd:15:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |           let
   |           ^^^
error: Expected expression at line 18:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:18:11
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |           in
   |           ^
error: Expected expression at line 22:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:22:7
  here: else acc
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |       else acc
   |       ^
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
  --> /tmp/dojo-balanced-parens-0.almd:16:30
  in variable stack
  here: last = list.last(stack) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |             last = list.last(stack) |> option.unwrap_or("")
   |                              ^^^^^
error[E003]: cannot assign to undefined binding 'last'
  --> /tmp/dojo-balanced-parens-0.almd:16:57
  in last = ...
  here: last = list.last(stack) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last' is in scope to assign to. Declare it first: `var last = ...`
   |
16 |             last = list.last(stack) |> option.unwrap_or("")
   |                                                         ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:17:34
  in variable pairs
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
17 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                  ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:17:55
  in variable ch
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
17 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                       ^^
error[E003]: cannot assign to undefined binding 'matching'
  --> /tmp/dojo-balanced-parens-0.almd:17:105
  in matching = ...
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching' is in scope to assign to. Declare it first: `var matching = ...`
   |
17 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                         ^^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-0.almd:19:16
  in variable last
  here: if last == matching
  hint: Check the variable name
   |
19 |             if last == matching
   |                ^^^^
error[E003]: undefined variable 'matching'
  --> /tmp/dojo-balanced-parens-0.almd:19:24
  in variable matching
  here: if last == matching
  hint: Check the variable name
   |
19 |             if last == matching
   |                        ^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:20:32
  in variable stack
  here: then list.drop_end(stack, 1)
  hint: Check the variable name
   |
20 |             then list.drop_end(stack, 1)
   |                                ^^^^^
error[E001]: type mismatch in if branches: expected List[?10] but got Bool
  --> /tmp/dojo-balanced-parens-0.almd:21:18
  in if branches
  here: else false
  hint: Both branches of `if/then/else` must have the same type
   |
21 |             else false
   |                  ^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:21:18
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
21 |             else false
   |                  ^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-0.almd:5:13
  in this expression with an unconstrained type
  here: pairs = map.entries(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     pairs = map.entries(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-0.almd:17:24
  in this expression with an unconstrained type
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?10])
  --> /tmp/dojo-balanced-parens-0.almd:20:18
  in this expression with an unconstrained type
  here: then list.drop_end(stack, 1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |             then list.drop_end(stack, 1)
   |                  ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?10])
  --> /tmp/dojo-balanced-parens-0.almd:19:13
  in this expression with an unconstrained type
  here: if last == matching
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |             if last == matching
   |             ^^

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
      if list.any(pairs, (x) => x.0 == ch) 
      then (acc.0 + [ch], acc.1) 
      else if list.any(pairs, (x) => x.1 == ch) 
      then 
        if list.is_empty(acc.0) 
        then ([], false) 
        else 
          let 
            last = list.last(acc.0) |> option.unwrap_or("")
            matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
          in 
            if last == matching 
            then (list.drop_end(acc.0, 1), acc.1) 
            else ([], false) 
      else (acc.0, acc.1)
    ) 
    |> (x) => x.1 && list.is_empty(x.0)
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
  --> /tmp/dojo-balanced-parens-1.almd:14:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |           let
   |           ^^^
error: Expected expression at line 17:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:17:11
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |           in
   |           ^
error: Expected expression at line 21:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:21:7
  here: else (acc.0, acc.1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |       else (acc.0, acc.1)
   |       ^
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
  --> /tmp/dojo-balanced-parens-1.almd:15:30
  in variable acc
  here: last = list.last(acc.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
15 |             last = list.last(acc.0) |> option.unwrap_or("")
   |                              ^^^
error[E003]: cannot assign to undefined binding 'last'
  --> /tmp/dojo-balanced-parens-1.almd:15:57
  in last = ...
  here: last = list.last(acc.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'last' is in scope to assign to. Declare it first: `var last = ...`
   |
15 |             last = list.last(acc.0) |> option.unwrap_or("")
   |                                                         ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:16:34
  in variable pairs
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Check the variable name
   |
16 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                  ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-1.almd:16:55
  in variable ch
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
16 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                       ^^
error[E003]: cannot assign to undefined binding 'matching'
  --> /tmp/dojo-balanced-parens-1.almd:16:105
  in matching = ...
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: No `let`/`var` named 'matching' is in scope to assign to. Declare it first: `var matching = ...`
   |
16 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                                                         ^^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-1.almd:18:16
  in variable last
  here: if last == matching
  hint: Check the variable name
   |
18 |             if last == matching
   |                ^^^^
error[E003]: undefined variable 'matching'
  --> /tmp/dojo-balanced-parens-1.almd:18:24
  in variable matching
  here: if last == matching
  hint: Check the variable name
   |
18 |             if last == matching
   |                        ^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:19:33
  in variable acc
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
19 |             then (list.drop_end(acc.0, 1), acc.1)
   |                                 ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:19:44
  in variable acc
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
19 |             then (list.drop_end(acc.0, 1), acc.1)
   |                                            ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:20:23
  in fn 'is_balanced'
  here: else ([], false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
20 |             else ([], false)
   |                       ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-1.almd:20:19
  in empty list `[]` with no element-type context
  here: else ([], false)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
20 |             else ([], false)
   |                   ^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-1.almd:4:13
  in this expression with an unconstrained type
  here: pairs = map.entries(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     pairs = map.entries(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-1.almd:16:24
  in this expression with an unconstrained type
  here: matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |             matching = list.find(pairs, (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?10])
  --> /tmp/dojo-balanced-parens-1.almd:19:19
  in this expression with an unconstrained type
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |             then (list.drop_end(acc.0, 1), acc.1)
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?10], Unknown))
  --> /tmp/dojo-balanced-parens-1.almd:18:13
  in this expression with an unconstrained type
  here: if last == matching
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Int) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |             if last == matching
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
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in 
    list.fold(string.chars(s), ([], true), (acc, ch) => 
      if list.any(map.entries(bracket_map), (x) => x.0 == ch) 
      then (acc.0 + [ch], acc.1) 
      else if list.any(map.entries(bracket_map), (x) => x.1 == ch) 
      then 
        if list.is_empty(acc.0) 
        then ([], false) 
        else 
          let last = list.last(acc.0) |> option.unwrap_or("")
          in 
            let matching = list.find(map.entries(bracket_map), (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last == matching 
              then (list.drop_end(acc.0, 1), acc.1) 
              else ([], false) 
      else (acc.0, acc.1)
    ) 
    |> (x) => x.1 && list.is_empty(x.0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:12:11
  in let-in
  here: let last = list.last(acc.0) |> option.unwrap_or("")
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let last = list.last(acc.0) |> option.unwrap_or("")
   |           ^^^
error: Expected expression at line 19:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:19:7
  here: else (acc.0, acc.1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |       else (acc.0, acc.1)
   |       ^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-2.almd:14:78
  in variable ch
  here: let matching = list.find(map.entries(bracket_map), (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
14 |             let matching = list.find(map.entries(bracket_map), (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                              ^^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-2.almd:16:18
  in variable last
  here: if last == matching
  hint: Check the variable name
   |
16 |               if last == matching
   |                  ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:17:35
  in variable acc
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
17 |               then (list.drop_end(acc.0, 1), acc.1)
   |                                   ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:17:46
  in variable acc
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
17 |               then (list.drop_end(acc.0, 1), acc.1)
   |                                              ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:18:25
  in fn 'is_balanced'
  here: else ([], false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |               else ([], false)
   |                         ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-2.almd:18:21
  in empty list `[]` with no element-type context
  here: else ([], false)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
18 |               else ([], false)
   |                     ^
error[E025]: cannot infer a concrete type for this expression (type List[?4])
  --> /tmp/dojo-balanced-parens-2.almd:17:21
  in this expression with an unconstrained type
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |               then (list.drop_end(acc.0, 1), acc.1)
   |                     ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?4], Unknown))
  --> /tmp/dojo-balanced-parens-2.almd:16:15
  in this expression with an unconstrained type
  here: if last == matching
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Int) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |               if last == matching
   |               ^^

10 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in 
    list.fold(string.chars(s), ([], true), (acc, ch) => 
      if list.any(map.entries(bracket_map), (x) => x.0 == ch) 
      then (acc.0 + [ch], acc.1) 
      else if list.any(map.entries(bracket_map), (x) => x.1 == ch) 
      then 
        if list.is_empty(acc.0) 
        then ([], false) 
        else 
          let last = list.last(acc.0) |> option.unwrap_or("")
          in 
            let matching = list.find(map.entries(bracket_map), (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
            in 
              if last == matching 
              then (list.drop_end(acc.0, 1), acc.1) 
              else ([], false) 
      else (acc.0, acc.1)
    ) 
    |> (x) => x.1 && list.is_empty(x.0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:12:11
  in let-in
  here: let last = list.last(acc.0) |> option.unwrap_or("")
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let last = list.last(acc.0) |> option.unwrap_or("")
   |           ^^^
error: Expected expression at line 19:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:19:7
  here: else (acc.0, acc.1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |       else (acc.0, acc.1)
   |       ^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-3.almd:14:78
  in variable ch
  here: let matching = list.find(map.entries(bracket_map), (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
  hint: Did you mean `s`?
  try:
      s
   |
14 |             let matching = list.find(map.entries(bracket_map), (x) => x.1 == ch) |> option.map((x) => x.0) |> option.unwrap_or("")
   |                                                                              ^^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-3.almd:16:18
  in variable last
  here: if last == matching
  hint: Check the variable name
   |
16 |               if last == matching
   |                  ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:17:35
  in variable acc
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
17 |               then (list.drop_end(acc.0, 1), acc.1)
   |                                   ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:17:46
  in variable acc
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Check the variable name
   |
17 |               then (list.drop_end(acc.0, 1), acc.1)
   |                                              ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:18:25
  in fn 'is_balanced'
  here: else ([], false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |               else ([], false)
   |                         ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-3.almd:18:21
  in empty list `[]` with no element-type context
  here: else ([], false)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
18 |               else ([], false)
   |                     ^
error[E025]: cannot infer a concrete type for this expression (type List[?4])
  --> /tmp/dojo-balanced-parens-3.almd:17:21
  in this expression with an unconstrained type
  here: then (list.drop_end(acc.0, 1), acc.1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |               then (list.drop_end(acc.0, 1), acc.1)
   |                     ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?4], Unknown))
  --> /tmp/dojo-balanced-parens-3.almd:16:15
  in this expression with an unconstrained type
  here: if last == matching
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Int) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |               if last == matching
   |               ^^

10 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
