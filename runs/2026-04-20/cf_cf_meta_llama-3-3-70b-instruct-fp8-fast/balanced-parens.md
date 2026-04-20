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
    matching_bracket = (x: String) => map.get(bracket_map, x)
  in 
    list.fold(string.chars(s), stack, (acc, ch) => 
      if ch == "(" || ch == "[" || ch == "{" then 
        acc + [ch]
      else if ch == ")" || ch == "]" || ch == "}" then 
        if list.is_empty(acc) then 
          list.new[String]()
        else if matching_bracket(list.last(acc)) == some(ch) then 
          list.drop_end(acc, 1)
        else 
          list.new[String]()
      else 
        acc
    ) |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:6:3
  |
6 |   in
  |   ^
error: '||' is not valid in Almide at line 8:20
  --> /tmp/dojo-balanced-parens-0.almd:8:20
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
8 |       if ch == "(" || ch == "[" || ch == "{" then
  |                    ^
error: Expected expression at line 10:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:10:7
   |
10 |       else if ch == ")" || ch == "]" || ch == "}" then
   |       ^
error: Expected expression at line 17:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:17:7
   |
17 |       else
   |       ^
error: Expected expression at line 19:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:19:5
   |
19 |     ) |> list.is_empty
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:5:47
  in variable bracket_map
  hint: Check the variable name
  |
5 |     matching_bracket = (x: String) => map.get(bracket_map, x)
  |                                               ^^^^^^^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:9:9
  in variable acc
  hint: Check the variable name
  |
9 |         acc + [ch]
  |         ^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:9:16
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
  |
9 |         acc + [ch]
  |                ^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:11:26
  in variable acc
  hint: Check the variable name
   |
11 |         if list.is_empty(acc) then
   |                          ^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:12:19
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
12 |           list.new[String]()
   |                   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:13:44
  in variable acc
  hint: Check the variable name
   |
13 |         else if matching_bracket(list.last(acc)) == some(ch) then
   |                                            ^^^
error[E002]: undefined function 'matching_bracket'
  --> /tmp/dojo-balanced-parens-0.almd:13:44
  in call to matching_bracket()
  hint: Check the function name
   |
13 |         else if matching_bracket(list.last(acc)) == some(ch) then
   |                                            ^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:13:58
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
13 |         else if matching_bracket(list.last(acc)) == some(ch) then
   |                                                          ^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:14:25
  in variable acc
  hint: Check the variable name
   |
14 |           list.drop_end(acc, 1)
   |                         ^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:16:19
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
16 |           list.new[String]()
   |                   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:18:9
  in variable acc
  hint: Check the variable name
   |
18 |         acc
   |         ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:18:9
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |         acc
   |         ^^^

19 error(s) found
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
    bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in 
    list.is_empty(list.fold(string.chars(s), stack, (acc, ch) => 
      if ch == "(" or ch == "[" or ch == "{" then 
        acc + [ch]
      else if ch == ")" or ch == "]" or ch == "}" then 
        if list.is_empty(acc) then 
          []
        else if map.get(bracket_map, list.last(acc)) == some(ch) then 
          list.drop_end(acc, 1)
        else 
          []
      else 
        acc
    ))
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:6:46
  in variable stack
  hint: Check the variable name
  |
6 |     list.is_empty(list.fold(string.chars(s), stack, (acc, ch) =>
  |                                              ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:12:25
  in variable bracket_map
  hint: Check the variable name
   |
12 |         else if map.get(bracket_map, list.last(acc)) == some(ch) then
   |                         ^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = []
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in 
    list.is_empty(list.fold(string.chars(s), stack, (acc, ch) => 
      if ch == "(" or ch == "[" or ch == "{" then 
        acc + [ch]
      else if ch == ")" or ch == "]" or ch == "}" then 
        if list.is_empty(acc) then 
          []
        else if map.get(bracket_map, list.last(acc)) == some(ch) then 
          list.drop_end(acc, 1)
        else 
          []
      else 
        acc
    ))
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error[E001]: type mismatch in call to map.get(): expected String but got Option[String]
  --> /tmp/dojo-balanced-parens-2.almd:11:48
  in call to map.get()
  hint: Fix the expression type or change the expected type
   |
11 |         else if map.get(bracket_map, list.last(acc)) == some(ch) then
   |                                                ^^^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = []
  let bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
  in 
    list.is_empty(list.fold(string.chars(s), stack, (acc, ch) => 
      if ch == "(" or ch == "[" or ch == "{" then 
        acc + [ch]
      else if ch == ")" or ch == "]" or ch == "}" then 
        if list.is_empty(acc) then 
          []
        else if option.unwrap_or(map.get(bracket_map, list.last(acc)), "") == ch then 
          list.drop_end(acc, 1)
        else 
          []
      else 
        acc
    ))
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error[E001]: type mismatch in call to map.get(): expected String but got Option[String]
  --> /tmp/dojo-balanced-parens-3.almd:11:65
  in call to map.get()
  hint: Fix the expression type or change the expected type
   |
11 |         else if option.unwrap_or(map.get(bracket_map, list.last(acc)), "") == ch then
   |                                                                 ^^^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
