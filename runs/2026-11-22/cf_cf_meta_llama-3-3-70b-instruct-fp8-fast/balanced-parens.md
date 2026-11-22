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
    bracket_map = map.from_list([
      (")", "("),
      ("]", "["),
      ("}", "{")
    ])
    pairs = string.to_list(s) |> list.filter((x) => 
      list.contains(["(", ")", "[", "]", "{", "}"], x)
    )
  in 
    let 
      rec loop(xs: List[String], stack: List[String]) -> Bool = 
        if list.is_empty(xs) then 
          list.is_empty(stack)
        else 
          let 
            head = list.first(xs) ?? ""
          in 
            if list.contains(["(", "[", "{"], head) then 
              loop(list.drop(xs, 1), stack + [head])
            else 
              if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then 
                false
              else 
                loop(list.drop(xs, 1), list.drop_end(stack, 1))
    in 
      loop(pairs, stack)
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
error: Expected expression at line 12:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:12:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   in
   |   ^
error: Expected identifier at line 13:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:13:9
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     let
   |        ^
error: Expected expression at line 14:55 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-0.almd:14:55
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |       rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:18:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |           let
   |           ^^^
error: Expected expression at line 20:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:20:11
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |           in
   |           ^
error: '||' is not valid in Almide
  --> /tmp/dojo-balanced-parens-0.almd:24:39
  in operator
  here: if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
24 |               if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                       ^^
error: Expected expression at line 28:5 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:28:5
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
28 |     in
   |     ^
error[E003]: cannot assign to undefined binding 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in stack = ...
  here: stack = list.new[String]()
  hint: No `let`/`var` named 'stack' is in scope to assign to. Declare it first: `var stack = ...`
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:7:13
  in bracket_map = ...
  here: ("}", "{")
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
7 |       ("}", "{")
  |             ^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:10:53
  in pairs = ...
  here: list.contains(["(", ")", "[", "]", "{", "}"], x)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
   |
10 |       list.contains(["(", ")", "[", "]", "{", "}"], x)
   |                                                     ^
error[E003]: undefined variable 'rec'
  --> /tmp/dojo-balanced-parens-0.almd:14:7
  in variable rec
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |       rec loop(xs: List[String], stack: List[String]) -> Bool =
   |       ^^^
error[E003]: undefined variable 'List'
  --> /tmp/dojo-balanced-parens-0.almd:14:20
  in variable List
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |       rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                    ^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-balanced-parens-0.almd:14:25
  in variable String
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |       rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                         ^^^^^^
error[E003]: undefined variable 'List'
  --> /tmp/dojo-balanced-parens-0.almd:14:41
  in variable List
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |       rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                         ^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-balanced-parens-0.almd:14:46
  in variable String
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |       rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                              ^^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-0.almd:14:11
  in call to loop()
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the function name
   |
14 |       rec loop(xs: List[String], stack: List[String]) -> Bool =
   |           ^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:19:31
  in variable xs
  here: head = list.first(xs) ?? ""
  hint: Did you mean `s`?
  try:
      s
   |
19 |             head = list.first(xs) ?? ""
   |                               ^^
error[E003]: cannot assign to undefined binding 'head'
  --> /tmp/dojo-balanced-parens-0.almd:19:38
  in head = ...
  here: head = list.first(xs) ?? ""
  hint: No `let`/`var` named 'head' is in scope to assign to. Declare it first: `var head = ...`
   |
19 |             head = list.first(xs) ?? ""
   |                                      ^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-0.almd:21:47
  in variable head
  here: if list.contains(["(", "[", "{"], head) then
  hint: Check the variable name
   |
21 |             if list.contains(["(", "[", "{"], head) then
   |                                               ^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:22:30
  in variable xs
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Did you mean `s`?
  try:
      s
   |
22 |               loop(list.drop(xs, 1), stack + [head])
   |                              ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:22:38
  in variable stack
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
22 |               loop(list.drop(xs, 1), stack + [head])
   |                                      ^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-0.almd:22:47
  in variable head
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
22 |               loop(list.drop(xs, 1), stack + [head])
   |                                               ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-0.almd:22:15
  in call to loop()
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the function name
   |
