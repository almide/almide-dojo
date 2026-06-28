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
        bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
        stack = list.new[String]()
    in 
        list.fold(string.chars(s), true, (acc, ch) => 
            if acc then 
                if list.contains(["(", "[", "{"], ch) then 
                    list.push(stack, ch) |> ignore;
                    true
                else if list.contains([")", "]", "}"], ch) then 
                    if list.is_empty(stack) then 
                        false
                    else 
                        let 
                            top = list.last(stack) |> option.unwrap_or("")
                        in 
                            if map.get(bracket_map, ch) == some(top) then 
                                stack |> list.drop_end(1) |> ignore;
                                true
                            else 
                                false
                else 
                    true
            else 
                false
        )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 5:5 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:5:5
  |
5 |     in
  |     ^
error: Semicolons are not used in Almide at line 9:51
  --> /tmp/dojo-balanced-parens-0.almd:9:51
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
9 |                     list.push(stack, ch) |> ignore;
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:15:25
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |                         let
   |                         ^^^
error: Expected expression at line 17:25 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:17:25
   |
17 |                         in
   |                         ^
error: Expected expression at line 21:29 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:21:29
   |
21 |                             else
   |                             ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:4:25
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |         stack = list.new[String]()
  |                         ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:16:45
  in variable stack
  hint: Check the variable name
   |
16 |                             top = list.last(stack) |> option.unwrap_or("")
   |                                             ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:18:40
  in variable bracket_map
  hint: Check the variable name
   |
18 |                             if map.get(bracket_map, ch) == some(top) then
   |                                        ^^^^^^^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:18:53
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
18 |                             if map.get(bracket_map, ch) == some(top) then
   |                                                     ^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-0.almd:18:65
  in variable top
  hint: Check the variable name
   |
18 |                             if map.get(bracket_map, ch) == some(top) then
   |                                                                 ^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:19:33
  in variable stack
  hint: Check the variable name
   |
19 |                                 stack |> list.drop_end(1) |> ignore;
   |                                 ^^^^^
error[E002]: undefined function 'ignore'
  --> /tmp/dojo-balanced-parens-0.almd:19:56
  in call to ignore()
  hint: Check the function name
   |
19 |                                 stack |> list.drop_end(1) |> ignore;
   |                                                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:20:33
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
20 |                                 true
   |                                 ^^^^

14 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    let stack = []
    in list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if acc.1 then 
            if list.contains(["(", "[", "{"], ch) then 
                ((acc.0 + [ch]), true)
            else if list.contains([")", "]", "}"], ch) then 
                if list.is_empty(acc.0) then 
                    ([], false)
                else 
                    let top = list.last(acc.0) |> option.unwrap_or("")
                    in if map.get(bracket_map, ch) == some(top) then 
                        ((list.drop_end(acc.0, 1)), true)
                    else 
                        ([], false)
            else 
                (acc.0, true)
        else 
            (acc.0, false)
    ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:12:21
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |                     let top = list.last(acc.0) |> option.unwrap_or("")
   |                     ^^^
error: Expected expression at line 17:13 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:17:13
   |
17 |             else
   |             ^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-1.almd:13:45
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
13 |                     if map.get(bracket_map, ch) == some(top) then
   |                                             ^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-1.almd:13:57
  in variable top
  hint: Check the variable name
   |
13 |                     if map.get(bracket_map, ch) == some(top) then
   |                                                         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:14:41
  in variable acc
  hint: Check the variable name
   |
14 |                         ((list.drop_end(acc.0, 1)), true)
   |                                         ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:16:30
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
16 |                         ([], false)
   |                              ^^^^^

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    let stack = []
    in list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if acc.1 then 
            if list.contains(["(", "[", "{"], ch) then 
                (acc.0 + [ch], true)
            else if list.contains([")", "]", "}"], ch) then 
                if list.is_empty(acc.0) then 
                    ([], false)
                else 
                    let top = list.last(acc.0) |> option.unwrap_or("")
                    in if map.get(bracket_map, ch) == some(top) then 
                        (list.drop_end(acc.0, 1), true)
                    else 
                        ([], false)
            else 
                (acc.0, true)
        else 
            (acc.0, false)
    ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:12:21
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |                     let top = list.last(acc.0) |> option.unwrap_or("")
   |                     ^^^
error: Expected expression at line 17:13 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:17:13
   |
17 |             else
   |             ^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-2.almd:13:45
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
13 |                     if map.get(bracket_map, ch) == some(top) then
   |                                             ^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-2.almd:13:57
  in variable top
  hint: Check the variable name
   |
13 |                     if map.get(bracket_map, ch) == some(top) then
   |                                                         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:14:40
  in variable acc
  hint: Check the variable name
   |
14 |                         (list.drop_end(acc.0, 1), true)
   |                                        ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:16:30
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
16 |                         ([], false)
   |                              ^^^^^

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    let stack = []
    in list.fold(string.chars(s), (stack, true), (acc, ch) => 
        if acc.1 then 
            if list.contains(["(", "[", "{"], ch) then 
                (acc.0 + [ch], true)
            else if list.contains([")", "]", "}"], ch) then 
                if list.is_empty(acc.0) then 
                    (acc.0, false)
                else 
                    let top = list.last(acc.0) 
                    in if option.is_some(top) && map.get(bracket_map, ch) == top then 
                        (list.drop_end(acc.0, 1), true)
                    else 
                        (acc.0, false)
            else 
                (acc.0, true)
        else 
            (acc.0, false)
    ).1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:12:21
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |                     let top = list.last(acc.0)
   |                     ^^^
error: '&&' is not valid in Almide at line 13:44
  --> /tmp/dojo-balanced-parens-3.almd:13:44
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
13 |                     if option.is_some(top) && map.get(bracket_map, ch) == top then
   |                                            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:3:17
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
3 |     let stack = []
  |                 ^

3 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
