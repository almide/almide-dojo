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
      '(' -> list.push(stack, "(")
      '[' -> list.push(stack, "[")
      '{' -> list.push(stack, "{")
      _ -> () 
      ')' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "(" then 
            false 
          else 
            list.drop_end(stack, 1)
      ']' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "[" then 
            false 
          else 
            list.drop_end(stack, 1)
      '}' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "{" then 
            false 
          else 
            list.drop_end(stack, 1)
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:13:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 18:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-0.almd:18:11
   |
18 |       ']' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:22:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 27:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-0.almd:27:11
   |
27 |       '}' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-0.almd:31:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
31 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 36:9 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-0.almd:36:9
   |
36 |       _ -> ()
   |         ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-0.almd:14:14
  in variable last
  hint: Check the variable name
   |
14 |           if last != "(" then
   |              ^^^^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-0.almd:23:14
  in variable last
  hint: Check the variable name
   |
23 |           if last != "[" then
   |              ^^^^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-0.almd:32:14
  in variable last
  hint: Check the variable name
   |
32 |           if last != "{" then
   |              ^^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-0.almd:37:5
  in variable end
  hint: Check the variable name
   |
37 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-0.almd:38:3
  in variable end
  hint: Check the variable name
   |
38 |   end;
   |   ^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?0]
  --> /tmp/dojo-balanced-parens-0.almd:17:34
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
17 |             list.drop_end(stack, 1)
   |                                  ^
error[E001]: type mismatch in if branches: expected Bool but got List[?1]
  --> /tmp/dojo-balanced-parens-0.almd:26:34
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
26 |             list.drop_end(stack, 1)
   |                                  ^
error[E001]: type mismatch in if branches: expected Bool but got List[?2]
  --> /tmp/dojo-balanced-parens-0.almd:35:34
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
35 |             list.drop_end(stack, 1)
   |                                  ^

17 error(s) found
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
      '(' -> stack = stack + [c]
      '[' -> stack = stack + [c]
      '{' -> stack = stack + [c]
      ')' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "(" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
      ']' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "[" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
      '}' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "{" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:12:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 17:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-1.almd:17:11
   |
17 |       ']' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:21:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 26:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-1.almd:26:11
   |
26 |       '}' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-1.almd:30:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
30 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 35:9 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-1.almd:35:9
   |
35 |       _ -> ()
   |         ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-1.almd:13:14
  in variable last
  hint: Check the variable name
   |
13 |           if last != "(" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:16:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
16 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-1.almd:22:14
  in variable last
  hint: Check the variable name
   |
22 |           if last != "[" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:25:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
25 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-1.almd:31:14
  in variable last
  hint: Check the variable name
   |
31 |           if last != "{" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-1.almd:34:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
34 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-1.almd:36:5
  in variable end
  hint: Check the variable name
   |
36 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-1.almd:37:3
  in variable end
  hint: Check the variable name
   |
37 |   end;
   |   ^^^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:16:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
16 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:25:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
25 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:34:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
34 |             stack = list.drop_end(stack, 1)
   |                                          ^

19 error(s) found
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
      '(' -> stack = stack + [c]
      '[' -> stack = stack + [c]
      '{' -> stack = stack + [c]
      ')' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "(" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
      ']' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "[" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
      '}' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "{" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:12:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 17:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-2.almd:17:11
   |
17 |       ']' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:21:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 26:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-2.almd:26:11
   |
26 |       '}' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-2.almd:30:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
30 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 35:9 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-2.almd:35:9
   |
35 |       _ -> ()
   |         ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-2.almd:13:14
  in variable last
  hint: Check the variable name
   |
13 |           if last != "(" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:16:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
16 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-2.almd:22:14
  in variable last
  hint: Check the variable name
   |
22 |           if last != "[" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:25:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
25 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-2.almd:31:14
  in variable last
  hint: Check the variable name
   |
31 |           if last != "{" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:34:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
34 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-2.almd:36:5
  in variable end
  hint: Check the variable name
   |
36 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-2.almd:37:3
  in variable end
  hint: Check the variable name
   |
37 |   end;
   |   ^^^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:16:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
16 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:25:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
25 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:34:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
34 |             stack = list.drop_end(stack, 1)
   |                                          ^

19 error(s) found
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
      '(' -> stack = stack + [c]
      '[' -> stack = stack + [c]
      '{' -> stack = stack + [c]
      ')' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "(" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
      ']' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "[" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
      '}' -> 
        if list.is_empty(stack) then 
          false 
        else 
          let last = list.last(stack) in 
          if last != "{" then 
            false 
          else 
            stack = list.drop_end(stack, 1)
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:12:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 17:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-3.almd:17:11
   |
17 |       ']' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:21:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 26:11 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-3.almd:26:11
   |
26 |       '}' ->
   |           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-balanced-parens-3.almd:30:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
30 |           let last = list.last(stack) in
   |           ^^^
error: Expected expression at line 35:9 (got Arrow '->')
  --> /tmp/dojo-balanced-parens-3.almd:35:9
   |
35 |       _ -> ()
   |         ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-3.almd:13:14
  in variable last
  hint: Check the variable name
   |
13 |           if last != "(" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:16:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
16 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-3.almd:22:14
  in variable last
  hint: Check the variable name
   |
22 |           if last != "[" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:25:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
25 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'last'
  --> /tmp/dojo-balanced-parens-3.almd:31:14
  in variable last
  hint: Check the variable name
   |
31 |           if last != "{" then
   |              ^^^^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-3.almd:34:42
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 2 |   let stack = []
   |   --------------------- 'stack' declared here
...
34 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-3.almd:36:5
  in variable end
  hint: Check the variable name
   |
36 |     end
   |     ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-balanced-parens-3.almd:37:3
  in variable end
  hint: Check the variable name
   |
37 |   end;
   |   ^^^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:16:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
16 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:25:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
25 |             stack = list.drop_end(stack, 1)
   |                                          ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:34:42
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `stack = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Bool.
      // Rewrite as a rebinding of `stack`:
      //
      //   let new_stack = if cond then <new-value-for-stack> else stack
      //
      // Or, if stack is a loop-like accumulator, use recursion instead of mutation.
   |
34 |             stack = list.drop_end(stack, 1)
   |                                          ^

19 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
