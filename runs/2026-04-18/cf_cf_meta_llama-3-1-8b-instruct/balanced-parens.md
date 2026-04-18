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
  for c in string.chars(s) do 
    match c do 
      '(' -> list.push(stack, ")")
      '[' -> list.push(stack, "]")
      '{' -> list.push(stack, "}")
      ')' -> if list.is_empty(stack) then false else list.pop(stack) = ")"
      ']' -> if list.is_empty(stack) then false else list.pop(stack) = "]"
      '}' -> if list.is_empty(stack) then false else list.pop(stack) = "}"
      _ -> ()
    end
  end; 
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
error: Expected LBrace at line 4:13 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-0.almd:4:13
  |
4 |     match c do
  |             ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-0.almd:12:5
  in variable end
  hint: Check the variable name
   |
12 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-0.almd:13:3
  in variable end
  hint: Check the variable name
   |
13 |   end;
   |   ^^^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  for c in string.chars(s) do 
    match c do 
      '(' -> stack = stack + [")"]
      '[' -> stack = stack + ["]"]
      '{' -> stack = stack + ["}"]
      ')' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      ']' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      '}' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      _ -> ()
    end
  end; 
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
error: Expected LBrace at line 4:13 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:4:13
  |
4 |     match c do
  |             ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-1.almd:12:5
  in variable end
  hint: Check the variable name
   |
12 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-1.almd:13:3
  in variable end
  hint: Check the variable name
   |
13 |   end;
   |   ^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  for c in string.chars(s) do 
    match c do 
      '(' -> stack = stack + [")"]
      '[' -> stack = stack + ["]"]
      '{' -> stack = stack + ["}"]
      ')' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      ']' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      '}' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      _ -> ()
    end
  end; 
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
error: Expected LBrace at line 4:13 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:4:13
  |
4 |     match c do
  |             ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-2.almd:12:5
  in variable end
  hint: Check the variable name
   |
12 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-2.almd:13:3
  in variable end
  hint: Check the variable name
   |
13 |   end;
   |   ^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  for c in string.chars(s) do 
    match c do 
      '(' -> stack = stack + [")"]
      '[' -> stack = stack + ["]"]
      '{' -> stack = stack + ["}"]
      ')' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      ']' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      '}' -> if list.is_empty(stack) then false else stack = list.drop_end(stack, 1)
      _ -> ()
    end
  end; 
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
error: Expected LBrace at line 4:13 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:4:13
  |
4 |     match c do
  |             ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-3.almd:12:5
  in variable end
  hint: Check the variable name
   |
12 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-3.almd:13:3
  in variable end
  hint: Check the variable name
   |
13 |   end;
   |   ^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
