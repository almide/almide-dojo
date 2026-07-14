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
  string.chars(s) |> 
  list.fold(_, list.new[String](), (stack, c) => 
    match c with 
    | '(' | '[' | '{' => list.push(stack, string.to_string(c))
    | ')' | ']' | '}' => 
      match list.last(stack) with 
      | '(' when c == ')' => list.drop_end(stack, 1)
      | '[' when c == ']' => list.drop_end(stack, 1)
      | '{' when c == '}' => list.drop_end(stack, 1)
      | _ => return false
    | _ => stack)) | 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected LBrace at line 5:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:5:13
  |
5 |     match c with
  |             ^
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:8:30
  |
8 |       match list.last(stack) with
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
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
  string.chars(s) |> 
  list.fold(_, stack, (stack, c) => 
    match c with 
    | '(' | '[' | '{' => stack + [string.to_string(c)]
    | ')' | ']' | '}' => 
      match list.last(stack) with 
      | '(' when c == ')' => list.drop_end(stack, 1)
      | '[' when c == ']' => list.drop_end(stack, 1)
      | '{' when c == '}' => list.drop_end(stack, 1)
      | _ => return false
    | _ => stack)) | 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected LBrace at line 5:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:5:13
  |
5 |     match c with
  |             ^
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:8:30
  |
8 |       match list.last(stack) with
  |                              ^

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
  string.chars(s) |> 
  list.fold(_, stack, (stack, c) => 
    match c with 
    | '(' | '[' | '{' => stack + [string.to_string(c)]
    | ')' | ']' | '}' => 
      match list.last(stack) with 
      | some('(') when c == ')' => list.drop_end(stack, 1)
      | some('[') when c == ']' => list.drop_end(stack, 1)
      | some('{') when c == '}' => list.drop_end(stack, 1)
      | _ => return false
    | _ => stack)) | 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected LBrace at line 5:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:5:13
  |
5 |     match c with
  |             ^
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:8:30
  |
8 |       match list.last(stack) with
  |                              ^

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
  string.chars(s) |> 
  list.fold(_, stack, (stack, c) => 
    match c with 
    | '(' | '[' | '{' => stack + [string.to_string(c)]
    | ')' | ']' | '}' => 
      match list.last(stack) with 
      | some('(') when c == ')' => list.drop_end(stack, 1)
      | some('[') when c == ']' => list.drop_end(stack, 1)
      | some('{') when c == '}' => list.drop_end(stack, 1)
      | _ => return false
    | _ => stack)) | 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected LBrace at line 5:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:5:13
  |
5 |     match c with
  |             ^
error: Expected LBrace at line 8:30 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:8:30
  |
8 |       match list.last(stack) with
  |                              ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
