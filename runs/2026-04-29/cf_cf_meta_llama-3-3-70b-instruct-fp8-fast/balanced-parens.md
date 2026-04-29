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
    bracket_pairs = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    is_opening = (x) => map.contains(bracket_pairs, x)
    is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
    matches = (x, y) => 
      let 
        pair = map.get_or(bracket_pairs, x, none)
      in 
        option.is_some(pair) && option.unwrap_or(pair, "") == y
  in 
    list.fold(list.filter(string.chars(s), (x) => is_opening(x) || is_closing(x)), 
              stack, 
              (acc, x) => 
                if is_opening(x) then 
                  list.append(acc, [x])
                else 
                  if list.is_empty(acc) then 
                    list.new[String]()
                  else 
                    let 
                      top = list.last(acc) |> option.unwrap_or("")
                    in 
                      if matches(top, x) then 
                        list.drop_end(acc, 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  |
2 |   let
  |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:8:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let
  |       ^^^
error: Expected expression at line 10:7 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:10:7
   |
10 |       in
   |       ^
error: '&&' is not valid in Almide at line 11:30
  --> /tmp/dojo-balanced-parens-0.almd:11:30
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
11 |         option.is_some(pair) && option.unwrap_or(pair, "") == y
   |                              ^
error: '||' is not valid in Almide at line 13:65
  --> /tmp/dojo-balanced-parens-0.almd:13:65
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
13 |     list.fold(list.filter(string.chars(s), (x) => is_opening(x) || is_closing(x)),
   |                                                                 ^
error: Expected expression at line 14:20 (got Comma ',')
  --> /tmp/dojo-balanced-parens-0.almd:14:20
   |
14 |               stack,
   |                    ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:22:21
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |                     let
   |                     ^^^
error: Expected expression at line 24:21 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:24:21
   |
24 |                     in
   |                     ^
error: Expected ')' to close function call opened at line 26:38
  --> /tmp/dojo-balanced-parens-0.almd:28:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |                         list.drop_end(acc, 1
   |                                      --------------- '(' opened here
...
28 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   | ^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:5:38
  in variable bracket_pairs
  hint: Check the variable name
  |
5 |     is_opening = (x) => map.contains(bracket_pairs, x)
  |                                      ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:6:43
  in variable bracket_pairs
  hint: Check the variable name
  |
6 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                           ^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(A) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-balanced-parens-0.almd:6:68
  in call to list.map()
  hint: Fix the argument type
  |
6 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                                                    ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:9:27
  in variable bracket_pairs
  hint: Check the variable name
  |
9 |         pair = map.get_or(bracket_pairs, x, none)
  |                           ^^^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-0.almd:9:42
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
9 |         pair = map.get_or(bracket_pairs, x, none)
  |                                          ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-0.almd:14:15
  in variable stack
  hint: Check the variable name
   |
14 |               stack,
   |               ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:23:39
  in variable acc
  hint: Check the variable name
   |
23 |                       top = list.last(acc) |> option.unwrap_or("")
   |                                       ^^^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-balanced-parens-0.almd:6:68
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
6 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                                                    ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:23:64
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
23 |                       top = list.last(acc) |> option.unwrap_or("")
   |                                                                ^^

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
    bracket_pairs = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    is_opening = (x) => map.contains(bracket_pairs, x)
    is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
    matches = (x, y) => 
      let 
        pair = map.get_or(bracket_pairs, x, none)
      in 
        option.is_some(pair) and option.unwrap_or(pair, "") == y
  in 
    list.fold(string.chars(s), [], (acc, x) => 
      if is_opening(x) then 
        acc + [x]
      else 
        if list.is_empty(acc) then 
          []
        else 
          let 
            top = list.last(acc) |> option.unwrap_or("")
          in 
            if matches(top, x) then 
              list.drop(acc, 1)
            else 
              []
    ) |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  |
2 |   let
  |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let
  |       ^^^
error: Expected expression at line 9:7 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:9:7
  |
9 |       in
  |       ^
error: Expected expression at line 11:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:11:3
   |
11 |   in
   |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:19:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
19 |           let
   |           ^^^
error: Expected expression at line 21:11 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:21:11
   |
21 |           in
   |           ^
error: Expected expression at line 26:5 (got RParen ')')
  --> /tmp/dojo-balanced-parens-1.almd:26:5
   |
26 |     ) |> list.is_empty
   |     ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-1.almd:4:38
  in variable bracket_pairs
  hint: Check the variable name
  |
4 |     is_opening = (x) => map.contains(bracket_pairs, x)
  |                                      ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-1.almd:5:43
  in variable bracket_pairs
  hint: Check the variable name
  |
5 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                           ^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(A) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-balanced-parens-1.almd:5:68
  in call to list.map()
  hint: Fix the argument type
  |
5 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                                                    ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-1.almd:8:27
  in variable bracket_pairs
  hint: Check the variable name
  |
8 |         pair = map.get_or(bracket_pairs, x, none)
  |                           ^^^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-1.almd:8:42
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
8 |         pair = map.get_or(bracket_pairs, x, none)
  |                                          ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-1.almd:10:24
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                        ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-1.almd:10:51
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                                                   ^^^^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-balanced-parens-1.almd:10:64
  in variable y
  hint: Did you mean `s`?
  try:
      // y  →  s
      s
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                                                                ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:20:29
  in variable acc
  hint: Check the variable name
   |
20 |             top = list.last(acc) |> option.unwrap_or("")
   |                             ^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-1.almd:22:24
  in variable top
  hint: Check the variable name
   |
22 |             if matches(top, x) then
   |                        ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-1.almd:22:29
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
   |
22 |             if matches(top, x) then
   |                             ^
error[E002]: undefined function 'matches'
  --> /tmp/dojo-balanced-parens-1.almd:22:29
  in call to matches()
  hint: Check the function name
   |
22 |             if matches(top, x) then
   |                             ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:23:25
  in variable acc
  hint: Check the variable name
   |
23 |               list.drop(acc, 1)
   |                         ^^^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-balanced-parens-1.almd:5:68
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                                                    ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:25:15
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
25 |               []
   |               ^

22 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_pairs = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    is_opening = (x) => map.contains(bracket_pairs, x)
    is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
    matches = (x, y) => 
      let 
        pair = map.get_or(bracket_pairs, x, none)
      in 
        option.is_some(pair) and option.unwrap_or(pair, "") == y
  in 
    let 
      stack = list.fold(string.chars(s), [], (acc, x) => 
        if is_opening(x) then 
          acc + [x]
        else 
          if list.is_empty(acc) then 
            none
          else 
            let 
              top = list.last(acc) |> option.unwrap_or("")
            in 
              if matches(top, x) then 
                list.drop(acc, 1)
              else 
                none
      )
    in 
      option.is_none(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:7
  |
2 |   let
  |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let
  |       ^^^
error: Expected expression at line 9:7 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:9:7
  |
9 |       in
  |       ^
error: Expected expression at line 11:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:11:3
   |
11 |   in
   |   ^
error: Expected identifier at line 12:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:12:9
   |
12 |     let
   |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:20:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |             let
   |             ^^^
error: Expected expression at line 22:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:22:13
   |
22 |             in
   |             ^
error: Expected expression at line 27:7 (got RParen ')')
  --> /tmp/dojo-balanced-parens-2.almd:27:7
   |
27 |       )
   |       ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-2.almd:4:38
  in variable bracket_pairs
  hint: Check the variable name
  |
4 |     is_opening = (x) => map.contains(bracket_pairs, x)
  |                                      ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-2.almd:5:43
  in variable bracket_pairs
  hint: Check the variable name
  |
5 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                           ^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(A) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-balanced-parens-2.almd:5:68
  in call to list.map()
  hint: Fix the argument type
  |
5 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                                                    ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-2.almd:8:27
  in variable bracket_pairs
  hint: Check the variable name
  |
8 |         pair = map.get_or(bracket_pairs, x, none)
  |                           ^^^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-2.almd:8:42
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
8 |         pair = map.get_or(bracket_pairs, x, none)
  |                                          ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-2.almd:10:24
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                        ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-2.almd:10:51
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                                                   ^^^^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-balanced-parens-2.almd:10:64
  in variable y
  hint: Did you mean `s`?
  try:
      // y  →  s
      s
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                                                                ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:21:31
  in variable acc
  hint: Check the variable name
   |
21 |               top = list.last(acc) |> option.unwrap_or("")
   |                               ^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-2.almd:23:26
  in variable top
  hint: Check the variable name
   |
23 |               if matches(top, x) then
   |                          ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-2.almd:23:31
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
   |
23 |               if matches(top, x) then
   |                               ^
error[E002]: undefined function 'matches'
  --> /tmp/dojo-balanced-parens-2.almd:23:31
  in call to matches()
  hint: Check the function name
   |
23 |               if matches(top, x) then
   |                               ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:24:27
  in variable acc
  hint: Check the variable name
   |
24 |                 list.drop(acc, 1)
   |                           ^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:29:22
  in variable stack
  hint: Check the variable name
   |
29 |       option.is_none(stack)
   |                      ^^^^^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(?3, ?4) -> ?4
  --> /tmp/dojo-balanced-parens-2.almd:5:68
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k, v) => v), (y) => x == y)
  |                                                                    ^
