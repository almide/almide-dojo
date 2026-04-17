# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let 
        stack = list.new[String]()
        bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
        pairs = string.chars(s) 
            |> list.filter((x) => map.contains(bracket_map, x) || list.contains(["(", "[", "{"], x))
            |> list.fold(stack, (stack, x) => 
                if list.contains(["(", "[", "{"], x) then 
                    stack + [x]
                else if list.is_empty(stack) then 
                    stack
                else if map.get(bracket_map, x) == list.last(stack) then 
                    list.drop_end(stack, 1)
                else 
                    stack
            )
    in 
    list.is_empty(pairs)

```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:9
  |
2 |     let
  |         ^
error: '||' is not valid in Almide at line 6:64
  --> /tmp/dojo-balanced-parens-0.almd:6:64
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
6 |             |> list.filter((x) => map.contains(bracket_map, x) || list.contains(["(", "[", "{"], x))
  |                                                                ^
error: Expected expression at line 16:13 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:16:13
   |
16 |             )
   |             ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:25
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |         stack = list.new[String]()
  |                         ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-0.almd:8:51
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
8 |                 if list.contains(["(", "[", "{"], x) then
  |                                                   ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:9:21
  in variable stack
  hint: Check the variable name
  |
9 |                     stack + [x]
  |                     ^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-0.almd:9:30
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
9 |                     stack + [x]
  |                              ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:10:39
  in variable stack
  hint: Check the variable name
   |
10 |                 else if list.is_empty(stack) then
   |                                       ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:11:21
  in variable stack
  hint: Check the variable name
   |
11 |                     stack
   |                     ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:12:33
  in variable bracket_map
  hint: Check the variable name
   |
12 |                 else if map.get(bracket_map, x) == list.last(stack) then
   |                                 ^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-0.almd:12:46
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
   |
12 |                 else if map.get(bracket_map, x) == list.last(stack) then
   |                                              ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:12:62
  in variable stack
  hint: Check the variable name
   |
12 |                 else if map.get(bracket_map, x) == list.last(stack) then
   |                                                              ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:13:35
  in variable stack
  hint: Check the variable name
   |
13 |                     list.drop_end(stack, 1)
   |                                   ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:15:21
  in variable stack
  hint: Check the variable name
   |
15 |                     stack
   |                     ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:18:19
  in variable pairs
  hint: Check the variable name
   |
18 |     list.is_empty(pairs)
   |                   ^^^^^

15 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let 
        stack = []
        bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    in 
    list.is_empty(
        string.chars(s) 
            |> list.filter((x) => map.contains(bracket_map, x) or list.contains(["(", "[", "{"], x))
            |> list.fold(stack, (stack, x) => 
                if list.contains(["(", "[", "{"], x) then 
                    stack + [x]
                else if list.is_empty(stack) then 
                    [x]
                else if map.get(bracket_map, x) == list.last(stack) then 
                    list.drop_end(stack, 1)
                else 
                    stack + [x]
            )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 5:5 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:5:5
  |
5 |     in
  |     ^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:8:48
  in variable bracket_map
  hint: Check the variable name
  |
8 |             |> list.filter((x) => map.contains(bracket_map, x) or list.contains(["(", "[", "{"], x))
  |                                                ^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:9:26
  in variable stack
  hint: Check the variable name
  |
9 |             |> list.fold(stack, (stack, x) =>
  |                          ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:14:33
  in variable bracket_map
  hint: Check the variable name
   |
14 |                 else if map.get(bracket_map, x) == list.last(stack) then
   |                                 ^^^^^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    let 
        bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    in 
    list.is_empty(
        string.chars(s) 
            |> list.filter((x) => map.contains(bracket_map, x) or list.contains(["(", "[", "{"], x))
            |> list.fold([], (stack, x) => 
                if list.contains(["(", "[", "{"], x) then 
                    stack + [x]
                else if list.is_empty(stack) then 
                    [x]
                else if map.get(bracket_map, x) == list.last(stack) then 
                    list.drop_end(stack, 1)
                else 
                    stack + [x]
            )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 4:5 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:4:5
  |
4 |     in
  |     ^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:7:48
  in variable bracket_map
  hint: Check the variable name
  |
7 |             |> list.filter((x) => map.contains(bracket_map, x) or list.contains(["(", "[", "{"], x))
  |                                                ^^^^^^^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:13:33
  in variable bracket_map
  hint: Check the variable name
   |
13 |                 else if map.get(bracket_map, x) == list.last(stack) then
   |                                 ^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_balanced(s: String) -> Bool = 
    let bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    in list.is_empty(
        string.chars(s) 
            |> list.filter((x) => map.contains(bracket_map, x) or list.contains(["(", "[", "{"], x))
            |> list.fold([], (stack, x) => 
                if list.contains(["(", "[", "{"], x) then 
                    stack + [x]
                else if list.is_empty(stack) then 
                    [x]
                else if map.get_or(bracket_map, x, "") == list.last(stack) |> option.unwrap_or("") then 
                    list.drop_end(stack, 1)
                else 
                    stack + [x]
            )
    )
```
