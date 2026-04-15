# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = []
    pairs = map.from_list([(")", "("), ("]", "["), ("}", "{")])
  in 
    string.chars(s).fold(true, (acc, c) => 
      if acc then 
        if list.find(["(", "[", "{"], (x) => x == c).is_some() then 
          stack + [c]
        else if list.find([")", "]", "}"], (x) => x == c).is_some() then 
          if stack.is_empty() then false 
          else if map.get(pairs, c).unwrap() == stack.last().unwrap() then 
            stack.drop_end(1)
          else false
        else stack
      else []
    ).is_empty()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:9:11
  in variable stack
  hint: Check the variable name
  |
9 |           stack + [c]
  |           ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:11:14
  in variable stack
  hint: Check the variable name
   |
11 |           if stack.is_empty() then false
   |              ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-0.almd:12:27
  in variable pairs
  hint: Check the variable name
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                           ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:12:49
  in variable stack
  hint: Check the variable name
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                                                 ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:13:13
  in variable stack
  hint: Check the variable name
   |
13 |             stack.drop_end(1)
   |             ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:15:14
  in variable stack
  hint: Check the variable name
   |
15 |         else stack
   |              ^^^^^
error[E001]: type mismatch in method call: expected Option[?6] but got fn() -> ?7
  --> /tmp/dojo-balanced-parens-0.almd:12:34
  in method call
  hint: Fix the expression type or change the expected type
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                                  ^
error[E001]: type mismatch in method call: expected Bool but got fn() -> Bool
  --> /tmp/dojo-balanced-parens-0.almd:6:18
  in method call
  hint: Fix the expression type or change the expected type
  |
