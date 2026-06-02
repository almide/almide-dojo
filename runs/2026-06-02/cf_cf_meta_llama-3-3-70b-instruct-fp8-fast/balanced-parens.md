# balanced-parens

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_pairs = [("(", ")"), ("[", "]"), ("{", "}")]
    bracket_map = list.fold(
      bracket_pairs, 
      map.new[String, String](), 
      (acc, (open, close)) => map.set(acc, open, close)
    )
    stack = list.fold(
      string.chars(s), 
      [], 
      (stack, ch) => 
        if list.any(bracket_pairs, (x) => x.0 == ch) then
          stack + [ch]
        else if list.any(bracket_pairs, (x) => x.1 == ch) then
          if list.is_empty(stack) || map.get(bracket_map, list.last(stack)) != some(ch) then
            []
          else
            list.drop_end(stack, 1)
        else
          stack
    )
  in
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  |
2 |   let
  |       ^
error: '||' is not valid in Almide at line 16:35
  --> /tmp/dojo-balanced-parens-0.almd:16:35
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
16 |           if list.is_empty(stack) || map.get(bracket_map, list.last(stack)) != some(ch) then
   |                                   ^
error: Expected expression at line 20:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:20:9
   |
20 |         else
   |         ^
error: Expected expression at line 22:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:22:5
   |
22 |     )
   |     ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:5:7
  in variable bracket_pairs
  hint: Check the variable name
  |
5 |       bracket_pairs,
  |       ^^^^^^^^^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-0.almd:7:50
  in variable close
  hint: Check the variable name
  |
7 |       (acc, (open, close)) => map.set(acc, open, close)
  |                                                  ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:19:27
  in variable stack
  hint: Check the variable name
   |
19 |             list.drop_end(stack, 1)
   |                           ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:21:11
  in variable stack
  hint: Check the variable name
   |
21 |           stack
   |           ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:24:17
  in variable stack
  hint: Check the variable name
   |
24 |   list.is_empty(stack)
   |                 ^^^^^

9 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    pairs = [("(", ")"), ("[", "]"), ("{", "}")]
    bracket_map = list.fold(
      pairs, 
      map.new[String, String](), 
      (acc, (open, close)) => map.set(acc, open, close)
    )
    stack = list.fold(
      string.chars(s), 
      list.new(), 
      (stack, ch) => 
        if list.any(pairs, (x) => x.0 == ch) then
          stack + [ch]
        else if list.any(pairs, (x) => x.1 == ch) then
          if list.is_empty(stack) or map.get(bracket_map, list.last(stack)) != some(ch) then
            list.new()
          else
            list.drop_end(stack, 1)
        else
          stack
    )
  in
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 23:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:23:3
   |
23 |   in
   |   ^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:5:7
  in variable pairs
  hint: Check the variable name
  |
5 |       pairs,
  |       ^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-1.almd:7:50
  in variable close
  hint: Check the variable name
  |
7 |       (acc, (open, close)) => map.set(acc, open, close)
  |                                                  ^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:11:15
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
11 |       list.new(),
   |               ^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:13:21
  in variable pairs
  hint: Check the variable name
   |
13 |         if list.any(pairs, (x) => x.0 == ch) then
   |                     ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:15:26
  in variable pairs
  hint: Check the variable name
   |
15 |         else if list.any(pairs, (x) => x.1 == ch) then
   |                          ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:16:46
  in variable bracket_map
  hint: Check the variable name
   |
16 |           if list.is_empty(stack) or map.get(bracket_map, list.last(stack)) != some(ch) then
   |                                              ^^^^^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:17:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
17 |             list.new()
   |                     ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:24:17
  in variable stack
  hint: Check the variable name
   |
24 |   list.is_empty(stack)
   |                 ^^^^^

10 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    pairs = [("(", ")"), ("[", "]"), ("{", "}")]
    bracket_map = list.fold(
      pairs, 
      map.new[String, String](), 
      (acc, (open, close)) => map.set(acc, open, close)
    )
    stack = list.fold(
      string.chars(s), 
      [], 
      (stack, ch) => 
        if list.any(
          pairs, 
          (x) => x.0 == ch
        ) then
          stack + [ch]
        else if list.any(
          pairs, 
          (x) => x.1 == ch
        ) then
          if list.is_empty(stack) or map.get(bracket_map, list.last(stack)) != some(ch) then
            []
          else
            list.drop_end(stack, 1)
        else
          stack
    )
  in
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 29:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:29:3
   |
29 |   in
   |   ^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:5:7
  in variable pairs
  hint: Check the variable name
  |
5 |       pairs,
  |       ^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-2.almd:7:50
  in variable close
  hint: Check the variable name
  |
7 |       (acc, (open, close)) => map.set(acc, open, close)
  |                                                  ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:14:11
  in variable pairs
  hint: Check the variable name
   |
14 |           pairs,
   |           ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:19:11
  in variable pairs
  hint: Check the variable name
   |
19 |           pairs,
   |           ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:22:46
  in variable bracket_map
  hint: Check the variable name
   |
22 |           if list.is_empty(stack) or map.get(bracket_map, list.last(stack)) != some(ch) then
   |                                              ^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:30:17
  in variable stack
  hint: Check the variable name
   |
30 |   list.is_empty(stack)
   |                 ^^^^^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let pairs = [("(", ")"), ("[", "]"), ("{", "}")]
  let bracket_map = list.fold(pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  let stack = list.fold(string.chars(s), [], (stack, ch) => 
    if list.any(pairs, (x) => x.0 == ch) then
      stack + [ch]
    else if list.any(pairs, (x) => x.1 == ch) then
      if list.is_empty(stack) or map.get(bracket_map, list.last(stack)) != some(ch) then
        []
      else
        list.drop_end(stack, 1)
    else
      stack
  )
  in list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-3.almd:3:108
  in variable close
  hint: Check the variable name
  |
3 |   let bracket_map = list.fold(pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  |                                                                                                            ^^^^^
error[E001]: type mismatch in call to map.get(): expected (String, String) but got Option[?11]
  --> /tmp/dojo-balanced-parens-3.almd:8:65
  in call to map.get()
  hint: Fix the expression type or change the expected type
  |
8 |       if list.is_empty(stack) or map.get(bracket_map, list.last(stack)) != some(ch) then
  |                                                                 ^^^^^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
