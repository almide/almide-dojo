# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([
    '(' => ')',
    '[' => ']',
    '{' => '}',
  ])
  let stack = list.new()
  for c in string.chars(s) do
    if c in bracket_map then
      list.push(stack, c)
    else if c in bracket_map.values() then
      if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
        return false
      else
        list.drop_end(stack, 1)
    end
  end
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected ']' to close list literal opened at line 2:35
  --> /tmp/dojo-balanced-parens-0.almd:3:9
  hint: Add ']' or check for a missing delimiter inside the list literal
  |
2 |   let bracket_map = map.from_list([
  |                                   --------------- '[' opened here
...
3 |     '(' => ')',
  |         ^^
error: Expected LBrace at line 8:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-0.almd:8:28
  |
8 |   for c in string.chars(s) do
  |                            ^
error: Expected Then at line 9:10 (got In 'in')
  --> /tmp/dojo-balanced-parens-0.almd:9:10
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if c in bracket_map then
  |          ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:11:5
   |
11 |     else if c in bracket_map.values() then
   |     ^
error: '||' is not valid in Almide at line 12:31
  --> /tmp/dojo-balanced-parens-0.almd:12:31
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
   |                               ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:7:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
7 |   let stack = list.new()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:10:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
10 |       list.push(stack, c)
   |                        ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-0.almd:16:5
  in variable end
  hint: Check the variable name
   |
16 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-0.almd:17:3
  in variable end
  hint: Check the variable name
   |
17 |   end
   |   ^^^

9 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([
    '(' => ')',
    '[' => ']',
    '{' => '}',
  ])
  let stack = []
  for c in string.chars(s) do
    if c in bracket_map then
      stack = stack + [c]
    else if c in bracket_map.values() then
      if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
        return false
      else
        stack = list.drop_end(stack, 1)
      end
    end
  end
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected ']' to close list literal opened at line 2:35
  --> /tmp/dojo-balanced-parens-1.almd:3:9
  hint: Add ']' or check for a missing delimiter inside the list literal
  |
2 |   let bracket_map = map.from_list([
  |                                   --------------- '[' opened here
...
3 |     '(' => ')',
  |         ^^
error: Expected LBrace at line 8:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:8:28
  |
8 |   for c in string.chars(s) do
  |                            ^
error: Expected Then at line 9:10 (got In 'in')
  --> /tmp/dojo-balanced-parens-1.almd:9:10
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if c in bracket_map then
  |          ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:11:5
   |
11 |     else if c in bracket_map.values() then
   |     ^
error: '||' is not valid in Almide at line 12:31
  --> /tmp/dojo-balanced-parens-1.almd:12:31
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
   |                               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:10:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
10 |       stack = stack + [c]
   |                        ^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:10:24
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 7 |   let stack = []
   |   --------------------- 'stack' declared here
...
10 |       stack = stack + [c]
   |                        ^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:15:38
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 7 |   let stack = []
   |   --------------------- 'stack' declared here
...
15 |         stack = list.drop_end(stack, 1)
   |                                      ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-1.almd:16:7
  in variable end
  hint: Check the variable name
   |
16 |       end
   |       ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-1.almd:17:5
  in variable end
  hint: Check the variable name
   |
17 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-1.almd:18:3
  in variable end
  hint: Check the variable name
   |
18 |   end
   |   ^^^

11 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([
    '(' => ')',
    '[' => ']',
    '{' => '}',
  ])
  var stack = []
  for c in string.chars(s) do
    if c in bracket_map then
      stack = stack + [c]
    else if c in bracket_map.values() then
      if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
        return false
      else
        stack = list.drop_end(stack, 1)
      end
    end
  end
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected ']' to close list literal opened at line 2:35
  --> /tmp/dojo-balanced-parens-2.almd:3:9
  hint: Add ']' or check for a missing delimiter inside the list literal
  |
2 |   let bracket_map = map.from_list([
  |                                   --------------- '[' opened here
...
3 |     '(' => ')',
  |         ^^
error: Expected LBrace at line 8:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:8:28
  |
8 |   for c in string.chars(s) do
  |                            ^
error: Expected Then at line 9:10 (got In 'in')
  --> /tmp/dojo-balanced-parens-2.almd:9:10
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if c in bracket_map then
  |          ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:11:5
   |
11 |     else if c in bracket_map.values() then
   |     ^
error: '||' is not valid in Almide at line 12:31
  --> /tmp/dojo-balanced-parens-2.almd:12:31
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
   |                               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:10:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
10 |       stack = stack + [c]
   |                        ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-2.almd:16:7
  in variable end
  hint: Check the variable name
   |
16 |       end
   |       ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-2.almd:17:5
  in variable end
  hint: Check the variable name
   |
17 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-2.almd:18:3
  in variable end
  hint: Check the variable name
   |
18 |   end
   |   ^^^

9 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let bracket_map = map.from_list([
    '(' => ')',
    '[' => ']',
    '{' => '}',
  ])
  var stack = []
  for c in string.chars(s) do
    if c in bracket_map then
      stack = stack + [c]
    else if c in bracket_map.values() then
      if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
        return false
      else
        stack = list.drop_end(stack, 1)
      end
    end
  end
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected ']' to close list literal opened at line 2:35
  --> /tmp/dojo-balanced-parens-3.almd:3:9
  hint: Add ']' or check for a missing delimiter inside the list literal
  |
2 |   let bracket_map = map.from_list([
  |                                   --------------- '[' opened here
...
3 |     '(' => ')',
  |         ^^
error: Expected LBrace at line 8:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:8:28
  |
8 |   for c in string.chars(s) do
  |                            ^
error: Expected Then at line 9:10 (got In 'in')
  --> /tmp/dojo-balanced-parens-3.almd:9:10
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if c in bracket_map then
  |          ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:11:5
   |
11 |     else if c in bracket_map.values() then
   |     ^
error: '||' is not valid in Almide at line 12:31
  --> /tmp/dojo-balanced-parens-3.almd:12:31
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(stack) || list.last(stack) != bracket_map^{-1}(c) then
   |                               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:10:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
10 |       stack = stack + [c]
   |                        ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-3.almd:16:7
  in variable end
  hint: Check the variable name
   |
16 |       end
   |       ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-3.almd:17:5
  in variable end
  hint: Check the variable name
   |
17 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-3.almd:18:3
  in variable end
  hint: Check the variable name
   |
18 |   end
   |   ^^^

9 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