22 |               loop(list.drop(xs, 1), stack + [head])
   |               ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:24:32
  in variable stack
  here: if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |               if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:24:50
  in variable bracket_map
  here: if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |               if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                  ^^^^^^^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-0.almd:24:63
  in variable head
  here: if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |               if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                               ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:24:82
  in variable stack
  here: if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |               if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                                                  ^^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:27:32
  in variable xs
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Did you mean `s`?
  try:
      s
   |
27 |                 loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:27:54
  in variable stack
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the variable name
   |
27 |                 loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                                      ^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-0.almd:27:17
  in call to loop()
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the function name
   |
27 |                 loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                 ^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:29:12
  in variable pairs
  here: loop(pairs, stack)
  hint: Check the variable name
   |
29 |       loop(pairs, stack)
   |            ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:29:19
  in variable stack
  here: loop(pairs, stack)
  hint: Check the variable name
   |
29 |       loop(pairs, stack)
   |                   ^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-0.almd:29:7
  in call to loop()
  here: loop(pairs, stack)
  hint: Check the function name
   |
29 |       loop(pairs, stack)
   |       ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-balanced-parens-0.almd:22:20
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 |               loop(list.drop(xs, 1), stack + [head])
   |                    ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?6])
  --> /tmp/dojo-balanced-parens-0.almd:24:42
  in this expression with an unconstrained type
  here: if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |               if list.is_empty(stack) || map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-0.almd:27:22
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
27 |                 loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                      ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?9])
  --> /tmp/dojo-balanced-parens-0.almd:27:40
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
27 |                 loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^

38 error(s) found
FAILED: /tmp/dojo-balanced-parens-0.almd
  parse error: Expected identifier at line 2:7 (got Newline '')
  parse error: Expected expression at line 12:3 (got In 'in')
  parse error: Expected identifier at line 13:9 (got Newline '')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = list.new[String]()
    bracket_map = map.from_list([
      (")", "("),
      ("]", "["),
      ("}", "{")
    ])
    pairs = string.to_list(s) |> list.filter((x) => 
      list.contains(["(", ")", "[", "]", "{", "}"], x)
    )
  in 
  let 
    rec loop(xs: List[String], stack: List[String]) -> Bool = 
      if list.is_empty(xs) then 
        list.is_empty(stack)
      else 
        let 
          head = list.first(xs) ?? ""
        in 
          if list.contains(["(", "[", "{"], head) then 
            loop(list.drop(xs, 1), stack + [head])
          else 
            if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then 
              false
            else 
              loop(list.drop(xs, 1), list.drop_end(stack, 1))
  in 
    loop(pairs, stack)
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
error: Expected expression at line 12:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:12:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   in
   |   ^
error: Expected identifier at line 13:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:13:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |   let
   |      ^
error: Expected expression at line 14:53 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-1.almd:14:53
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                                     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:18:9
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |         let
   |         ^^^
error: Expected expression at line 20:9 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:20:9
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |         in
   |         ^
error: Expected expression at line 28:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:28:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
28 |   in
   |   ^
error[E003]: cannot assign to undefined binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:3:21
  in stack = ...
  here: stack = list.new[String]()
  hint: No `let`/`var` named 'stack' is in scope to assign to. Declare it first: `var stack = ...`
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:7:13
  in bracket_map = ...
  here: ("}", "{")
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
7 |       ("}", "{")
  |             ^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:10:53
  in pairs = ...
  here: list.contains(["(", ")", "[", "]", "{", "}"], x)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
   |
10 |       list.contains(["(", ")", "[", "]", "{", "}"], x)
   |                                                     ^
error[E003]: undefined variable 'rec'
  --> /tmp/dojo-balanced-parens-1.almd:14:5
  in variable rec
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |     ^^^
error[E003]: undefined variable 'List'
  --> /tmp/dojo-balanced-parens-1.almd:14:18
  in variable List
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                  ^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-balanced-parens-1.almd:14:23
  in variable String
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                       ^^^^^^
error[E003]: undefined variable 'List'
  --> /tmp/dojo-balanced-parens-1.almd:14:39
  in variable List
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                       ^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-balanced-parens-1.almd:14:44
  in variable String
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
14 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                            ^^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-1.almd:14:9
  in call to loop()
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the function name
   |
14 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |         ^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:19:29
  in variable xs
  here: head = list.first(xs) ?? ""
  hint: Did you mean `s`?
  try:
      s
   |