6 |     string.chars(s).fold(true, (acc, c) =>
  |                  ^

10 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = ref []
    pairs = map.from_list([(")", "("), ("]", "["), ("}", "{")])
  in 
    string.chars(s).fold(true, (acc, c) => 
      if acc then 
        if list.find(["(", "[", "{"], (x) => x == c).is_some() then 
          stack := stack + [c]
        else if list.find([")", "]", "}"], (x) => x == c).is_some() then 
          if stack.is_empty() then false 
          else if map.get(pairs, c).unwrap() == stack.last().unwrap() then 
            stack := stack.drop_end(1)
          else false
        else stack
      else stack
    ).is_empty()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 3:18 (got RBracket ']')
  --> /tmp/dojo-balanced-parens-1.almd:3:18
  |
3 |     stack = ref []
  |                  ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:5:3
  |
5 |   in
  |   ^
error: Expected ')' to close function call opened at line 6:25
  --> /tmp/dojo-balanced-parens-1.almd:9:17
  hint: Add ')' or check for a missing delimiter inside the function call
  |
6 |     string.chars(s).fold(true, (acc, c) =>
  |                         --------------- '(' opened here
...
9 |           stack := stack + [c]
  |                 ^
error: Expected ')' to close function call opened at line 6:25 at line 9:17
  --> /tmp/dojo-balanced-parens-1.almd:6:25
  |
6 |     string.chars(s).fold(true, (acc, c) =>
  |                         ^
error: Expected expression at line 13:19 (got Colon ':')
  --> /tmp/dojo-balanced-parens-1.almd:13:19
   |
13 |             stack := stack.drop_end(1)
   |                   ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:11:14
  in variable stack
  hint: Check the variable name
   |
11 |           if stack.is_empty() then false
   |              ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:12:27
  in variable pairs
  hint: Check the variable name
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                           ^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:12:34
  in variable c
  hint: Check the variable name
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                                  ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:12:49
  in variable stack
  hint: Check the variable name
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                                                 ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:13:13
  in variable stack
  hint: Check the variable name
   |
13 |             stack := stack.drop_end(1)
   |             ^^^^^
error[E001]: type mismatch in method call: expected Option[?2] but got fn() -> ?3
  --> /tmp/dojo-balanced-parens-1.almd:12:34
  in method call
  hint: Fix the expression type or change the expected type
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                                  ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:12:16
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
   |
12 |           else if map.get(pairs, c).unwrap() == stack.last().unwrap() then
   |                ^^

13 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  string.chars(s).fold((true, []), (acc, c) => 
    if acc.0 then 
      if list.find(["(", "[", "{"], (x) => x == c).is_some() then 
        (true, acc.1 + [c])
      else if list.find([")", "]", "}"], (x) => x == c).is_some() then 
        if acc.1.is_empty() then (false, acc.1) 
        else if map.from_list([(")", "("), ("]", "["), ("}", "{")]).get(c).unwrap() == acc.1.last().unwrap() then 
          (true, acc.1.drop_end(1))
        else (false, acc.1)
      else (true, acc.1)
    else (false, acc.1)
  ).0
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error[E001]: type mismatch in method call: expected Option[String] but got fn() -> ?6
  --> /tmp/dojo-balanced-parens-2.almd:8:62
  in method call
  hint: Fix the expression type or change the expected type
  |
8 |         else if map.from_list([(")", "("), ("]", "["), ("}", "{")]).get(c).unwrap() == acc.1.last().unwrap() then
  |                                                              ^^^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  string.chars(s).fold((true, []), (acc, c) => 
    if acc.0 then 
      if list.find(["(", "[", "{"], (x) => x == c).is_some() then 
        (true, acc.1 + [c])
      else if list.find([")", "]", "}"], (x) => x == c).is_some() then 
        if acc.1.is_empty() then (false, acc.1) 
        else if map.from_list([(")", "("), ("]", "["), ("}", "{")]).get(c).is_some() && map.from_list([(")", "("), ("]", "["), ("}", "{")]).get(c).unwrap() == acc.1.last().unwrap() then 
          (true, acc.1.drop_end(1))
        else (false, acc.1)
      else (true, acc.1)
    else (false, acc.1)
  ).0
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: '&&' is not valid in Almide at line 8:86
  --> /tmp/dojo-balanced-parens-3.almd:8:86
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
8 |         else if map.from_list([(")", "("), ("]", "["), ("}", "{")]).get(c).is_some() && map.from_list([(")", "("), ("]", "["), ("}", "{")]).get(c).unwrap() == acc.1.last().unwrap() then
  |                                                                                      ^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:15:47
  in call to is_balanced()
  hint: Check the function name
   |
15 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   |                                               ^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:16:55
  in call to is_balanced()
  hint: Check the function name
   |
16 | test "balanced simple parens" { assert_eq(is_balanced("()"), true) }
   |                                                       ^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:17:48
  in call to is_balanced()
  hint: Check the function name
   |
17 | test "balanced nested" { assert_eq(is_balanced("([{}])"), true) }
   |                                                ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:18:52
  in call to is_balanced()
  hint: Check the function name
   |
18 | test "balanced sequential" { assert_eq(is_balanced("()[]{}"), true) }
   |                                                    ^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:19:51
  in call to is_balanced()
  hint: Check the function name
   |
19 | test "balanced with text" { assert_eq(is_balanced("fn foo(x: Int) -> { x }"), true) }
   |                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:20:49
  in call to is_balanced()
  hint: Check the function name
   |
20 | test "unbalanced cross" { assert_eq(is_balanced("([)]"), false) }
   |                                                 ^^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:21:48
  in call to is_balanced()
  hint: Check the function name
   |
21 | test "unbalanced open" { assert_eq(is_balanced("("), false) }
   |                                                ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:22:49
  in call to is_balanced()
  hint: Check the function name
   |
22 | test "unbalanced close" { assert_eq(is_balanced(")"), false) }
   |                                                 ^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:23:55
  in call to is_balanced()
  hint: Check the function name
   |
23 | test "unbalanced extra close" { assert_eq(is_balanced("())"), false) }
   |                                                       ^^^^^
error[E002]: undefined function 'is_balanced'
  --> /tmp/dojo-balanced-parens-3.almd:24:52
  in call to is_balanced()
  hint: Check the function name
   |
24 | test "unbalanced mismatch" { assert_eq(is_balanced("(]"), false) }
   |                                                    ^^^^

11 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
