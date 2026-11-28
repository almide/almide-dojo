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
    pairs = map.to_list(bracket_map)
  in 
    list.fold(string.to_list(s), true, (acc, c) => 
      if acc then 
        if list.any(pairs, (x) => x.0 == c) then 
          list.push(stack, c)
          true
        else if list.any(pairs, (x) => x.1 == c) then 
          if list.is_empty(stack) then false
          else 
            let 
              top = list.last(stack) ?? ""
              pair = list.find(pairs, (x) => x.0 == top)
            in 
              if pair ?? none == none || pair.1 != c then false
              else 
                stack <- list.drop_end(stack, 1)
                true
        else true
      else false)
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
error: Missing ',' between function arguments at line 11:11
  --> /tmp/dojo-balanced-parens-0.almd:11:11
  here: true
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
11 |           true
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:15:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |             let
   |             ^^^
error: Expected expression at line 18:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:18:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |             in
   |             ^
error: '||' is not valid in Almide
  --> /tmp/dojo-balanced-parens-0.almd:19:39
  in operator
  here: if pair ?? none == none || pair.1 != c then false
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
19 |               if pair ?? none == none || pair.1 != c then false
   |                                       ^^
error: Expected expression at line 23:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:23:9
  here: else true
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |         else true
   |         ^
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
  here: pairs = map.to_list(bracket_map)
  hint: Check the variable name
  |
