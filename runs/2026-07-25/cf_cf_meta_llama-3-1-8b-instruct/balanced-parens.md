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
    match c {
      '(' => list.push(stack, ')')
      '[' => list.push(stack, ']')
      '{' => list.push(stack, '}')
      _ => () // ignore non-bracket characters
      ')' => if list.is_empty(stack) or list.last(stack) != '(' then false else list.drop_end(stack, 1)
      ']' => if list.is_empty(stack) or list.last(stack) != '[' then false else list.drop_end(stack, 1)
      '}' => if list.is_empty(stack) or list.last(stack) != '{' then false else list.drop_end(stack, 1)
    }
  }
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-0.almd:13:3
   |
13 |   }
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-0.almd:4:11
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
4 |     match c {
  |           ^
error[E001]: type mismatch in if branches: expected Bool but got List[?2]
  --> /tmp/dojo-balanced-parens-0.almd:9:102
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
9 |       ')' => if list.is_empty(stack) or list.last(stack) != '(' then false else list.drop_end(stack, 1)
  |                                                                                                      ^
error[E001]: type mismatch in if branches: expected Bool but got List[?5]
  --> /tmp/dojo-balanced-parens-0.almd:10:102
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
10 |       ']' => if list.is_empty(stack) or list.last(stack) != '[' then false else list.drop_end(stack, 1)
   |                                                                                                      ^
error[E001]: type mismatch in if branches: expected Bool but got List[?8]
  --> /tmp/dojo-balanced-parens-0.almd:11:102
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |       '}' => if list.is_empty(stack) or list.last(stack) != '{' then false else list.drop_end(stack, 1)
   |                                                                                                      ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-0.almd:11:102
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       '}' => if list.is_empty(stack) or list.last(stack) != '{' then false else list.drop_end(stack, 1)
   |                                                                                                      ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-0.almd:11:102
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       '}' => if list.is_empty(stack) or list.last(stack) != '{' then false else list.drop_end(stack, 1)
   |                                                                                                      ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-0.almd:11:102
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
11 |       '}' => if list.is_empty(stack) or list.last(stack) != '{' then false else list.drop_end(stack, 1)
   |                                                                                                      ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:11:102
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
11 |       '}' => if list.is_empty(stack) or list.last(stack) != '{' then false else list.drop_end(stack, 1)
   |                                                                                                      ^

11 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ')')
      '[' => list.push(stack, ']')
      '{' => list.push(stack, '}')
      _ => () // ignore non-bracket characters
      ')' => if list.is_empty(stack) then false
             else if list.last(stack) == '(' then list.drop_end(stack, 1)
                   else false
      ']' => if list.is_empty(stack) then false
             else if list.last(stack) == '[' then list.drop_end(stack, 1)
                   else false
      '}' => if list.is_empty(stack) then false
             else if list.last(stack) == '{' then list.drop_end(stack, 1)
                   else false
    }
  }
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:19:3
   |
19 |   }
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:4:11
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
4 |     match c {
  |           ^
error[E001]: type mismatch in if branches: expected List[?2] but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?2]
  --> /tmp/dojo-balanced-parens-1.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected List[?5] but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:14:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
14 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?5]
  --> /tmp/dojo-balanced-parens-1.almd:14:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
14 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected List[?8] but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:17:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?8]
  --> /tmp/dojo-balanced-parens-1.almd:17:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:17:25
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:17:25
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-1.almd:17:25
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:17:25
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
17 |                    else false
   |                         ^^^^^

14 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ')')
      '[' => list.push(stack, ']')
      '{' => list.push(stack, '}')
      _ => () // ignore non-bracket characters
      ')' => if list.is_empty(stack) then false
             else if list.last(stack) == '(' then list.drop_end(stack, 1)
                   else false
      ']' => if list.is_empty(stack) then false
             else if list.last(stack) == '[' then list.drop_end(stack, 1)
                   else false
      '}' => if list.is_empty(stack) then false
             else if list.last(stack) == '{' then list.drop_end(stack, 1)
                   else false
      _ => () // every match arm must return the same type
    }
  }
  list.is_empty(stack)

