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
  string.chars(s) |> list.fold(_, stack, 
    fn(stack, c) = 
      match c with 
      | '(' | '[' | '{' => list.push(stack, string.to_char(c))
      | ')' | ']' | '}' => 
        match list.last(stack) with 
        | '(' | '[' | '{' => 
          match c with 
          | ')' => if string.to_char(list.last(stack)) != '(' then false else list.drop_end(stack, 1)
          | ']' => if string.to_char(list.last(stack)) != '[' then false else list.drop_end(stack, 1)
          | '}' => if string.to_char(list.last(stack)) != '{' then false else list.drop_end(stack, 1)
          | _ => false
        | _ => false
      | _ => stack
  ) |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-0.almd:4:5
  |
4 |     fn(stack, c) =
  |     ^
error: Expected LBrace at line 5:15 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:5:15
  |
5 |       match c with
  |               ^
error: Expected LBrace at line 8:32 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:8:32
  |
8 |         match list.last(stack) with
  |                                ^
error: Expected LBrace at line 10:19 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:10:19
   |
10 |           match c with
   |                   ^
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

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  string.chars(s) |> list.fold(_, stack, 
    fn(stack, c) = 
      match c with 
      | '(' | '[' | '{' => stack + [string.to_char(c)]
      | ')' | ']' | '}' => 
        match list.last(stack) with 
        | '(' | '[' | '{' => 
          match c with 
          | ')' => if string.to_char(list.last(stack)) != '(' then false else list.drop_end(stack, 1)
          | ']' => if string.to_char(list.last(stack)) != '[' then false else list.drop_end(stack, 1)
          | '}' => if string.to_char(list.last(stack)) != '{' then false else list.drop_end(stack, 1)
          | _ => false
        | _ => false
      | _ => stack
  ) |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-1.almd:4:5
  |
4 |     fn(stack, c) =
  |     ^
error: Expected LBrace at line 5:15 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:5:15
  |
5 |       match c with
  |               ^
error: Expected LBrace at line 8:32 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:8:32
  |
8 |         match list.last(stack) with
  |                                ^
error: Expected LBrace at line 10:19 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:10:19
   |
10 |           match c with
   |                   ^
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

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  string.chars(s) |> list.fold(_, stack, 
    fn(stack, c) = 
      match c with 
      | '(' | '[' | '{' => stack + [string.to_char(c)]
      | ')' | ']' | '}' => 
        match list.last(stack) with 
        | '(' | '[' | '{' => 
          match c with 
          | ')' => if string.to_char(list.last(stack)) != '(' then false else list.drop_end(stack, 1)
          | ']' => if string.to_char(list.last(stack)) != '[' then false else list.drop_end(stack, 1)
          | '}' => if string.to_char(list.last(stack)) != '{' then false else list.drop_end(stack, 1)
          | _ => false
        | _ => false
      | _ => stack
  ) |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-2.almd:4:5
  |
4 |     fn(stack, c) =
  |     ^
error: Expected LBrace at line 5:15 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:5:15
  |
5 |       match c with
  |               ^
error: Expected LBrace at line 8:32 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:8:32
  |
8 |         match list.last(stack) with
  |                                ^
error: Expected LBrace at line 10:19 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:10:19
   |
10 |           match c with
   |                   ^
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
  string.chars(s) |> list.fold(_, stack, 
    fn(stack, c) = 
      match c with 
      | '(' | '[' | '{' => stack + [string.to_char(c)]
      | ')' | ']' | '}' => 
        match list.last(stack) with 
        | '(' | '[' | '{' => 
          match c with 
          | ')' => if string.to_char(list.last(stack)) != '(' then false else list.drop_end(stack, 1)
          | ']' => if string.to_char(list.last(stack)) != '[' then false else list.drop_end(stack, 1)
          | '}' => if string.to_char(list.last(stack)) != '{' then false else list.drop_end(stack, 1)
          | _ => false
        | _ => false
      | _ => stack
  ) |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-3.almd:4:5
  |
4 |     fn(stack, c) =
  |     ^
error: Expected LBrace at line 5:15 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:5:15
  |
5 |       match c with
  |               ^
error: Expected LBrace at line 8:32 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:8:32
  |
8 |         match list.last(stack) with
  |                                ^
error: Expected LBrace at line 10:19 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:10:19
   |
10 |           match c with
   |                   ^
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

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
