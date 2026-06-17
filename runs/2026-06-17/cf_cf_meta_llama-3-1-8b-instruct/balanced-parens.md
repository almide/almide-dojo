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
  list.fold(string.chars(s), stack, (stack, c) => 
    if string.is_one_of(c, "(" | "[" | "{") then 
      list.push(stack, c) 
    else if string.is_one_of(c, ")" | "]" | "}") then 
      match list.last(stack) with 
        | some("(") when c == ")" -> list.drop_end(stack, 1)
        | some("[") when c == "]" -> list.drop_end(stack, 1)
        | some("{") when c == "}" -> list.drop_end(stack, 1)
        | _ -> none 
    else 
      stack) == list.new[String]()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected ')' to close function call opened at line 4:24
  --> /tmp/dojo-balanced-parens-0.almd:4:32
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                        --------------- '(' opened here
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                                ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:6:5
  |
6 |     else if string.is_one_of(c, ")" | "]" | "}") then
  |     ^
error: Expected LBrace at line 7:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:7:30
  |
7 |       match list.last(stack) with
  |                              ^
error: Expected expression at line 13:12 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:13:12
   |
13 |       stack) == list.new[String]()
   |            ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:5:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:13:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
13 |       stack) == list.new[String]()
   |       ^^^^^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  list.fold(string.chars(s), stack, (stack, c) => 
    if string.is_one_of(c, "(" | "[" | "{") then 
      stack + [c] 
    else if string.is_one_of(c, ")" | "]" | "}") then 
      match list.last(stack) with 
        | some("(") when c == ")" -> list.drop_end(stack, 1)
        | some("[") when c == "]" -> list.drop_end(stack, 1)
        | some("{") when c == "}" -> list.drop_end(stack, 1)
        | _ -> stack 
    else 
      stack) == []

fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  list.fold(string.chars(s), stack, (stack, c) => 
    if string.is_one_of(c, "(" | "[" | "{") then 
      stack + [c] 
    else if string.is_one_of(c, ")" | "]" | "}") then 
      match list.last(stack) with 
        | some("(") when c == ")" -> list.drop_end(stack, 1)
        | some
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected ')' to close function call opened at line 4:24
  --> /tmp/dojo-balanced-parens-1.almd:4:32
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                        --------------- '(' opened here
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                                ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:6:5
  |
6 |     else if string.is_one_of(c, ")" | "]" | "}") then
  |     ^
error: Expected LBrace at line 7:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:7:30
  |
7 |       match list.last(stack) with
  |                              ^
error: Expected expression at line 13:12 (got RParen ')')
  --> /tmp/dojo-balanced-parens-1.almd:13:12
   |
13 |       stack) == []
   |            ^
error: Expected ')' to close function call opened at line 18:24
  --> /tmp/dojo-balanced-parens-1.almd:18:32
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |     if string.is_one_of(c, "(" | "[" | "{") then
   |                        --------------- '(' opened here
   |
18 |     if string.is_one_of(c, "(" | "[" | "{") then
   |                                ^
error: Expected expression at line 20:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:20:5
   |
20 |     else if string.is_one_of(c, ")" | "]" | "}") then
   |     ^
error: Expected LBrace at line 21:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:21:30
   |
21 |       match list.last(stack) with
   |                              ^
error[E012]: duplicate function 'is_balanced'
  at line 15
  in fn is_balanced
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
15 | fn is_balanced(s: String) -> Bool =
   | ^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:5:16
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       stack + [c]
  |                ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:19:16
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
19 |       stack + [c]
   |                ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:13:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
13 |       stack) == []
   |       ^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:19:16
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
19 |       stack + [c]
   |                ^

12 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  list.fold(string.chars(s), stack, (stack, c) => 
    if string.is_one_of(c, "(" | "[" | "{") then 
      stack + [c] 
    else if string.is_one_of(c, ")" | "]" | "}") then 
      match list.last(stack) with 
        | some(x) when string.is_one_of(x, "(") && string.is_one_of(c, ")") -> list.drop_end(stack, 1)
        | some(x) when string.is_one_of(x, "[") && string.is_one_of(c, "]") -> list.drop_end(stack, 1)
        | some(x) when string.is_one_of(x, "{") && string.is_one_of(c, "}") -> list.drop_end(stack, 1)
        | _ -> stack 
    else stack) == []
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected ')' to close function call opened at line 4:24
  --> /tmp/dojo-balanced-parens-2.almd:4:32
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                        --------------- '(' opened here
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                                ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:6:5
  |
6 |     else if string.is_one_of(c, ")" | "]" | "}") then
  |     ^
error: Expected LBrace at line 7:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:7:30
  |
7 |       match list.last(stack) with
  |                              ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:5:16
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       stack + [c]
  |                ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:5:16
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       stack + [c]
  |                ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  list.fold(string.chars(s), stack, (stack, c) => 
    if string.is_one_of(c, "(" | "[" | "{") then 
      stack + [c] 
    else if string.is_one_of(c, ")" | "]" | "}") then 
      match list.last(stack) with 
        | some(x) when string.is_one_of(x, "(") && string.is_one_of(c, ")") -> list.drop_end(stack, 1)
        | some(x) when string.is_one_of(x, "[") && string.is_one_of(c, "]") -> list.drop_end(stack, 1)
        | some(x) when string.is_one_of(x, "{") && string.is_one_of(c, "}") -> list.drop_end(stack, 1)
        | _ -> stack 
    else stack) == []
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected ')' to close function call opened at line 4:24
  --> /tmp/dojo-balanced-parens-3.almd:4:32
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                        --------------- '(' opened here
  |
4 |     if string.is_one_of(c, "(" | "[" | "{") then
  |                                ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:6:5
  |
6 |     else if string.is_one_of(c, ")" | "]" | "}") then
  |     ^
error: Expected LBrace at line 7:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:7:30
  |
7 |       match list.last(stack) with
  |                              ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:5:16
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       stack + [c]
  |                ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:5:16
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       stack + [c]
  |                ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