5 |     pairs = map.to_list(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:5:25
  in pairs = ...
  here: pairs = map.to_list(bracket_map)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
  |
5 |     pairs = map.to_list(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:16:31
  in variable stack
  here: top = list.last(stack) ?? ""
  hint: Check the variable name
   |
16 |               top = list.last(stack) ?? ""
   |                               ^^^^^
error[E003]: cannot assign to undefined binding 'top'
  --> /tmp/dojo-balanced-parens-0.almd:16:41
  in top = ...
  here: top = list.last(stack) ?? ""
  hint: No `let`/`var` named 'top' is in scope to assign to. Declare it first: `var top = ...`
   |
16 |               top = list.last(stack) ?? ""
   |                                         ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:17:32
  in variable pairs
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: Check the variable name
   |
17 |               pair = list.find(pairs, (x) => x.0 == top)
   |                                ^^^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-0.almd:17:53
  in variable top
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: Check the variable name
   |
17 |               pair = list.find(pairs, (x) => x.0 == top)
   |                                                     ^^^
error[E003]: cannot assign to undefined binding 'pair'
  --> /tmp/dojo-balanced-parens-0.almd:17:53
  in pair = ...
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: No `let`/`var` named 'pair' is in scope to assign to. Declare it first: `var pair = ...`
   |
17 |               pair = list.find(pairs, (x) => x.0 == top)
   |                                                     ^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-0.almd:19:18
  in variable pair
  here: if pair ?? none == none || pair.1 != c then false
  hint: Did you mean `panic`?
  try:
      panic
   |
19 |               if pair ?? none == none || pair.1 != c then false
   |                  ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-0.almd:19:42
  in variable pair
  here: if pair ?? none == none || pair.1 != c then false
  hint: Did you mean `panic`?
  try:
      panic
   |
19 |               if pair ?? none == none || pair.1 != c then false
   |                                          ^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:19:52
  in variable c
  here: if pair ?? none == none || pair.1 != c then false
  hint: Did you mean `s`?
  try:
      s
   |
19 |               if pair ?? none == none || pair.1 != c then false
   |                                                    ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:21:17
  in variable stack
  here: stack <- list.drop_end(stack, 1)
  hint: Check the variable name
   |
21 |                 stack <- list.drop_end(stack, 1)
   |                 ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:21:40
  in variable stack
  here: stack <- list.drop_end(stack, 1)
  hint: Check the variable name
   |
21 |                 stack <- list.drop_end(stack, 1)
   |                                        ^^^^^
error[E001]: operator '-' requires a signed numeric type but got List[?9]
  --> /tmp/dojo-balanced-parens-0.almd:21:47
  in operator -
  here: stack <- list.drop_end(stack, 1)
  hint: Use numeric types (Int or Float)
   |
21 |                 stack <- list.drop_end(stack, 1)
   |                                               ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:22:17
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
22 |                 true
   |                 ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-0.almd:5:13
  in this expression with an unconstrained type
  here: pairs = map.to_list(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     pairs = map.to_list(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-0.almd:17:22
  in this expression with an unconstrained type
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |               pair = list.find(pairs, (x) => x.0 == top)
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?7])
  --> /tmp/dojo-balanced-parens-0.almd:19:23
  in this expression with an unconstrained type
  here: if pair ?? none == none || pair.1 != c then false
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
19 |               if pair ?? none == none || pair.1 != c then false
   |                       ^^
error[E025]: cannot infer a concrete type for this expression (type List[?9])
  --> /tmp/dojo-balanced-parens-0.almd:21:26
  in this expression with an unconstrained type
  here: stack <- list.drop_end(stack, 1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
21 |                 stack <- list.drop_end(stack, 1)
   |                          ^^^^^^^^^^^^^^^^^^^^^^^

27 error(s) found
FAILED: /tmp/dojo-balanced-parens-0.almd
  parse error: Expected identifier at line 2:7 (got Newline '')
  parse error: Expected expression at line 6:3 (got In 'in')
  parse error: Missing ',' between function arguments at line 11:11
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    pairs = map.to_list(bracket_map)
  in 
    list.fold(string.to_list(s), (list.new[String](), true), (acc, c) => 
      if acc.1 then 
        if list.any(pairs, (x) => x.0 == c) then 
          (acc.0 + [c], true)
        else if list.any(pairs, (x) => x.1 == c) then 
          if list.is_empty(acc.0) then (acc.0, false)
          else 
            let 
              top = list.last(acc.0) ?? ""
              pair = list.find(pairs, (x) => x.0 == top)
            in 
              if pair == none or pair.1 != c then (acc.0, false)
              else (list.drop(acc.0, 1), true)
        else (acc.0, true)
      else (acc.0, false))
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
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:5:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:13:13
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |             let
   |             ^^^
error: Expected expression at line 16:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:16:13
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |             in
   |             ^
error: Expected expression at line 19:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:19:9
  here: else (acc.0, true)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |         else (acc.0, true)
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
  here: pairs = map.to_list(bracket_map)
  hint: Check the variable name
  |
4 |     pairs = map.to_list(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:4:25
  in pairs = ...
  here: pairs = map.to_list(bracket_map)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
  |
4 |     pairs = map.to_list(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:14:31
  in variable acc
  here: top = list.last(acc.0) ?? ""
  hint: Check the variable name
   |
14 |               top = list.last(acc.0) ?? ""
   |                               ^^^
error[E003]: cannot assign to undefined binding 'top'
  --> /tmp/dojo-balanced-parens-1.almd:14:41
  in top = ...
  here: top = list.last(acc.0) ?? ""
  hint: No `let`/`var` named 'top' is in scope to assign to. Declare it first: `var top = ...`
   |
14 |               top = list.last(acc.0) ?? ""
   |                                         ^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:15:32
  in variable pairs
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: Check the variable name
   |
15 |               pair = list.find(pairs, (x) => x.0 == top)
   |                                ^^^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-1.almd:15:53
  in variable top
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: Check the variable name
   |
15 |               pair = list.find(pairs, (x) => x.0 == top)
   |                                                     ^^^
error[E003]: cannot assign to undefined binding 'pair'
  --> /tmp/dojo-balanced-parens-1.almd:15:53
  in pair = ...
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: No `let`/`var` named 'pair' is in scope to assign to. Declare it first: `var pair = ...`
   |
15 |               pair = list.find(pairs, (x) => x.0 == top)
   |                                                     ^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-1.almd:17:18
  in variable pair
  here: if pair == none or pair.1 != c then (acc.0, false)
  hint: Did you mean `panic`?
  try:
      panic
   |
17 |               if pair == none or pair.1 != c then (acc.0, false)
   |                  ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-1.almd:17:34
  in variable pair
  here: if pair == none or pair.1 != c then (acc.0, false)
  hint: Did you mean `panic`?
  try:
      panic
   |
17 |               if pair == none or pair.1 != c then (acc.0, false)
   |                                  ^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:17:44
  in variable c
  here: if pair == none or pair.1 != c then (acc.0, false)
  hint: Did you mean `s`?
  try:
      s
   |
17 |               if pair == none or pair.1 != c then (acc.0, false)
   |                                            ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:17:52
  in variable acc
  here: if pair == none or pair.1 != c then (acc.0, false)
  hint: Check the variable name
   |
17 |               if pair == none or pair.1 != c then (acc.0, false)
   |                                                    ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:18:31
  in variable acc
  here: else (list.drop(acc.0, 1), true)
  hint: Check the variable name
   |
18 |               else (list.drop(acc.0, 1), true)
   |                               ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:18:42
  in fn 'is_balanced'
  here: else (list.drop(acc.0, 1), true)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |               else (list.drop(acc.0, 1), true)
   |                                          ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?0, ?1)])
  --> /tmp/dojo-balanced-parens-1.almd:4:13
  in this expression with an unconstrained type
  here: pairs = map.to_list(bracket_map)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     pairs = map.to_list(bracket_map)
  |             ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?5])
  --> /tmp/dojo-balanced-parens-1.almd:15:22
  in this expression with an unconstrained type
  here: pair = list.find(pairs, (x) => x.0 == top)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
