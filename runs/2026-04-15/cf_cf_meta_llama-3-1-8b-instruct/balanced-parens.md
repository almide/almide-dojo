# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  string.chars(s).fold(
    stack, 
    (stack, c) => 
      if c == '(' || c == '[' || c == '{' then 
        list.push(stack, c) 
      else if c == ')' || c == ']' || c == '}' then 
        match stack.last() with 
          some(x) => 
            match (x, c) with 
              ('(', ')') => list.drop_end(stack, 1)
              ('[', ']') => list.drop_end(stack, 1)
              ('{', '}') => list.drop_end(stack, 1)
              _ => false
          none => false
      else true, 
    true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected expression at line 2:34 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:2:34
  |
2 |   let stack = list.new[String]() in
  |                                  ^
error: '||' is not valid in Almide at line 6:19
  --> /tmp/dojo-balanced-parens-0.almd:6:19
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
6 |       if c == '(' || c == '[' || c == '{' then
  |                   ^
error: Expected expression at line 8:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:8:7
  |
8 |       else if c == ')' || c == ']' || c == '}' then
  |       ^
error: Expected LBrace at line 9:28 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:9:28
  |
9 |         match stack.last() with
  |                            ^
error: Expected LBrace at line 11:26 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:11:26
   |
11 |             match (x, c) with
   |                          ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]() in
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:7:26
  in variable c
  hint: Check the variable name
  |
7 |         list.push(stack, c)
  |                          ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:7:26
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  |
7 |         list.push(stack, c)
  |                          ^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  string.chars(s).fold(
    stack, 
    (stack, c) => 
      if c == '(' || c == '[' || c == '{' then 
        stack + [c] 
      else if c == ')' || c == ']' || c == '}' then 
        match stack with 
          [] => false
          some(x) => 
            match (x, c) with 
              ('(', ')') => true
              ('[', ']') => true
              ('{', '}') => true
              _ => false
      else true, 
    true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected expression at line 2:18 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:2:18
  |
2 |   let stack = [] in
  |                  ^
error: '||' is not valid in Almide at line 6:19
  --> /tmp/dojo-balanced-parens-1.almd:6:19
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
6 |       if c == '(' || c == '[' || c == '{' then
  |                   ^
error: Expected expression at line 8:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:8:7
  |
8 |       else if c == ')' || c == ']' || c == '}' then
  |       ^
error: Expected LBrace at line 9:21 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:9:21
  |
9 |         match stack with
  |                     ^
error: Expected LBrace at line 12:26 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:12:26
   |
12 |             match (x, c) with
   |                          ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:7:18
  in variable c
  hint: Check the variable name
  |
7 |         stack + [c]
  |                  ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:7:18
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  |
7 |         stack + [c]
  |                  ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  string.chars(s).fold(
    stack, 
    (stack, c) => 
      if c == '(' || c == '[' || c == '{' then 
        stack + [c] 
      else if c == ')' || c == ']' || c == '}' then 
        match stack with 
          [] => false
          some(x) => 
            match (x, c) with 
              ('(', ')') => true
              ('[', ']') => true
              ('{', '}') => true
              _ => false
      else true, 
    true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected expression at line 2:18 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:2:18
  |
2 |   let stack = [] in
  |                  ^
error: '||' is not valid in Almide at line 6:19
  --> /tmp/dojo-balanced-parens-2.almd:6:19
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
6 |       if c == '(' || c == '[' || c == '{' then
  |                   ^
error: Expected expression at line 8:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:8:7
  |
8 |       else if c == ')' || c == ']' || c == '}' then
  |       ^
error: Expected LBrace at line 9:21 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:9:21
  |
9 |         match stack with
  |                     ^
error: Expected LBrace at line 12:26 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:12:26
   |
12 |             match (x, c) with
   |                          ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:7:18
  in variable c
  hint: Check the variable name
  |
7 |         stack + [c]
  |                  ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:7:18
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  |
7 |         stack + [c]
  |                  ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  string.chars(s).fold(
    stack, 
    (stack, c) => 
      if c == '(' || c == '[' || c == '{' then 
        stack + [c] 
      else if c == ')' || c == ']' || c == '}' then 
        match stack with 
          [] => false
          some(x) => 
            match (x, c) with 
              ('(', ')') => true
              ('[', ']') => true
              ('{', '}') => true
              _ => false
      else true, 
    true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected expression at line 2:18 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:2:18
  |
2 |   let stack = [] in
  |                  ^
error: '||' is not valid in Almide at line 6:19
  --> /tmp/dojo-balanced-parens-3.almd:6:19
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
6 |       if c == '(' || c == '[' || c == '{' then
  |                   ^
error: Expected expression at line 8:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:8:7
  |
8 |       else if c == ')' || c == ']' || c == '}' then
  |       ^
error: Expected LBrace at line 9:21 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:9:21
  |
9 |         match stack with
  |                     ^
error: Expected LBrace at line 12:26 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:12:26
   |
12 |             match (x, c) with
   |                          ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:7:18
  in variable c
  hint: Check the variable name
  |
7 |         stack + [c]
  |                  ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:7:18
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  |
7 |         stack + [c]
  |                  ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