19 |           head = list.first(xs) ?? ""
   |                             ^^
error[E003]: cannot assign to undefined binding 'head'
  --> /tmp/dojo-balanced-parens-1.almd:19:36
  in head = ...
  here: head = list.first(xs) ?? ""
  hint: No `let`/`var` named 'head' is in scope to assign to. Declare it first: `var head = ...`
   |
19 |           head = list.first(xs) ?? ""
   |                                    ^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-1.almd:21:45
  in variable head
  here: if list.contains(["(", "[", "{"], head) then
  hint: Check the variable name
   |
21 |           if list.contains(["(", "[", "{"], head) then
   |                                             ^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:22:28
  in variable xs
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Did you mean `s`?
  try:
      s
   |
22 |             loop(list.drop(xs, 1), stack + [head])
   |                            ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:22:36
  in variable stack
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
22 |             loop(list.drop(xs, 1), stack + [head])
   |                                    ^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-1.almd:22:45
  in variable head
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
22 |             loop(list.drop(xs, 1), stack + [head])
   |                                             ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-1.almd:22:13
  in call to loop()
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the function name
   |
22 |             loop(list.drop(xs, 1), stack + [head])
   |             ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:24:30
  in variable stack
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                              ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:24:48
  in variable bracket_map
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                ^^^^^^^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-1.almd:24:61
  in variable head
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                             ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:24:80
  in variable stack
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
24 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                                                ^^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:27:30
  in variable xs
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Did you mean `s`?
  try:
      s
   |
27 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                              ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:27:52
  in variable stack
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the variable name
   |
27 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                                    ^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-1.almd:27:15
  in call to loop()
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the function name
   |
27 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |               ^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:29:10
  in variable pairs
  here: loop(pairs, stack)
  hint: Check the variable name
   |
29 |     loop(pairs, stack)
   |          ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:29:17
  in variable stack
  here: loop(pairs, stack)
  hint: Check the variable name
   |
29 |     loop(pairs, stack)
   |                 ^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-1.almd:29:5
  in call to loop()
  here: loop(pairs, stack)
  hint: Check the function name
   |
29 |     loop(pairs, stack)
   |     ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-balanced-parens-1.almd:22:18
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
22 |             loop(list.drop(xs, 1), stack + [head])
   |                  ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?6])
  --> /tmp/dojo-balanced-parens-1.almd:24:40
  in this expression with an unconstrained type
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-1.almd:27:20
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
27 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                    ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?9])
  --> /tmp/dojo-balanced-parens-1.almd:27:38
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
27 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^

37 error(s) found
FAILED: /tmp/dojo-balanced-parens-1.almd
  parse error: Expected identifier at line 2:7 (got Newline '')
  parse error: Expected expression at line 12:3 (got In 'in')
  parse error: Expected identifier at line 13:7 (got Newline '')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_map = map.from_list([
      (")", "("),
      ("]", "["),
      ("}", "{")
    ])
    pairs = string.to_list(s) |> list.filter((x) => 
      list.contains(["(", ")", "[", "]", "{", "}"], x)
    )
  in 
  let 
    rec loop(xs: List[String], stack: List[String]) -> Bool = 
      if list.is_empty(xs) then 
        list.is_empty(stack)
      else 
        let 
          head = list.first(xs) ?? ""
        in 
          if list.contains(["(", "[", "{"], head) then 
            loop(list.drop(xs, 1), stack + [head])
          else 
            if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then 
              false
            else 
              loop(list.drop(xs, 1), list.drop_end(stack, 1))
  in 
    loop(pairs, [])
```

**Diagnostic:**

```
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |      ^
error: Expected expression at line 11:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:11:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   in
   |   ^
error: Expected identifier at line 12:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:12:7
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |   let
   |      ^
error: Expected expression at line 13:53 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-2.almd:13:53
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                                     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:17:9
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
17 |         let
   |         ^^^
error: Expected expression at line 19:9 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:19:9
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |         in
   |         ^
error: Expected expression at line 27:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:27:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 |   in
   |   ^
error[E003]: cannot assign to undefined binding 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:6:13
  in bracket_map = ...
  here: ("}", "{")
  hint: No `let`/`var` named 'bracket_map' is in scope to assign to. Declare it first: `var bracket_map = ...`
  |
6 |       ("}", "{")
  |             ^^^