error[E001]: type mismatch in if branches: expected List[?12] but got Option[?13]
  --> /tmp/dojo-balanced-parens-2.almd:26:17
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
26 |                 none
   |                 ^^^^

24 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    bracket_pairs = map.from_list([("(", ")"), ("[", "]"), ("{", "}")])
    is_opening = (x) => map.contains(bracket_pairs, x)
    is_closing = (x) => list.any(list.map(bracket_pairs, (k) => k.1), (y) => x == y)
    matches = (x, y) => 
      let 
        pair = map.get_or(bracket_pairs, x, none)
      in 
        option.is_some(pair) and option.unwrap_or(pair, "") == y
  in 
    let 
      stack = list.fold(string.chars(s), [], (acc, x) => 
        if is_opening(x) then 
          acc + [x]
        else 
          if list.is_empty(acc) then 
            none
          else 
            let 
              top = list.last(acc) |> option.unwrap_or("")
            in 
              if matches(top, x) then 
                list.drop_end(acc, 1)
              else 
                none
      )
    in 
      list.is_empty(stack |> option.unwrap_or([]))
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:2:7
  |
2 |   let
  |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let
  |       ^^^
error: Expected expression at line 9:7 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:9:7
  |
9 |       in
  |       ^
error: Expected expression at line 11:3 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:11:3
   |
