# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = list.new[String]()
    bracket_map = map.new[String, String]()
      .set("(", ")")
      .set("[", "]")
      .set("{", "}")
  in 
    string.chars(s)
      .map(fn c => if c in bracket_map.keys() then list.push(stack, c) else if c in bracket_map.values() then 
        if list.is_empty(stack) || (let last = list.last(stack); list.drop_end(stack, 1); bracket_map.get(last) != c) then false else true 
        else true)
      .fold(true, fn acc, x => acc && x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-0.almd:5:7
  |
5 |       .set("(", ")")
  |       ^
error: Expected expression at line 10:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-0.almd:10:7
   |
10 |       .map(fn c => if c in bracket_map.keys() then list.push(stack, c) else if c in bracket_map.values() then
   |       ^
error: '||' is not valid in Almide at line 11:33
  --> /tmp/dojo-balanced-parens-0.almd:11:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
11 |         if list.is_empty(stack) || (let last = list.last(stack); list.drop_end(stack, 1); bracket_map.get(last) != c) then false else true
   |                                 ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:21
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     stack = list.new[String]()
  |                     ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:9:18
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |     string.chars(s)
  |                  ^

6 error(s) found
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
    bracket_map = map.new[String, String]()
      .set("(", ")")
      .set("[", "]")
      .set("{", "}")
  in 
    string.chars(s)
      .map(fn c => if c in bracket_map.keys() then stack + [c] else if c in bracket_map.values() then 
        if list.is_empty(stack) || (let last = list.last(stack); list.drop_end(stack, 1); bracket_map.get(last) != c) then false else true 
        else true)
      .fold(true, fn acc, x => acc && x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-1.almd:5:7
  |
5 |       .set("(", ")")
  |       ^
error: Expected expression at line 10:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-1.almd:10:7
   |
10 |       .map(fn c => if c in bracket_map.keys() then stack + [c] else if c in bracket_map.values() then
   |       ^
error: '||' is not valid in Almide at line 11:33
  --> /tmp/dojo-balanced-parens-1.almd:11:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
11 |         if list.is_empty(stack) || (let last = list.last(stack); list.drop_end(stack, 1); bracket_map.get(last) != c) then false else true
   |                                 ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:9:18
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |     string.chars(s)
  |                  ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = []
    bracket_map = map.new[String, String]()
      .set("(", ")")
      .set("[", "]")
      .set("{", "}")
  in 
    string.chars(s)
      .map(fn c => if c in bracket_map.keys() then stack + [c] else if c in bracket_map.values() then 
        if list.is_empty(stack) || (let last = list.last(stack); list.drop_end(stack, 1); bracket_map.get(last) != c) then false else true)
      .fold(true, fn acc, x => acc && x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-2.almd:5:7
  |
5 |       .set("(", ")")
  |       ^
error: Expected expression at line 10:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-2.almd:10:7
   |
10 |       .map(fn c => if c in bracket_map.keys() then stack + [c] else if c in bracket_map.values() then
   |       ^
error: '||' is not valid in Almide at line 11:33
  --> /tmp/dojo-balanced-parens-2.almd:11:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
11 |         if list.is_empty(stack) || (let last = list.last(stack); list.drop_end(stack, 1); bracket_map.get(last) != c) then false else true)
   |                                 ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:9:18
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |     string.chars(s)
  |                  ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let 
    stack = []
    bracket_map = map.new[String, String]()
      .set("(", ")")
      .set("[", "]")
      .set("{", "}")
  in 
    string.chars(s)
      .map(fn c => if c in bracket_map.keys() then stack + [c] else if c in bracket_map.values() then 
        if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
      .fold(true, fn acc, x => acc && x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-3.almd:5:7
  |
5 |       .set("(", ")")
  |       ^
error: Expected expression at line 10:7 (got Dot '.')
  --> /tmp/dojo-balanced-parens-3.almd:10:7
   |
10 |       .map(fn c => if c in bracket_map.keys() then stack + [c] else if c in bracket_map.values() then
   |       ^
error: Expected expression at line 11:130 (got RParen ')')
  --> /tmp/dojo-balanced-parens-3.almd:11:130
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                                                                                                                                  ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:11:26
  in variable stack
  hint: Check the variable name
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                          ^^^^^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:11:78
  in variable stack
  hint: Check the variable name
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                                                                              ^^^^^
error[E003]: undefined variable 'bracket_map'
  --> /tmp/dojo-balanced-parens-3.almd:11:52
  in variable bracket_map
  hint: Check the variable name
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                                                    ^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:11:89
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                                                                                         ^
error[E003]: undefined variable 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:11:121
  in variable stack
  hint: Check the variable name
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                                                                                                                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?6]
  --> /tmp/dojo-balanced-parens-3.almd:11:128
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                                                                                                                                ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:11:128
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
11 |         if list.is_empty(stack) then false else if bracket_map.get(list.last(stack)) != c then false else list.drop_end(stack, 1))
   |                                                                                                                                ^

11 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