error[E003]: cannot assign to undefined binding 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:9:53
  in pairs = ...
  here: list.contains(["(", ")", "[", "]", "{", "}"], x)
  hint: No `let`/`var` named 'pairs' is in scope to assign to. Declare it first: `var pairs = ...`
  |
9 |       list.contains(["(", ")", "[", "]", "{", "}"], x)
  |                                                     ^
error[E003]: undefined variable 'rec'
  --> /tmp/dojo-balanced-parens-2.almd:13:5
  in variable rec
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
13 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |     ^^^
error[E003]: undefined variable 'List'
  --> /tmp/dojo-balanced-parens-2.almd:13:18
  in variable List
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
13 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                  ^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-balanced-parens-2.almd:13:23
  in variable String
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
13 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                       ^^^^^^
error[E003]: undefined variable 'List'
  --> /tmp/dojo-balanced-parens-2.almd:13:39
  in variable List
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
13 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                       ^^^^
error[E003]: undefined variable 'String'
  --> /tmp/dojo-balanced-parens-2.almd:13:44
  in variable String
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the variable name
   |
13 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |                                            ^^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-2.almd:13:9
  in call to loop()
  here: rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Check the function name
   |
13 |     rec loop(xs: List[String], stack: List[String]) -> Bool =
   |         ^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:18:29
  in variable xs
  here: head = list.first(xs) ?? ""
  hint: Did you mean `s`?
  try:
      s
   |
18 |           head = list.first(xs) ?? ""
   |                             ^^
error[E003]: cannot assign to undefined binding 'head'
  --> /tmp/dojo-balanced-parens-2.almd:18:36
  in head = ...
  here: head = list.first(xs) ?? ""
  hint: No `let`/`var` named 'head' is in scope to assign to. Declare it first: `var head = ...`
   |
18 |           head = list.first(xs) ?? ""
   |                                    ^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-2.almd:20:45
  in variable head
  here: if list.contains(["(", "[", "{"], head) then
  hint: Check the variable name
   |
20 |           if list.contains(["(", "[", "{"], head) then
   |                                             ^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:21:28
  in variable xs
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Did you mean `s`?
  try:
      s
   |
21 |             loop(list.drop(xs, 1), stack + [head])
   |                            ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:21:36
  in variable stack
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
21 |             loop(list.drop(xs, 1), stack + [head])
   |                                    ^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-2.almd:21:45
  in variable head
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
21 |             loop(list.drop(xs, 1), stack + [head])
   |                                             ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-2.almd:21:13
  in call to loop()
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the function name
   |
21 |             loop(list.drop(xs, 1), stack + [head])
   |             ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:23:30
  in variable stack
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
23 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                              ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:23:48
  in variable bracket_map
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
23 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                ^^^^^^^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-2.almd:23:61
  in variable head
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
23 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                             ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:23:80
  in variable stack
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
23 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                                                ^^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:26:30
  in variable xs
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Did you mean `s`?
  try:
      s
   |
26 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                              ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:26:52
  in variable stack
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the variable name
   |
26 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                                    ^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-2.almd:26:15
  in call to loop()
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the function name
   |
26 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |               ^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:28:10
  in variable pairs
  here: loop(pairs, [])
  hint: Check the variable name
   |
28 |     loop(pairs, [])
   |          ^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-2.almd:28:5
  in call to loop()
  here: loop(pairs, [])
  hint: Check the function name
   |
28 |     loop(pairs, [])
   |     ^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-2.almd:28:17
  in empty list `[]` with no element-type context
  here: loop(pairs, [])
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
28 |     loop(pairs, [])
   |                 ^
error[E025]: cannot infer a concrete type for this expression (type List[?3])
  --> /tmp/dojo-balanced-parens-2.almd:21:18
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
21 |             loop(list.drop(xs, 1), stack + [head])
   |                  ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[?6])
  --> /tmp/dojo-balanced-parens-2.almd:23:40
  in this expression with an unconstrained type
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |             if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?8])
  --> /tmp/dojo-balanced-parens-2.almd:26:20
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
26 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                    ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?9])
  --> /tmp/dojo-balanced-parens-2.almd:26:38
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
26 |               loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^

