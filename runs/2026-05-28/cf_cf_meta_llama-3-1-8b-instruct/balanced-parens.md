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
  string.chars(s) |> list.fold(_, list.new[String](), (stack, c) => 
    match c {
      '(' => list.push(stack, ")")
      | '[' => list.push(stack, "]")
      | '{' => list.push(stack, "}")
      | ')' => if list.is_empty(stack) then false else list.pop(stack) == ")" && stack
      | ']' => if list.is_empty(stack) then false else list.pop(stack) == "]" && stack
      | '}' => if list.is_empty(stack) then false else list.pop(stack) == "}" && stack
      | _ => stack
    }) |>
  list.is_empty(_)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected pattern at line 6:7 (got Pipe '|')
  --> /tmp/dojo-balanced-parens-0.almd:6:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |       | '[' => list.push(stack, "]")
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-0.almd:12:5
   |
12 |     }) |>
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = list.new[String]()
  |                       ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  string.chars(s) |> list.fold(_, list.new[String](), (stack, c) => 
    match c {
      '(' => list.push(stack, ")")
      | '[' => list.push(stack, "]")
      | '{' => list.push(stack, "}")
      | ')' => if list.is_empty(stack) then false else list.pop(stack) == ")" && stack
      | ']' => if list.is_empty(stack) then false else list.pop(stack) == "]" && stack
      | '}' => if list.is_empty(stack) then false else list.pop(stack) == "}" && stack
      | _ => stack
    }) |>
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected pattern at line 6:7 (got Pipe '|')
  --> /tmp/dojo-balanced-parens-1.almd:6:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |       | '[' => list.push(stack, "]")
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:12:5
   |
12 |     }) |>
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = list.new[String]()
  |                       ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  string.chars(s) |> list.fold(_, list.new[String](), (stack, c) => 
    match c {
      '(' => list.push(stack, ")")
      | '[' => list.push(stack, "]")
      | '{' => list.push(stack, "}")
      | ')' => if list.is_empty(stack) then false else list.pop(stack) == ")" && stack
      | ']' => if list.is_empty(stack) then false else list.pop(stack) == "]" && stack
      | '}' => if list.is_empty(stack) then false else list.pop(stack) == "}" && stack
      | _ => stack
    }) |>
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected pattern at line 6:7 (got Pipe '|')
  --> /tmp/dojo-balanced-parens-2.almd:6:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |       | '[' => list.push(stack, "]")
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-2.almd:12:5
   |
12 |     }) |>
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:2:23
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = list.new[String]()
  |                       ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  string.chars(s) |> list.fold(_, list.new[String](), (stack, c) => 
    match c {
      '(' => list.push(stack, ")")
      | '[' => list.push(stack, "]")
      | '{' => list.push(stack, "}")
      | ')' => if list.is_empty(stack) then false else list.pop(stack) == ")" && stack
      | ']' => if list.is_empty(stack) then false else list.pop(stack) == "]" && stack
      | '}' => if list.is_empty(stack) then false else list.pop(stack) == "}" && stack
      | _ => stack
    }) |>
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected pattern at line 6:7 (got Pipe '|')
  --> /tmp/dojo-balanced-parens-3.almd:6:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |       | '[' => list.push(stack, "]")
  |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-3.almd:12:5
   |
12 |     }) |>
   |     ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:2:23
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = list.new[String]()
  |                       ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