15 |               pair = list.find(pairs, (x) => x.0 == top)
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-1.almd:18:21
  in this expression with an unconstrained type
  here: else (list.drop(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |               else (list.drop(acc.0, 1), true)
   |                     ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (Unknown, Bool))
  --> /tmp/dojo-balanced-parens-1.almd:17:15
  in this expression with an unconstrained type
  here: if pair == none or pair.1 != c then (acc.0, false)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (Int, Bool) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
17 |               if pair == none or pair.1 != c then (acc.0, false)
   |               ^^

23 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
  parse error: Expected identifier at line 2:7 (got Newline '')
  parse error: Expected expression at line 5:3 (got In 'in')
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in list.fold(string.to_list(s), (list.new[String](), true), (acc, c) => 
    if acc.1 then 
      if list.any(map.to_list(bracket_map), (x) => x.0 == c) then 
        (acc.0 + [c], true)
      else if list.any(map.to_list(bracket_map), (x) => x.1 == c) then 
        if list.is_empty(acc.0) then (acc.0, false)
        else 
          let top = list.last(acc.0) ?? ""
          in if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
          else (acc.0, false)
      else (acc.0, true)
    else (acc.0, false)
  ).1
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:10:11
  in let-in
  here: let top = list.last(acc.0) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let top = list.last(acc.0) ?? ""
   |           ^^^
error: Expected expression at line 13:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:13:7
  here: else (acc.0, true)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |       else (acc.0, true)
   |       ^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-2.almd:11:63
  in variable top
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
  hint: Check the variable name
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
   |                                                               ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:11:78
  in variable c
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
  hint: Did you mean `s`?
  try:
      s
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
   |                                                                              ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:11:101
  in variable acc
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
  hint: Check the variable name
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
   |                                                                                                     ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:12:17
  in variable acc
  here: else (acc.0, false)
  hint: Check the variable name
   |
12 |           else (acc.0, false)
   |                 ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:12:24
  in fn 'is_balanced'
  here: else (acc.0, false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
12 |           else (acc.0, false)
   |                        ^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?2])
  --> /tmp/dojo-balanced-parens-2.almd:11:87
  in this expression with an unconstrained type
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
   |                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?2], Bool))
  --> /tmp/dojo-balanced-parens-2.almd:11:11
  in this expression with an unconstrained type
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Bool) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) then (list.drop_end(acc.0, 1), true)
   |           ^^

9 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 13:7 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in list.fold(string.to_list(s), (list.new[String](), true), (acc, c) => 
    if acc.1 then 
      if list.any(map.to_list(bracket_map), (x) => x.0 == c) then 
        (acc.0 + [c], true)
      else if list.any(map.to_list(bracket_map), (x) => x.1 == c) then 
        if list.is_empty(acc.0) then (acc.0, false)
        else 
          let top = list.last(acc.0) ?? ""
          in if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c) 
             then (list.drop_end(acc.0, 1), true)
             else (acc.0, false)
      else (acc.0, true)
    else (acc.0, false)
  ).1
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:10:11
  in let-in
  here: let top = list.last(acc.0) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let top = list.last(acc.0) ?? ""
   |           ^^^
error: Expected expression at line 14:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:14:7
  here: else (acc.0, true)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |       else (acc.0, true)
   |       ^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-3.almd:11:63
  in variable top
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c)
  hint: Check the variable name
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c)
   |                                                               ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:11:78
  in variable c
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c)
  hint: Did you mean `s`?
  try:
      s
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c)
   |                                                                              ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:12:34
  in variable acc
  here: then (list.drop_end(acc.0, 1), true)
  hint: Check the variable name
   |
12 |              then (list.drop_end(acc.0, 1), true)
   |                                  ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:13:20
  in variable acc
  here: else (acc.0, false)
  hint: Check the variable name
   |
13 |              else (acc.0, false)
   |                    ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:13:27
  in fn 'is_balanced'
  here: else (acc.0, false)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
13 |              else (acc.0, false)
   |                           ^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?2])
  --> /tmp/dojo-balanced-parens-3.almd:12:20
  in this expression with an unconstrained type
  here: then (list.drop_end(acc.0, 1), true)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
12 |              then (list.drop_end(acc.0, 1), true)
   |                    ^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type (List[?2], Bool))
  --> /tmp/dojo-balanced-parens-3.almd:11:11
  in this expression with an unconstrained type
  here: if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: (List[Int], Bool) = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |           if list.any(map.to_list(bracket_map), (x) => x.0 == top and x.1 == c)
   |           ^^

9 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 14:7 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
