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
    bracket_pairs = [("(", ")"), ("[", "]"), ("{", "}")]
    bracket_map = list.fold(bracket_pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
    stack = list.fold(string.chars(s), [], (acc, ch) => 
      if list.any(bracket_pairs, (x) => x.0 == ch) then 
        acc + [ch] 
      else if list.any(bracket_pairs, (x) => x.1 == ch) then 
        if list.is_empty(acc) then 
          []
        else if map.get(bracket_map, list.last(acc)) == some(ch) then 
          list.drop_end(acc, 1)
        else 
          []
      else 
        acc)
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
error: Expected expression at line 17:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:17:3
   |
17 |   in
   |   ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:4:29
  in variable bracket_pairs
  hint: Check the variable name
  |
4 |     bracket_map = list.fold(bracket_pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  |                             ^^^^^^^^^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-0.almd:4:114
  in variable close
  hint: Check the variable name
  |
4 |     bracket_map = list.fold(bracket_pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  |                                                                                                                  ^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:6:19
  in variable bracket_pairs
  hint: Check the variable name
  |
6 |       if list.any(bracket_pairs, (x) => x.0 == ch) then
  |                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:8:24
  in variable bracket_pairs
  hint: Check the variable name
  |
8 |       else if list.any(bracket_pairs, (x) => x.1 == ch) then
  |                        ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:11:25
  in variable bracket_map
  hint: Check the variable name
   |
11 |         else if map.get(bracket_map, list.last(acc)) == some(ch) then
   |                         ^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:18:17
  in variable stack
  hint: Check the variable name
   |
18 |   list.is_empty(stack)
   |                 ^^^^^

8 error(s) found
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
    bracket_map = list.fold(pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
    stack = list.fold(string.chars(s), [], (acc, ch) => 
      if list.any(pairs, (x) => x.0 == ch) then 
        acc + [ch] 
      else if list.any(pairs, (x) => x.1 == ch) then 
        if list.is_empty(acc) then 
          []
        else if map.get(bracket_map, list.last(acc)) == some(ch) then 
          list.drop_end(acc, 1)
        else 
          []
      else 
        acc)
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
error: Expected expression at line 17:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:17:3
   |
17 |   in
   |   ^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:4:29
  in variable pairs
  hint: Check the variable name
  |
4 |     bracket_map = list.fold(pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  |                             ^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-1.almd:4:106
  in variable close
  hint: Check the variable name
  |
4 |     bracket_map = list.fold(pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  |                                                                                                          ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:6:19
  in variable pairs
  hint: Check the variable name
  |
6 |       if list.any(pairs, (x) => x.0 == ch) then
  |                   ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:8:24
  in variable pairs
  hint: Check the variable name
  |
8 |       else if list.any(pairs, (x) => x.1 == ch) then
  |                        ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:11:25
  in variable bracket_map
  hint: Check the variable name
   |
11 |         else if map.get(bracket_map, list.last(acc)) == some(ch) then
   |                         ^^^^^^^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:18:17
  in variable stack
  hint: Check the variable name
   |
18 |   list.is_empty(stack)
   |                 ^^^^^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let pairs = [("(", ")"), ("[", "]"), ("{", "}")]
  in let bracket_map = list.fold(pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  in let stack = list.fold(string.chars(s), [], (acc, ch) => 
    if list.any(pairs, (x) => x.0 == ch) then 
      acc + [ch] 
    else if list.any(pairs, (x) => x.1 == ch) then 
      if list.is_empty(acc) then 
        []
      else if map.get(bracket_map, list.last(acc)) == some(ch) then 
        list.drop_end(acc, 1)
      else 
        []
    else 
      acc)
  in list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-2.almd:3:108
  in variable close
  hint: Check the variable name
  |
3 |   let bracket_map = list.fold(pairs, map.new[String, String](), (acc, (open, close)) => map.set(acc, open, close))
  |                                                                                                            ^^^^^
error[E001]: type mismatch in call to map.get(): expected (String, String) but got Option[?12]
  --> /tmp/dojo-balanced-parens-2.almd:10:46
  in call to map.get()
  hint: Fix the expression type or change the expected type
   |
10 |       else if map.get(bracket_map, list.last(acc)) == some(ch) then
   |                                              ^^^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let pairs = [("(", ")"), ("[", "]"), ("{", "}")]
  in let bracket_map = list.fold(pairs, map.new[String, String](), (acc, pair) => map.set(acc, pair.0, pair.1))
  in let stack = list.fold(string.chars(s), [], (acc, ch) => 
    if list.any(pairs, (x) => x.0 == ch) then 
      acc + [ch] 
    else if list.any(pairs, (x) => x.1 == ch) then 
      if list.is_empty(acc) then 
        []
      else 
        let last = list.last(acc) |> option.unwrap_or("")
        in if map.get(bracket_map, last) == some(ch) then 
          list.drop_end(acc, 1)
        else 
          []
    else 
      acc)
  in list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:11:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |         let last = list.last(acc) |> option.unwrap_or("")
   |         ^^^
error: Expected expression at line 14:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:14:9
   |
14 |         else
   |         ^
error: Expected expression at line 17:10 (got RParen ')')
  --> /tmp/dojo-balanced-parens-3.almd:17:10
   |
17 |       acc)
   |          ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:13:25
  in variable acc
  hint: Check the variable name
   |
13 |           list.drop_end(acc, 1)
   |                         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:17:7
  in variable acc
  hint: Check the variable name
   |
17 |       acc)
   |       ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:17:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
17 |       acc)
   |       ^^^

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
