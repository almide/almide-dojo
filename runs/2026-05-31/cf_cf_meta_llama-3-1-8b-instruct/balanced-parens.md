# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  let chars = string.chars(s) in 
  list.fold(chars, stack, (acc, c) => 
    if string.is někter(c) then 
      match c {
        '(' => list.push(acc, ")"),
        '[' => list.push(acc, "]"),
        '{' => list.push(acc, "}"),
        _ => acc
      }
    else if list.is_empty(acc) then 
      acc 
    else 
      match list.last(acc) {
        '(' => if c != ")" then list.drop_end(acc, 1) else list.drop_end(acc, 1),
        '[' => if c != "]" then list.drop_end(acc, 1) else list.drop_end(acc, 1),
        '{' => if c != "}" then list.drop_end(acc, 1) else list.drop_end(acc, 1),
        _ => acc
      }
  ) == stack then true else false
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected Then at line 5:18 (got Ident 'n')
  --> /tmp/dojo-balanced-parens-0.almd:5:18
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if string.is někter(c) then
  |                  ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:3:28
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
3 |   let chars = string.chars(s)
  |                            ^

3 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  let chars = string.chars(s) in 
  list.fold(chars, stack, (acc, c) => 
    if string.is_digit(c) then 
      match c {
        '(' => stack + [")"],
        '[' => stack + ["]"],
        '{' => stack + ["}"],
        _ => acc
      }
    else if list.is_empty(acc) then 
      acc 
    else 
      match list.last(acc) {
        '(' => if c != ")" then list.drop_end(acc, 1) else list.drop_end(acc, 1),
        '[' => if c != "]" then list.drop_end(acc, 1) else list.drop_end(acc, 1),
        '{' => if c != "}" then list.drop_end(acc, 1) else list.drop_end(acc, 1),
        _ => acc
      }
  ) == stack then true else false
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected expression at line 21:14 (got Then 'then')
  --> /tmp/dojo-balanced-parens-1.almd:21:14
   |
21 |   ) == stack then true else false
   |              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:21:8
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |   ) == stack then true else false
   |        ^^^^^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  let chars = string.chars(s) in 
  list.fold(chars, stack, (acc, c) => 
    if string.is_digit(c) then 
      match c {
        '(' => acc + [")"],
        '[' => acc + ["]"],
        '{' => acc + ["}"],
        _ => acc
      }
    else if list.is_empty(acc) then 
      acc 
    else 
      match list.last(acc) {
        '(' => if c != ")" then list.drop_end(acc, 1) else acc,
        '[' => if c != "]" then list.drop_end(acc, 1) else acc,
        '{' => if c != "}" then list.drop_end(acc, 1) else acc,
        _ => acc
      }
  ) == [] then true else false
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected expression at line 21:11 (got Then 'then')
  --> /tmp/dojo-balanced-parens-2.almd:21:11
   |
21 |   ) == [] then true else false
   |           ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:21:8
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |   ) == [] then true else false
   |        ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  let chars = string.chars(s) in 
  list.fold(chars, stack, (acc, c) => 
    if string.is_digit(c) then 
      match c {
        '(' => acc + [")"],
        '[' => acc + ["]"],
        '{' => acc + ["}"],
        _ => acc
      }
    else if list.is_empty(acc) then 
      acc 
    else 
      match list.last(acc) {
        '(' => if c != ")" then list.drop_end(acc, 1) else acc,
        '[' => if c != "]" then list.drop_end(acc, 1) else acc,
        '{' => if c != "}" then list.drop_end(acc, 1) else acc,
        _ => acc
      }
  ) == [] then true else false
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected expression at line 21:11 (got Then 'then')
  --> /tmp/dojo-balanced-parens-3.almd:21:11
   |
21 |   ) == [] then true else false
   |           ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:21:8
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
21 |   ) == [] then true else false
   |        ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
