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
        bracket_map = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
        bracket_stack = list.fold(string.chars(s), [], (stack, ch) => 
            if list.contains(["(", "[", "{"], ch) then 
                stack + [ch]
            else if list.contains([")", "]", "}"], ch) then 
                if list.is_empty(stack) then 
                    []
                else 
                    let 
                        last_bracket = list.last(stack) |> option.unwrap_or("")
                        expected_closing = map.get(bracket_map, last_bracket) |> option.unwrap_or("")
                    in 
                    if ch == expected_closing then 
                        list.drop_end(stack, 1)
                    else 
                        []
            else 
                stack
        )
    in 
    list.is_empty(bracket_stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:9
  |
2 |     let
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:11:21
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |                     let
   |                     ^^^
error: Expected expression at line 14:21 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:14:21
   |
14 |                     in
   |                     ^
error: Expected expression at line 19:13 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:19:13
   |
19 |             else
   |             ^
error: Expected expression at line 21:9 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:21:9
   |
21 |         )
   |         ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:12:50
  in variable stack
  hint: Check the variable name
   |
12 |                         last_bracket = list.last(stack) |> option.unwrap_or("")
   |                                                  ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:13:52
  in variable bracket_map
  hint: Check the variable name
   |
13 |                         expected_closing = map.get(bracket_map, last_bracket) |> option.unwrap_or("")
   |                                                    ^^^^^^^^^^^
error[E003]: undefined variable 'last_bracket'
  --> /tmp/dojo-balanced-parens-0.almd:13:65
  in variable last_bracket
  hint: Check the variable name
   |
13 |                         expected_closing = map.get(bracket_map, last_bracket) |> option.unwrap_or("")
   |                                                                 ^^^^^^^^^^^^
error[E003]: undefined variable 'ch'
  --> /tmp/dojo-balanced-parens-0.almd:15:24
  in variable ch
  hint: Did you mean `s`?
  try:
      // ch  →  s
      s
   |
15 |                     if ch == expected_closing then
   |                        ^^
error[E003]: undefined variable 'expected_closing'
  --> /tmp/dojo-balanced-parens-0.almd:15:30
  in variable expected_closing
  hint: Check the variable name
   |
15 |                     if ch == expected_closing then
   |                              ^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:16:39
  in variable stack
  hint: Check the variable name
   |
16 |                         list.drop_end(stack, 1)
   |                                       ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:20:17
  in variable stack
  hint: Check the variable name
   |
20 |                 stack
   |                 ^^^^^
error[E003]: undefined variable 'bracket_stack'
  --> /tmp/dojo-balanced-parens-0.almd:23:19
  in variable bracket_stack
  hint: Check the variable name
   |
23 |     list.is_empty(bracket_stack)
   |                   ^^^^^^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    list.is_empty(
        list.fold(
            string.chars(s), 
            [], 
            (stack, ch) => 
                if list.contains(["(", "[", "{"], ch) then 
                    stack + [ch]
                else if list.contains([")", "]", "}"], ch) then 
                    if list.is_empty(stack) then 
                        []
                    else 
                        let 
                            last_bracket = list.last(stack) |> option.unwrap_or("")
                            expected_closing = 
                                if last_bracket == "(" then 
                                    ")"
                                else if last_bracket == "[" then 
                                    "]"
                                else if last_bracket == "{" then 
                                    "}"
                                else 
                                    ""
                        in 
                        if ch == expected_closing then 
                            list.drop_end(stack, 1)
                        else 
                            []
                else 
                    stack
        )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:13:25
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |                         let
   |                         ^^^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
    list.is_empty(
        list.fold(
            string.chars(s), 
            [], 
            (stack, ch) => 
                if list.contains(["(", "[", "{"], ch) then 
                    stack + [ch]
                else if list.contains([")", "]", "}"], ch) then 
                    if list.is_empty(stack) then 
                        []
                    else 
                        {
                            let last_bracket = list.last(stack) |> option.unwrap_or("");
                            let expected_closing = 
                                if last_bracket == "(" then 
                                    ")"
                                else if last_bracket == "[" then 
                                    "]"
                                else if last_bracket == "{" then 
                                    "}"
                                else 
                                    "";
                            if ch == expected_closing then 
                                list.drop_end(stack, 1)
                            else 
                                []
                        }
                else 
                    stack
        )
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_balanced(s: String) -> Bool = 
    list.is_empty(
        list.fold(
            string.chars(s), 
            [], 
            (stack, ch) => 
                if list.contains(["(", "[", "{"], ch) then 
                    stack + [ch]
                else if list.contains([")", "]", "}"], ch) then 
                    if list.is_empty(stack) then 
                        [ch]
                    else 
                        {
                            let last_bracket = list.last(stack) |> option.unwrap_or("");
                            let expected_closing = 
                                if last_bracket == "(" then 
                                    ")"
                                else if last_bracket == "[" then 
                                    "]"
                                else if last_bracket == "{" then 
                                    "}"
                                else 
                                    "";
                            if ch == expected_closing then 
                                list.drop_end(stack, 1)
                            else 
                                [ch]
                        }
                else 
                    stack
        )
    )
```
