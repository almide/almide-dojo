# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let
    stack = list.new[String]()
    chars = string.chars(s)
    pairs = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    is_opening = (x) => option.is_some(map.get(pairs, x))
    is_closing = (x) => option.is_some(map.get_or(pairs, x, none))
    is_match = (x, y) => option.unwrap_or_else(map.get(pairs, x), (z) => z == y)
    reduce = list.fold(chars, stack, (acc, x) => 
      if is_opening(x) then 
        list.append(acc, [x])
      else if is_closing(x) then 
        if list.is_empty(acc) then 
          list.new[String]()
        else 
          let 
            top = list.last(acc)
            rest = list.drop_end(acc, 1)
          in 
            if is_match(option.unwrap_or(top, ""), x) then 
              rest 
            else 
              list.new[String]()
      else 
        acc
    )
  in 
    list.is_empty(reduce)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:6
  |
2 |   let
  |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:16:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
16 |           let
   |           ^^^
error: Expected expression at line 19:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:19:11
   |
19 |           in
   |           ^
error: Expected expression at line 24:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:24:7
   |
24 |       else
   |       ^
error: Expected expression at line 26:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:26:5
   |
26 |     )
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:6:48
  in variable pairs
  hint: Check the variable name
  |
6 |     is_opening = (x) => option.is_some(map.get(pairs, x))
  |                                                ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:7:51
  in variable pairs
  hint: Check the variable name
  |
7 |     is_closing = (x) => option.is_some(map.get_or(pairs, x, none))
  |                                                   ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:8:56
  in variable pairs
  hint: Check the variable name
  |
8 |     is_match = (x, y) => option.unwrap_or_else(map.get(pairs, x), (z) => z == y)
  |                                                        ^^^^^
error[E005]: argument 'f' expects fn() -> ?6 but got fn(?7) -> Bool
  --> /tmp/dojo-balanced-parens-0.almd:8:79
  in call to option.unwrap_or_else()
  hint: Fix the argument type
   |
16 |           let
   | --------------------------------------- fn option.unwrap_or_else() defined here
...
8 |     is_match = (x, y) => option.unwrap_or_else(map.get(pairs, x), (z) => z == y)
  |                                                                               ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:17:29
  in variable acc
  hint: Check the variable name
   |
17 |             top = list.last(acc)
   |                             ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:18:34
  in variable acc
  hint: Check the variable name
   |
18 |             rest = list.drop_end(acc, 1)
   |                                  ^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-0.almd:20:42
  in variable top
  hint: Check the variable name
   |
20 |             if is_match(option.unwrap_or(top, ""), x) then
   |                                          ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-0.almd:20:52
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
   |
20 |             if is_match(option.unwrap_or(top, ""), x) then
   |                                                    ^
error[E002]: undefined function 'is_match'
  --> /tmp/dojo-balanced-parens-0.almd:20:52
  in call to is_match()
  hint: Check the function name
   |
20 |             if is_match(option.unwrap_or(top, ""), x) then
   |                                                    ^
error[E003]: undefined variable 'rest'
  --> /tmp/dojo-balanced-parens-0.almd:21:15
  in variable rest
  hint: Check the variable name
   |
21 |               rest
   |               ^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:23:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
23 |               list.new[String]()
   |                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:25:9
  in variable acc
  hint: Check the variable name
   |
25 |         acc
   |         ^^^
error[E003]: undefined variable 'reduce'
  --> /tmp/dojo-balanced-parens-0.almd:28:19
  in variable reduce
  hint: Check the variable name
   |
28 |     list.is_empty(reduce)
   |                   ^^^^^^
error[E001]: type mismatch in call to option.unwrap_or_else(): expected fn() -> ?6 but got fn(?7) -> Bool
  --> /tmp/dojo-balanced-parens-0.almd:8:79
  in call to option.unwrap_or_else()
  hint: Fix the expression type or change the expected type
  |
8 |     is_match = (x, y) => option.unwrap_or_else(map.get(pairs, x), (z) => z == y)
  |                                                                               ^

20 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_balanced(s: String) -> Bool = 
  list.is_empty(
    list.fold(
      string.chars(s), 
      [], 
      (acc, x) => 
        if x == "(" then 
          acc + ["("]
        else if x == ")" then 
          if list.is_empty(acc) then 
            ["("]
          else 
            if list.last(acc) == some("(") then 
              list.drop_end(acc, 1)
            else 
              ["("]
        else if x == "[" then 
          acc + ["["]
        else if x == "]" then 
          if list.is_empty(acc) then 
            ["["]
          else 
            if list.last(acc) == some("[") then 
              list.drop_end(acc, 1)
            else 
              ["["]
        else if x == "{" then 
          acc + ["{"]
        else if x == "}" then 
          if list.is_empty(acc) then 
            ["{"]
          else 
            if list.last(acc) == some("{") then 
              list.drop_end(acc, 1)
            else 
              ["{"]
        else 
          acc
    )
  )
```
