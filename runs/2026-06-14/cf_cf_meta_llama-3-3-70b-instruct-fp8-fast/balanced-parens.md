# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

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
          |> list.is_empty
          |> not
        else if list.any(pairs, (x) => x.1 == ch) then
          if list.is_empty(stack) then false
          else
            let
              top = list.last(stack)
              pair = list.find(pairs, (x) => x.1 == ch)
            in
              if pair.0 == top then
                list.drop_end(stack, 1)
                |> list.is_empty
                |> not
              else false
        else acc
      else false
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:6:3
  |
6 |   in
  |   ^
error: Expected expression at line 12:17 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:12:17
   |
12 |           |> not
   |                 ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:16:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
16 |             let
   |             ^^^
error: Expected expression at line 19:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:19:13
   |
19 |             in
   |             ^
error: Expected expression at line 23:23 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:23:23
   |
23 |                 |> not
   |                       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:5:25
  in variable bracket_map
  hint: Check the variable name
  |
5 |     pairs = map.entries(bracket_map)
  |                         ^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:17:31
  in variable stack
  hint: Check the variable name
   |
17 |               top = list.last(stack)
   |                               ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:18:32
  in variable pairs
  hint: Check the variable name
   |
18 |               pair = list.find(pairs, (x) => x.1 == ch)
   |                                ^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:18:53
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
18 |               pair = list.find(pairs, (x) => x.1 == ch)
   |                                                     ^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:18:53
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |               pair = list.find(pairs, (x) => x.1 == ch)
   |                                                     ^^

12 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let stack = []
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  let pairs = map.entries(bracket_map)
  in list.fold(string.chars(s), (stack, true), ((stack, acc), ch) =>
    if acc then
      if list.any(pairs, (x) => x.0 == ch) then
        (stack + [ch], true)
      else if list.any(pairs, (x) => x.1 == ch) then
        if list.is_empty(stack) then
          ([], false)
        else
          let top = list.first(stack)
          let pair = list.find(pairs, (x) => x.1 == ch)
          in if pair.0 == top then
            (list.drop(stack, 1), true)
          else
            ([], false)
      else
        (stack, acc)
    else
      (stack, false)
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:13:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |           let top = list.first(stack)
   |           ^^^
error: Expected expression at line 19:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:19:7
   |
19 |       else
   |       ^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-1.almd:14:53
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
14 |           let pair = list.find(pairs, (x) => x.1 == ch)
   |                                                     ^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-1.almd:15:24
  in variable top
  hint: Check the variable name
   |
15 |           if pair.0 == top then
   |                        ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:18:18
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |             ([], false)
   |                  ^^^^^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  let pairs = map.entries(bracket_map)
  in list.fold(string.chars(s), ([], true), ((stack, acc), ch) =>
    if acc then
      if list.any(pairs, (x) => x.0 == ch) then
        (stack + [ch], true)
      else if list.any(pairs, (x) => x.1 == ch) then
        if list.is_empty(stack) then
          (stack, false)
        else
          let top = list.first(stack) |> option.unwrap_or("")
          let pair = list.find(pairs, (x) => x.1 == ch)
          in if pair.0 == top then
            (list.drop_end(stack, 1), true)
          else
            (stack, false)
      else
        (stack, acc)
    else
      (stack, false)
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:12:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let top = list.first(stack) |> option.unwrap_or("")
   |           ^^^
error: Expected expression at line 18:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:18:7
   |
18 |       else
   |       ^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-2.almd:13:53
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
13 |           let pair = list.find(pairs, (x) => x.1 == ch)
   |                                                     ^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-2.almd:14:24
  in variable top
  hint: Check the variable name
   |
14 |           if pair.0 == top then
   |                        ^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:15:28
  in variable stack
  hint: Check the variable name
   |
15 |             (list.drop_end(stack, 1), true)
   |                            ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:17:14
  in variable stack
  hint: Check the variable name
   |
17 |             (stack, false)
   |              ^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:17:21
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
17 |             (stack, false)
   |                     ^^^^^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  let pairs = map.entries(bracket_map)
  in list.fold(string.chars(s), ([], true), (x, ch) =>
    if x.1 then
      if list.any(pairs, (y) => y.0 == ch) then
        (x.0 + [ch], true)
      else if list.any(pairs, (y) => y.1 == ch) then
        if list.is_empty(x.0) then
          (x.0, false)
        else
          let top = list.first(x.0) |> option.unwrap_or("")
          in if list.any(pairs, (y) => y.0 == top && y.1 == ch) then
            (list.drop_end(x.0, 1), true)
          else
            (x.0, false)
      else
        (x.0, x.1)
    else
      (x.0, false)
  ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:12:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let top = list.first(x.0) |> option.unwrap_or("")
   |           ^^^
error: '&&' is not valid in Almide at line 13:48
  --> /tmp/dojo-balanced-parens-3.almd:13:48
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
13 |           if list.any(pairs, (y) => y.0 == top && y.1 == ch) then
   |                                                ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:3:27
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
3 |   let pairs = map.entries(bracket_map)
  |                           ^^^^^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