11 |   in
   |   ^
error: Expected identifier at line 12:9 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:12:9
   |
12 |     let
   |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:20:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |             let
   |             ^^^
error: Expected expression at line 22:13 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:22:13
   |
22 |             in
   |             ^
error: Expected expression at line 27:7 (got RParen ')')
  --> /tmp/dojo-balanced-parens-3.almd:27:7
   |
27 |       )
   |       ^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-3.almd:4:38
  in variable bracket_pairs
  hint: Check the variable name
  |
4 |     is_opening = (x) => map.contains(bracket_pairs, x)
  |                                      ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-3.almd:5:43
  in variable bracket_pairs
  hint: Check the variable name
  |
5 |     is_closing = (x) => list.any(list.map(bracket_pairs, (k) => k.1), (y) => x == y)
  |                                           ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-3.almd:8:27
  in variable bracket_pairs
  hint: Check the variable name
  |
8 |         pair = map.get_or(bracket_pairs, x, none)
  |                           ^^^^^^^^^^^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-3.almd:8:42
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
8 |         pair = map.get_or(bracket_pairs, x, none)
  |                                          ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-3.almd:10:24
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                        ^^^^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-balanced-parens-3.almd:10:51
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                                                   ^^^^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-balanced-parens-3.almd:10:64
  in variable y
  hint: Did you mean `s`?
  try:
      // y  →  s
      s
   |
10 |         option.is_some(pair) and option.unwrap_or(pair, "") == y
   |                                                                ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:21:31
  in variable acc
  hint: Check the variable name
   |
21 |               top = list.last(acc) |> option.unwrap_or("")
   |                               ^^^
error[E003]: undefined variable 'top'
  --> /tmp/dojo-balanced-parens-3.almd:23:26
  in variable top
  hint: Check the variable name
   |
23 |               if matches(top, x) then
   |                          ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-balanced-parens-3.almd:23:31
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
   |
23 |               if matches(top, x) then
   |                               ^
error[E002]: undefined function 'matches'
  --> /tmp/dojo-balanced-parens-3.almd:23:31
  in call to matches()
  hint: Check the function name
   |
23 |               if matches(top, x) then
   |                               ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:24:31
  in variable acc
  hint: Check the variable name
   |
24 |                 list.drop_end(acc, 1)
   |                               ^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:29:21
  in variable stack
  hint: Check the variable name
   |
29 |       list.is_empty(stack |> option.unwrap_or([]))
   |                     ^^^^^
error[E001]: type mismatch in if branches: expected List[?10] but got Option[?11]
  --> /tmp/dojo-balanced-parens-3.almd:26:17
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
26 |                 none
   |                 ^^^^

22 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
