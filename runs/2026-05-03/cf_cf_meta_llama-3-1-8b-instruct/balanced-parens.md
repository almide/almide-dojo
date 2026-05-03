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
  list.fold(string.chars(s), stack, (acc, c) => 
    if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then 
      list.push(acc, c) 
    else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then 
      match list.last(acc) with 
        some('(') => if c != ')' then list.drop_end(acc, 1) else acc 
        some('[') => if c != ']' then list.drop_end(acc, 1) else acc 
        some('{') => if c != '}' then list.drop_end(acc, 1) else acc 
        _ => acc 
    else acc 
  ) == list.new[String]()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: '&&' is not valid in Almide at line 4:27
  --> /tmp/dojo-balanced-parens-0.almd:4:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then
  |                           ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:6:5
  |
6 |     else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then
  |     ^
error: Expected LBrace at line 7:28 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-0.almd:7:28
  |
7 |       match list.last(acc) with
  |                            ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:5:17
  in variable acc
  hint: Check the variable name
  |
5 |       list.push(acc, c)
  |                 ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:5:22
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(acc, c)
  |                      ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:5:22
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(acc, c)
  |                      ^

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
  list.fold(string.chars(s), stack, (acc, c) => 
    if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then 
      acc + [c] 
    else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then 
      match list.last(acc) with 
        some('(') => if c != ')' then list.drop_end(acc, 1) else acc 
        some('[') => if c != ']' then list.drop_end(acc, 1) else acc 
        some('{') => if c != '}' then list.drop_end(acc, 1) else acc 
        _ => acc 
    else acc 
  ) == []
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '&&' is not valid in Almide at line 4:27
  --> /tmp/dojo-balanced-parens-1.almd:4:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then
  |                           ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:6:5
  |
6 |     else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then
  |     ^
error: Expected LBrace at line 7:28 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-1.almd:7:28
  |
7 |       match list.last(acc) with
  |                            ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:5:7
  in variable acc
  hint: Check the variable name
  |
5 |       acc + [c]
  |       ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:5:14
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       acc + [c]
  |              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:5:14
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       acc + [c]
  |              ^

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  list.fold(string.chars(s), stack, (acc, c) => 
    if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then 
      acc + [c] 
    else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then 
      match list.last(acc) with 
        some('(') => if c == ')' then list.drop_end(acc, 1) else acc 
        some('[') => if c == ']' then list.drop_end(acc, 1) else acc 
        some('{') => if c == '}' then list.drop_end(acc, 1) else acc 
        _ => acc 
    else acc 
  ) == []
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: '&&' is not valid in Almide at line 4:27
  --> /tmp/dojo-balanced-parens-2.almd:4:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then
  |                           ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:6:5
  |
6 |     else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then
  |     ^
error: Expected LBrace at line 7:28 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-2.almd:7:28
  |
7 |       match list.last(acc) with
  |                            ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:5:7
  in variable acc
  hint: Check the variable name
  |
5 |       acc + [c]
  |       ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:5:14
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       acc + [c]
  |              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:5:14
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       acc + [c]
  |              ^

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = [] in 
  list.fold(string.chars(s), stack, (acc, c) => 
    if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then 
      acc + [c] 
    else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then 
      match list.last(acc) with 
        some('(') => if c == ')' then list.drop_end(acc, 1) else acc 
        some('[') => if c == ']' then list.drop_end(acc, 1) else acc 
        some('{') => if c == '}' then list.drop_end(acc, 1) else acc 
        _ => acc 
    else acc 
  ) == []
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: '&&' is not valid in Almide at line 4:27
  --> /tmp/dojo-balanced-parens-3.almd:4:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |     if string.is_alpha(c) && (c == '(' || c == '[' || c == '{') then
  |                           ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:6:5
  |
6 |     else if string.is_alpha(c) && (c == ')' || c == ']' || c == '}') then
  |     ^
error: Expected LBrace at line 7:28 (got Ident 'with')
  --> /tmp/dojo-balanced-parens-3.almd:7:28
  |
7 |       match list.last(acc) with
  |                            ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:5:7
  in variable acc
  hint: Check the variable name
  |
5 |       acc + [c]
  |       ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:5:14
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       acc + [c]
  |              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:5:14
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       acc + [c]
  |              ^

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