fn is_balanced(s: String) -> Bool =
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ')')
      '[' => list.push(stack, ']')
      '{' =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:3:28
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:3 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-2.almd:20:3
   |
20 |   }
   |   ^
error: Expected LBrace at line 25:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:25:28
   |
25 |   for c in string.chars(s) do
   |                            ^
error: Expected expression at line 31:1 (got Test 'test')
  --> /tmp/dojo-balanced-parens-2.almd:31:1
   |
31 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 23
  in fn is_balanced
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
23 | fn is_balanced(s: String) -> Bool =
   | ^^^^^^^^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:4:11
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
4 |     match c {
  |           ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:24:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
24 |   let stack = list.new[String]()
   |                       ^
error[E001]: type mismatch in if branches: expected List[?2] but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?2]
  --> /tmp/dojo-balanced-parens-2.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected List[?5] but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:14:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
14 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?5]
  --> /tmp/dojo-balanced-parens-2.almd:14:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
14 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected List[?8] but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:17:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?8]
  --> /tmp/dojo-balanced-parens-2.almd:17:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:18:12
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
18 |       _ => () // every match arm must return the same type
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:18:12
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
18 |       _ => () // every match arm must return the same type
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-2.almd:18:12
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
18 |       _ => () // every match arm must return the same type
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:18:12
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
18 |       _ => () // every match arm must return the same type
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:24:23
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
24 |   let stack = list.new[String]()
   |                       ^

19 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ')')
      '[' => list.push(stack, ']')
      '{' => list.push(stack, '}')
      _ => () // ignore non-bracket characters
      ')' => if list.is_empty(stack) then false
             else if list.last(stack) == '(' then list.drop_end(stack, 1)
                   else false
      ']' => if list.is_empty(stack) then false
             else if list.last(stack) == '[' then list.drop_end(stack, 1)
                   else false
      '}' => if list.is_empty(stack) then false
             else if list.last(stack) == '{' then list.drop_end(stack, 1)
                   else false
      _ => () // every match arm must return the same type
    }
  list.is_empty(stack)

fn is_balanced(s: String) -> Bool =
  let stack = list.new[String]()
  for c in string.chars(s) do
    match c {
      '(' => list.push(stack, ')')
      '[' => list.push(stack, ']')
      '{' => list.push
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected LBrace at line 3:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:3:28
  |
3 |   for c in string.chars(s) do
  |                            ^
error: Expected LBrace at line 24:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:24:28
   |
24 |   for c in string.chars(s) do
   |                            ^
error: Expected pattern at line 30:1 (got Test 'test')
  --> /tmp/dojo-balanced-parens-3.almd:30:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 | test "balanced empty" { assert_eq(is_balanced(""), true) }
   | ^
error[E012]: duplicate function 'is_balanced'
  at line 22
  in fn is_balanced
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn is_balanced(s: String) -> Bool =
   | -------------------------------------- first definition of 'is_balanced' here
...
22 | fn is_balanced(s: String) -> Bool =
   | ^^^^^^^^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:4:11
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
4 |     match c {
  |           ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:23:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
23 |   let stack = list.new[String]()
   |                       ^
error[E001]: type mismatch in if branches: expected List[?2] but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?2]
  --> /tmp/dojo-balanced-parens-3.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
11 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected List[?5] but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:14:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
14 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?5]
  --> /tmp/dojo-balanced-parens-3.almd:14:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
14 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected List[?8] but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:17:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in if branches: expected Bool but got List[?8]
  --> /tmp/dojo-balanced-parens-3.almd:17:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
17 |                    else false
   |                         ^^^^^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:18:12
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
18 |       _ => () // every match arm must return the same type
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:18:12
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
18 |       _ => () // every match arm must return the same type
   |            ^
error[E001]: type mismatch in match arm: expected Unit but got Bool
  --> /tmp/dojo-balanced-parens-3.almd:18:12
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce Bool.
      //   match expr {
      //     PatA => value_a,   // <-- must be Bool
      //     PatB => value_b,
      //   }
   |
18 |       _ => () // every match arm must return the same type
   |            ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:23:23
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
23 |   let stack = list.new[String]()
   |                       ^

17 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
