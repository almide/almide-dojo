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
    if c == '(' || c == '[' || c == '{' then 
      list.push(acc, string.to_string(c)) 
    else if c == ')' then 
      if list.is_empty(acc) || list.last(acc) != '(' then 
        list.drop_end(acc, 1) 
      else 
        list.drop_end(acc, 1) 
    else if c == ']' then 
      if list.is_empty(acc) || list.last(acc) != '[' then 
        list.drop_end(acc, 1) 
      else 
        list.drop_end(acc, 1) 
    else if c == '}' then 
      if list.is_empty(acc) || list.last(acc) != '{' then 
        list.drop_end(acc, 1) 
      else 
        list.drop_end(acc, 1) 
    else 
      acc 
  ) == list.new[String]()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: '||' is not valid in Almide at line 4:17
  --> /tmp/dojo-balanced-parens-0.almd:4:17
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     if c == '(' || c == '[' || c == '{' then
  |                 ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:6:5
  |
6 |     else if c == ')' then
  |     ^
error: '||' is not valid in Almide at line 7:29
  --> /tmp/dojo-balanced-parens-0.almd:7:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
7 |       if list.is_empty(acc) || list.last(acc) != '(' then
  |                             ^
error: Expected expression at line 9:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:9:7
  |
9 |       else
  |       ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:11:5
   |
11 |     else if c == ']' then
   |     ^
error: '||' is not valid in Almide at line 12:29
  --> /tmp/dojo-balanced-parens-0.almd:12:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(acc) || list.last(acc) != '[' then
   |                             ^
error: Expected expression at line 14:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:14:7
   |
14 |       else
   |       ^
error: Expected expression at line 16:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:16:5
   |
16 |     else if c == '}' then
   |     ^
error: '||' is not valid in Almide at line 17:29
  --> /tmp/dojo-balanced-parens-0.almd:17:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
17 |       if list.is_empty(acc) || list.last(acc) != '{' then
   |                             ^
error: Expected expression at line 19:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:19:7
   |
19 |       else
   |       ^
error: Expected expression at line 21:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-0.almd:21:5
   |
21 |     else
   |     ^
error: Expected expression at line 23:3 (got RParen ')')
  --> /tmp/dojo-balanced-parens-0.almd:23:3
   |
23 |   ) == list.new[String]()
   |   ^
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
5 |       list.push(acc, string.to_string(c))
  |                 ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:5:39
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-balanced-parens-0.almd:5:39
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:8:23
  in variable acc
  hint: Check the variable name
  |
8 |         list.drop_end(acc, 1)
  |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:10:23
  in variable acc
  hint: Check the variable name
   |
10 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:13:23
  in variable acc
  hint: Check the variable name
   |
13 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:15:23
  in variable acc
  hint: Check the variable name
   |
15 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:18:23
  in variable acc
  hint: Check the variable name
   |
18 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:20:23
  in variable acc
  hint: Check the variable name
   |
20 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-0.almd:22:7
  in variable acc
  hint: Check the variable name
   |
22 |       acc
   |       ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:22:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
22 |       acc
   |       ^^^

24 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  list.fold(string.chars(s), stack, (acc, c) => 
    if c == '(' || c == '[' || c == '{' then 
      list.push(acc, string.to_string(c)) 
    else if c == ')' then 
      if list.is_empty(acc) || list.last(acc) != '(' then 
        list.drop_end(acc, 1) 
      else 
        list.drop_end(acc, 1) 
    else if c == ']' then 
      if list.is_empty(acc) || list.last(acc) != '[' then 
        list.drop_end(acc, 1) 
      else 
        list.drop_end(acc, 1) 
    else if c == '}' then 
      if list.is_empty(acc) || list.last(acc) != '{' then 
        list.drop_end(acc, 1) 
      else 
        list.drop_end(acc, 1) 
    else 
      acc 
  ) == list.new[String]()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '||' is not valid in Almide at line 4:17
  --> /tmp/dojo-balanced-parens-1.almd:4:17
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     if c == '(' || c == '[' || c == '{' then
  |                 ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:6:5
  |