36 error(s) found
FAILED: /tmp/dojo-balanced-parens-2.almd
  parse error: Expected identifier at line 2:7 (got Newline '')
  parse error: Expected expression at line 11:3 (got In 'in')
  parse error: Expected identifier at line 12:7 (got Newline '')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([
    (")", "("),
    ("]", "["),
    ("}", "{")
  ])
  let pairs = string.to_list(s) |> list.filter((x) => 
    list.contains(["(", ")", "[", "]", "{", "}"], x)
  )
  in 
  let rec loop(xs: List[String], stack: List[String]) -> Bool = 
    if list.is_empty(xs) then 
      list.is_empty(stack)
    else 
      let head = list.first(xs) ?? ""
      in 
        if list.contains(["(", "[", "{"], head) then 
          loop(list.drop(xs, 1), stack + [head])
        else 
          if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then 
            false
          else 
            loop(list.drop(xs, 1), list.drop_end(stack, 1))
  in 
    loop(pairs, [])
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-balanced-parens-3.almd:11:7
  in let rec
  here: let rec loop(xs: List[String], stack: List[String]) -> Bool =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
11 |   let rec loop(xs: List[String], stack: List[String]) -> Bool =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:15:7
  in let-in
  here: let head = list.first(xs) ?? ""
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |       let head = list.first(xs) ?? ""
   |       ^^^
error: Expected expression at line 24:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:24:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |   in
   |   ^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-3.almd:17:43
  in variable head
  here: if list.contains(["(", "[", "{"], head) then
  hint: Check the variable name
   |
17 |         if list.contains(["(", "[", "{"], head) then
   |                                           ^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:18:26
  in variable xs
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Did you mean `s`?
  try:
      s
   |
18 |           loop(list.drop(xs, 1), stack + [head])
   |                          ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:18:34
  in variable stack
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
18 |           loop(list.drop(xs, 1), stack + [head])
   |                                  ^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-3.almd:18:43
  in variable head
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the variable name
   |
18 |           loop(list.drop(xs, 1), stack + [head])
   |                                           ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-3.almd:18:11
  in call to loop()
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Check the function name
   |
18 |           loop(list.drop(xs, 1), stack + [head])
   |           ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:20:28
  in variable stack
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
20 |           if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                            ^^^^^
error[E003]: undefined variable 'head'
  --> /tmp/dojo-balanced-parens-3.almd:20:59
  in variable head
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
20 |           if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                           ^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:20:78
  in variable stack
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: Check the variable name
   |
20 |           if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                                                              ^^^^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:23:28
  in variable xs
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Did you mean `s`?
  try:
      s
   |
23 |             loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                            ^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:23:50
  in variable stack
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the variable name
   |
23 |             loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                                  ^^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-3.almd:23:13
  in call to loop()
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Check the function name
   |
23 |             loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |             ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-balanced-parens-3.almd:25:5
  in call to loop()
  here: loop(pairs, [])
  hint: Check the function name
   |
25 |     loop(pairs, [])
   |     ^^^^
error[E037]: operator '!=' compares Option[String] with String
  at line 20
  in operator !=
  here: if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
  hint: A comparison relates two values of the same type, and nothing converts one side implicitly — convert one side explicitly (`int.to_string(n)`, `int.parse(s)`, `float.from(n)`, `<type>.from(x)` for a sized width), or compare the parts you mean
   |
20 |           if list.is_empty(stack) or map.get(bracket_map, head) != list.last(stack) ?? "" then
   |                                      ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-balanced-parens-3.almd:25:17
  in empty list `[]` with no element-type context
  here: loop(pairs, [])
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
25 |     loop(pairs, [])
   |                 ^
error[E025]: cannot infer a concrete type for this expression (type List[?2])
  --> /tmp/dojo-balanced-parens-3.almd:18:16
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), stack + [head])
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
18 |           loop(list.drop(xs, 1), stack + [head])
   |                ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?5])
  --> /tmp/dojo-balanced-parens-3.almd:23:18
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |             loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                  ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?6])
  --> /tmp/dojo-balanced-parens-3.almd:23:36
  in this expression with an unconstrained type
  here: loop(list.drop(xs, 1), list.drop_end(stack, 1))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
23 |             loop(list.drop(xs, 1), list.drop_end(stack, 1))
   |                                    ^^^^^^^^^^^^^^^^^^^^^^^

20 error(s) found
FAILED: /tmp/dojo-balanced-parens-3.almd
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 24:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-balanced-parens-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
