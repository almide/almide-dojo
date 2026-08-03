# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]()
  for c in string.chars(s) do 
    match c with 
      '(' => list.push(stack, ")")
      '[' => list.push(stack, "]")
      '{' => list.push(stack, "}")
      ')' => if list.is_empty(stack) || list.last(stack) != ")" then return false else list.drop_end(stack, 1)
      ']' => if list.is_empty(stack) || list.last(stack) != "]" then return false else list.drop_end(stack, 1)
      '}' => if list.is_empty(stack) || list.last(stack) != "}" then return false else list.drop_end(stack, 1)
      _ => () 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-0.almd:3:28
  |
3 |   for c in string.chars(s) do
  |                            ^
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

3 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = []
  for c in string.chars(s) do 
    match c with 
      '(' => stack = stack + [")"]
      '[' => stack = stack + ["`"]
      '{' => stack = stack + ["`"}
      ')' => if list.is_empty(stack) || list.last(stack) != ")" then return false else stack = stack.drop_end(1)
      ']' => if list.is_empty(stack) || list.last(stack) != "]" then return false else stack = stack.drop_end(1)
      '}' => if list.is_empty(stack) || list.last(stack) != "}" then return false else stack = stack.drop_end(1)
      _ => () 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:3:28
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected LBrace at line 4:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:4:13
  |
4 |     match c with
  |             ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = []
  for c in string.chars(s) do 
    match c with 
      '(' => stack = stack + [")"]
      '[' => stack = stack + ["`"]
      '{' => stack = stack + ["`"}
      ')' => if list.is_empty(stack) || list.last(stack) != ")" then return false else stack = stack.drop_end(1)
      ']' => if list.is_empty(stack) || list.last(stack) != "]" then return false else stack = stack.drop_end(1)
      '}' => if list.is_empty(stack) || list.last(stack) != "}" then return false else stack = stack.drop_end(1)
      _ => () 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:3:28
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected LBrace at line 4:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:4:13
  |
4 |     match c with
  |             ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = []
  for c in string.chars(s) do 
    match c with 
      '(' => stack = stack + [")"]
      '[' => stack = stack + ["`"]
      '{' => stack = stack + ["`"}
      ')' => if list.is_empty(stack) || list.last(stack) != ")" then return false else stack = stack.drop_end(1)
      ']' => if list.is_empty(stack) || list.last(stack) != "]" then return false else stack = stack.drop_end(1)
      '}' => if list.is_empty(stack) || list.last(stack) != "}" then return false else stack = stack.drop_end(1)
      _ => () 
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:3:28
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected LBrace at line 4:13 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:4:13
  |
4 |     match c with
  |             ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
