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
    bracket_map = 
      list.fold(
        bracket_pairs, 
        map.new[String, String](), 
        (acc, (open, close)) => map.set(acc, open, close)
      )
    is_opening_bracket = (ch) => 
      list.any(
        bracket_pairs, 
        (pair) => pair.0 == ch
      )
    is_closing_bracket = (ch) => 
      list.any(
        bracket_pairs, 
        (pair) => pair.1 == ch
      )
    is_match = (open, close) => 
      map.get_or(bracket_map, open, "") == close
    stack = 
      list.fold(
        string.chars(s), 
        list.new(), 
        (acc, ch) => 
          if is_opening_bracket(ch) then 
            acc + [ch]
          else if is_closing_bracket(ch) then 
            if list.is_empty(acc) then 
              list.new()
            else if is_match(list.last(acc), ch) then 
              list
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected ')' to close function call opened at line 23:16
  --> /tmp/dojo-balanced-parens-0.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
23 |       list.fold(
   |                --------------- '(' opened here
...
35 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   | ^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:6:9
  in variable bracket_pairs
  hint: Check the variable name
  |
6 |         bracket_pairs,
  |         ^^^^^^^^^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-0.almd:8:52
  in variable close
  hint: Check the variable name
  |
8 |         (acc, (open, close)) => map.set(acc, open, close)
  |                                                    ^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:12:9
  in variable bracket_pairs
  hint: Check the variable name
   |
12 |         bracket_pairs,
   |         ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_pairs'
  --> /tmp/dojo-balanced-parens-0.almd:17:9
  in variable bracket_pairs
  hint: Check the variable name
   |
17 |         bracket_pairs,
   |         ^^^^^^^^^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-0.almd:21:18
  in variable bracket_map
  hint: Check the variable name
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                  ^^^^^^^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:21:44
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                                            ^^^^^

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
    bracket_map = 
      list.fold(
        pairs, 
        map.new[String, String](), 
        (acc, (open, close)) => map.set(acc, open, close)
      )
    is_opening_bracket = (ch) => 
      list.any(
        pairs, 
        (pair) => pair.0 == ch
      )
    is_closing_bracket = (ch) => 
      list.any(
        pairs, 
        (pair) => pair.1 == ch
      )
    is_match = (open, close) => 
      map.get_or(bracket_map, open, "") == close
    stack = 
      list.fold(
        string.chars(s), 
        list.new(), 
        (acc, ch) => 
          if is_opening_bracket(ch) then 
            acc + [ch]
          else if is_closing_bracket(ch) then 
            if list.is_empty(acc) then 
              list.new()
            else if is_match(list.last(acc), ch) then 
              list.drop_end(acc, 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected ')' to close function call opened at line 23:16
  --> /tmp/dojo-balanced-parens-1.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
23 |       list.fold(
   |                --------------- '(' opened here
...
35 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   | ^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:6:9
  in variable pairs
  hint: Check the variable name
  |
6 |         pairs,
  |         ^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-1.almd:8:52
  in variable close
  hint: Check the variable name
  |
8 |         (acc, (open, close)) => map.set(acc, open, close)
  |                                                    ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:12:9
  in variable pairs
  hint: Check the variable name
   |
12 |         pairs,
   |         ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-1.almd:17:9
  in variable pairs
  hint: Check the variable name
   |
17 |         pairs,
   |         ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-1.almd:21:18
  in variable bracket_map
  hint: Check the variable name
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                  ^^^^^^^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:21:44
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                                            ^^^^^

8 error(s) found
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
    bracket_map = 
      list.fold(
        pairs, 
        map.new[String, String](), 
        (acc, (open, close)) => map.set(acc, open, close)
      )
    is_opening_bracket = (ch) => 
      list.any(
        pairs, 
        (pair) => pair.0 == ch
      )
    is_closing_bracket = (ch) => 
      list.any(
        pairs, 
        (pair) => pair.1 == ch
      )
    is_match = (open, close) => 
      map.get_or(bracket_map, open, "") == close
    stack = 
      list.fold(
        string.chars(s), 
        list.new(), 
        (acc, ch) => 
          if is_opening_bracket(ch) then 
            acc + [ch]
          else if is_closing_bracket(ch) then 
            if list.is_empty(acc) then 
              list.new()
            else if is_match(list.last(acc), ch) then 
              list.drop_end(acc, 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:7
  |
2 |   let
  |       ^
error: Expected ')' to close function call opened at line 23:16
  --> /tmp/dojo-balanced-parens-2.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
23 |       list.fold(
   |                --------------- '(' opened here
...
35 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   | ^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:6:9
  in variable pairs
  hint: Check the variable name
  |
6 |         pairs,
  |         ^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-2.almd:8:52
  in variable close
  hint: Check the variable name
  |
8 |         (acc, (open, close)) => map.set(acc, open, close)
  |                                                    ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:12:9
  in variable pairs
  hint: Check the variable name
   |
12 |         pairs,
   |         ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-2.almd:17:9
  in variable pairs
  hint: Check the variable name
   |
17 |         pairs,
   |         ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-2.almd:21:18
  in variable bracket_map
  hint: Check the variable name
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                  ^^^^^^^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:21:44
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                                            ^^^^^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    pairs = [("(", ")"), ("[", "]"), ("{", "}")]
    bracket_map = 
      list.fold(
        pairs, 
        map.new[String, String](), 
        (acc, (open, close)) => map.set(acc, open, close)
      )
    is_opening_bracket = (ch) => 
      list.any(
        pairs, 
        (pair) => pair.0 == ch
      )
    is_closing_bracket = (ch) => 
      list.any(
        pairs, 
        (pair) => pair.1 == ch
      )
    is_match = (open, close) => 
      map.get_or(bracket_map, open, "") == close
    stack = 
      list.fold(
        string.chars(s), 
        list.new(), 
        (acc, ch) => 
          if is_opening_bracket(ch) then 
            acc + [ch]
          else if is_closing_bracket(ch) then 
            if list.is_empty(acc) then 
              list.new()
            else if is_match(list.last(acc), ch) then 
              list.drop_end(acc, 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:2:7
  |
2 |   let
  |       ^
error: Expected ')' to close function call opened at line 23:16
  --> /tmp/dojo-balanced-parens-3.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
23 |       list.fold(
   |                --------------- '(' opened here
...
35 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   | ^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-3.almd:6:9
  in variable pairs
  hint: Check the variable name
  |
6 |         pairs,
  |         ^^^^^
error[E003]: undefined variable 'close'
  --> /tmp/dojo-balanced-parens-3.almd:8:52
  in variable close
  hint: Check the variable name
  |
8 |         (acc, (open, close)) => map.set(acc, open, close)
  |                                                    ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-3.almd:12:9
  in variable pairs
  hint: Check the variable name
   |
12 |         pairs,
   |         ^^^^^
error[E003]: undefined variable 'pairs'
  --> /tmp/dojo-balanced-parens-3.almd:17:9
  in variable pairs
  hint: Check the variable name
   |
17 |         pairs,
   |         ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-3.almd:21:18
  in variable bracket_map
  hint: Check the variable name
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                  ^^^^^^^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:21:44
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |       map.get_or(bracket_map, open, "") == close
   |                                            ^^^^^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
