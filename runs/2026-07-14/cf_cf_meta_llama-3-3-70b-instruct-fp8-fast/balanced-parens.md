# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = list.new[String]()
    bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    pairs = string.chars(s) 
      |> list.filter((x) => list.contains(["(", ")", "[", "]", "{", "}"], x))
      |> list.fold([], (acc, x) => 
        if list.contains(["(", "[", "{"], x) then 
          acc + [x]
        else if list.is_empty(acc) then 
          acc
        else if map.get(bracket_map, x) == list.last(acc) then 
          list.drop_end(acc, 1)
        else 
          acc
      )
  in 
  list.is_empty(pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 17:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:17:3
   |
17 |   in
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:12:25
  in variable bracket_map
  hint: Check the variable name
   |
12 |         else if map.get(bracket_map, x) == list.last(acc) then
   |                         ^^^^^^^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:18:17
  in variable pairs
  hint: Check the variable name
   |
18 |   list.is_empty(pairs)
   |                 ^^^^^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    chars = string.chars(s) 
      |> list.filter((x) => list.contains(["(", ")", "[", "]", "{", "}"], x))
  in 
  list.fold(chars, [], (acc, x) => 
    if list.contains(["(", "[", "{"], x) then 
      acc + [x]
    else if list.is_empty(acc) then 
      acc + [x]
    else if map.get(bracket_map, x) == list.last(acc) then 
      list.drop_end(acc, 1)
    else 
      acc + [x]
  )
  |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-balanced-parens-1.almd:7:13
  in variable chars
  hint: Check the variable name
  |
7 |   list.fold(chars, [], (acc, x) =>
  |             ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:12:21
  in variable bracket_map
  hint: Check the variable name
   |
12 |     else if map.get(bracket_map, x) == list.last(acc) then
   |                     ^^^^^^^^^^^

4 error(s) found
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
    chars = string.chars(s) 
      |> list.filter((x) => list.contains(["(", ")", "[", "]", "{", "}"], x))
  in 
  list.is_empty(list.fold(chars, [], (acc, x) => 
    if list.contains(["(", "[", "{"], x) then 
      acc + [x]
    else if list.is_empty(acc) then 
      acc + [x]
    else if map.get(bracket_map, x) == list.last(acc) then 
      list.drop_end(acc, 1)
    else 
      acc + [x]
  ))
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-balanced-parens-2.almd:7:27
  in variable chars
  hint: Check the variable name
  |
7 |   list.is_empty(list.fold(chars, [], (acc, x) =>
  |                           ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:12:21
  in variable bracket_map
  hint: Check the variable name
   |
12 |     else if map.get(bracket_map, x) == list.last(acc) then
   |                     ^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_map = map.from_list([(")", "("), ("]", "["), ("}", "{")])
    chars = string.chars(s) 
      |> list.filter((x) => list.contains(["(", ")", "[", "]", "{", "}"], x))
  in 
  list.is_empty(list.fold(chars, [], (acc, x) => 
    if list.contains(["(", "[", "{"], x) then 
      acc + [x]
    else if list.is_empty(acc) then 
      acc + [x]
    else if map.get(bracket_map, x) == list.last(acc) then 
      list.drop_end(acc, 1)
    else 
      acc + [x]
  ))
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-balanced-parens-3.almd:7:27
  in variable chars
  hint: Check the variable name
  |
7 |   list.is_empty(list.fold(chars, [], (acc, x) =>
  |                           ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-3.almd:12:21
  in variable bracket_map
  hint: Check the variable name
   |
12 |     else if map.get(bracket_map, x) == list.last(acc) then
   |                     ^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
