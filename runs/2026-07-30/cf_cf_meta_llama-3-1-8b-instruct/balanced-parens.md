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
  list.all(string.chars(s), (c) => 
    match c with 
    | '(' | '[' | '{' => list.push(stack, c) 
    | ')' => if list.is_empty(stack) || match list.last(stack) with 
        | '(' => list.drop_end(stack, 1) 
        | '[' => list.drop_end(stack, 1) 
        | '{' => list.drop_end(stack, 1) 
        | _ => false 
      then false 
      else true 
    | ']' => if list.is_empty(stack) || match list.last(stack) with 
        | '(' => false 
        | '[' => list.drop_end(stack, 1) 
        | '{' => false 
        | _ => false 
      then false 
      else true 
    | '}' => if list.is_empty(stack) || match list.last(stack) with 
        | '(' => false 
        | '[' => false 
        | '{' => list.drop_end(stack, 1) 
        | _ => false 
      then false 
      else true 
    | _ => true 
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected LBrace at line 4:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:4:13
  |
4 |     match c with
  |             ^
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
  list.all(string.chars(s), (c) => 
    match c with 
    | '(' | '[' | '{' => stack + [c] 
    | ')' => if list.is_empty(stack) || match list.last(stack) with 
        | '(' => list.drop_end(stack, 1) 
        | '[' => list.drop_end(stack, 1) 
        | '{' => list.drop_end(stack, 1) 
        | _ => false 
      then false 
      else true 
    | ']' => if list.is_empty(stack) || match list.last(stack) with 
        | '(' => false 
        | '[' => list.drop_end(stack, 1) 
        | '{' => false 
        | _ => false 
      then false 
      else true 
    | '}' => if list.is_empty(stack) || match list.last(stack) with 
        | '(' => false 
        | '[' => false 
        | '{' => list.drop_end(stack, 1) 
        | _ => false 
      then false 
      else true 
    | _ => true 
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected LBrace at line 4:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:4:13
  |
4 |     match c with
  |             ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:2:15
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = []
  |               ^

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
  list.all(string.chars(s), (c) => 
    match c with 
    | '(' | '[' | '{' => stack + [c] 
    | ')' => if list.is_empty(stack) then false 
              else match list.last(stack) with 
                | '(' => list.drop_end(stack, 1) 
                | '[' => list.drop_end(stack, 1) 
                | '{' => list.drop_end(stack, 1) 
                | _ => false 
    | ']' => if list.is_empty(stack) then false 
              else match list.last(stack) with 
                | '(' => false 
                | '[' => list.drop_end(stack, 1) 
                | '{' => false 
                | _ => false 
    | '}' => if list.is_empty(stack) then false 
              else match list.last(stack) with 
                | '(' => false 
                | '[' => false 
                | '{' => list.drop_end(stack, 1) 
                | _ => false 
    | _ => true 
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected LBrace at line 4:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:4:13
  |
4 |     match c with
  |             ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:2:15
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = []
  |               ^

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
  list.all(string.chars(s), (c) => 
    match c with 
    | '(' | '[' | '{' => stack + [c] 
    | ')' => if list.is_empty(stack) then false 
              else match list.last(stack) with 
                | '(' => stack + list.drop_end(stack, 1) 
                | '[' => stack + list.drop_end(stack, 1) 
                | '{' => stack + list.drop_end(stack, 1) 
                | _ => false 
    | ']' => if list.is_empty(stack) then false 
              else match list.last(stack) with 
                | '[' => stack + list.drop_end(stack, 1) 
                | '(' => false 
                | '{' => false 
                | _ => false 
    | '}' => if list.is_empty(stack) then false 
              else match list.last(stack) with 
                | '{' => stack + list.drop_end(stack, 1) 
                | '(' => false 
                | '[' => false 
                | _ => false 
    | _ => true 
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected LBrace at line 4:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:4:13
  |
4 |     match c with
  |             ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:2:15
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let stack = []
  |               ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