6 |     else if c == ')' then
  |     ^
error: '||' is not valid in Almide at line 7:29
  --> /tmp/dojo-balanced-parens-1.almd:7:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
7 |       if list.is_empty(acc) || list.last(acc) != '(' then
  |                             ^
error: Expected expression at line 9:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:9:7
  |
9 |       else
  |       ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:11:5
   |
11 |     else if c == ']' then
   |     ^
error: '||' is not valid in Almide at line 12:29
  --> /tmp/dojo-balanced-parens-1.almd:12:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(acc) || list.last(acc) != '[' then
   |                             ^
error: Expected expression at line 14:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:14:7
   |
14 |       else
   |       ^
error: Expected expression at line 16:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:16:5
   |
16 |     else if c == '}' then
   |     ^
error: '||' is not valid in Almide at line 17:29
  --> /tmp/dojo-balanced-parens-1.almd:17:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
17 |       if list.is_empty(acc) || list.last(acc) != '{' then
   |                             ^
error: Expected expression at line 19:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:19:7
   |
19 |       else
   |       ^
error: Expected expression at line 21:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:21:5
   |
21 |     else
   |     ^
error: Expected expression at line 23:3 (got RParen ')')
  --> /tmp/dojo-balanced-parens-1.almd:23:3
   |
23 |   ) == list.new[String]()
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:5:17
  in variable acc
  hint: Check the variable name
  |
5 |       list.push(acc, string.to_string(c))
  |                 ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:5:39
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-balanced-parens-1.almd:5:39
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:8:23
  in variable acc
  hint: Check the variable name
  |
8 |         list.drop_end(acc, 1)
  |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:10:23
  in variable acc
  hint: Check the variable name
   |
10 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:13:23
  in variable acc
  hint: Check the variable name
   |
13 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:15:23
  in variable acc
  hint: Check the variable name
   |
15 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:18:23
  in variable acc
  hint: Check the variable name
   |
18 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:20:23
  in variable acc
  hint: Check the variable name
   |
20 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-1.almd:22:7
  in variable acc
  hint: Check the variable name
   |
22 |       acc
   |       ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:22:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
22 |       acc
   |       ^^^

24 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  list.fold(string.chars(s), stack, (acc, c) => 
    if c == '(' || c == '[' || c == '{' then 
      list.push(acc, string.to_string(c)) 
    else if c == ')' then 
      if list.is_empty(acc) || list.last(acc) != '(' then 
        acc 
      else 
        list.drop_end(acc, 1) 
    else if c == ']' then 
      if list.is_empty(acc) || list.last(acc) != '[' then 
        acc 
      else 
        list.drop_end(acc, 1) 
    else if c == '}' then 
      if list.is_empty(acc) || list.last(acc) != '{' then 
        acc 
      else 
        list.drop_end(acc, 1) 
    else 
      acc 
  ) == list.new[String]()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: '||' is not valid in Almide at line 4:17
  --> /tmp/dojo-balanced-parens-2.almd:4:17
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     if c == '(' || c == '[' || c == '{' then
  |                 ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:6:5
  |
6 |     else if c == ')' then
  |     ^
error: '||' is not valid in Almide at line 7:29
  --> /tmp/dojo-balanced-parens-2.almd:7:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
7 |       if list.is_empty(acc) || list.last(acc) != '(' then
  |                             ^
error: Expected expression at line 9:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:9:7
  |
9 |       else
  |       ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:11:5
   |
11 |     else if c == ']' then
   |     ^
error: '||' is not valid in Almide at line 12:29
  --> /tmp/dojo-balanced-parens-2.almd:12:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(acc) || list.last(acc) != '[' then
   |                             ^
error: Expected expression at line 14:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:14:7
   |
14 |       else
   |       ^
error: Expected expression at line 16:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:16:5
   |
16 |     else if c == '}' then
   |     ^
error: '||' is not valid in Almide at line 17:29
  --> /tmp/dojo-balanced-parens-2.almd:17:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
17 |       if list.is_empty(acc) || list.last(acc) != '{' then
   |                             ^
error: Expected expression at line 19:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:19:7
   |
19 |       else
   |       ^
error: Expected expression at line 21:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:21:5
   |
21 |     else
   |     ^
error: Expected expression at line 23:3 (got RParen ')')
  --> /tmp/dojo-balanced-parens-2.almd:23:3
   |
23 |   ) == list.new[String]()
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:5:17
  in variable acc
  hint: Check the variable name
  |
5 |       list.push(acc, string.to_string(c))
  |                 ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:5:39
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-balanced-parens-2.almd:5:39
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:8:9
  in variable acc
  hint: Check the variable name
  |
8 |         acc
  |         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:10:23
  in variable acc
  hint: Check the variable name
   |
10 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:13:9
  in variable acc
  hint: Check the variable name
   |
13 |         acc
   |         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:15:23
  in variable acc
  hint: Check the variable name
   |
15 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:18:9
  in variable acc
  hint: Check the variable name
   |
18 |         acc
   |         ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:20:23
  in variable acc
  hint: Check the variable name
   |
20 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-2.almd:22:7
  in variable acc
  hint: Check the variable name
   |
22 |       acc
   |       ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:22:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
22 |       acc
   |       ^^^

24 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let stack = list.new[String]() in 
  list.fold(string.chars(s), stack, (acc, c) => 
    if c == '(' || c == '[' || c == '{' then 
      list.push(acc, string.to_string(c)) 
    else if c == ')' then 
      if list.is_empty(acc) || list.last(acc) != '(' then 
        false 
      else 
        list.drop_end(acc, 1) 
    else if c == ']' then 
      if list.is_empty(acc) || list.last(acc) != '[' then 
        false 
      else 
        list.drop_end(acc, 1) 
    else if c == '}' then 
      if list.is_empty(acc) || list.last(acc) != '{' then 
        false 
      else 
        list.drop_end(acc, 1) 
    else 
      acc 
  ) == list.new[String]()
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: '||' is not valid in Almide at line 4:17
  --> /tmp/dojo-balanced-parens-3.almd:4:17
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     if c == '(' || c == '[' || c == '{' then
  |                 ^
error: Expected expression at line 6:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:6:5
  |
6 |     else if c == ')' then
  |     ^
error: '||' is not valid in Almide at line 7:29
  --> /tmp/dojo-balanced-parens-3.almd:7:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
7 |       if list.is_empty(acc) || list.last(acc) != '(' then
  |                             ^
error: Expected expression at line 11:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:11:5
   |
11 |     else if c == ']' then
   |     ^
error: '||' is not valid in Almide at line 12:29
  --> /tmp/dojo-balanced-parens-3.almd:12:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
12 |       if list.is_empty(acc) || list.last(acc) != '[' then
   |                             ^
error: Expected expression at line 16:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:16:5
   |
16 |     else if c == '}' then
   |     ^
error: '||' is not valid in Almide at line 17:29
  --> /tmp/dojo-balanced-parens-3.almd:17:29
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
17 |       if list.is_empty(acc) || list.last(acc) != '{' then
   |                             ^
error: Expected expression at line 21:5 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:21:5
   |
21 |     else
   |     ^
error: Expected expression at line 23:3 (got RParen ')')
  --> /tmp/dojo-balanced-parens-3.almd:23:3
   |
23 |   ) == list.new[String]()
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:5:17
  in variable acc
  hint: Check the variable name
  |
5 |       list.push(acc, string.to_string(c))
  |                 ^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:5:39
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-balanced-parens-3.almd:5:39
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
5 |       list.push(acc, string.to_string(c))
  |                                       ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:10:23
  in variable acc
  hint: Check the variable name
   |
10 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:15:23
  in variable acc
  hint: Check the variable name
   |
15 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:20:23
  in variable acc
  hint: Check the variable name
   |
20 |         list.drop_end(acc, 1)
   |                       ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-balanced-parens-3.almd:22:7
  in variable acc
  hint: Check the variable name
   |
22 |       acc
   |       ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:22:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
22 |       acc
   |       ^^^

18 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
