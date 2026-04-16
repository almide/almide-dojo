# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let xs = list.from_iter(string.chars(s), (c) => match c {
    '(' => list.push(list.new(), c)
    '[' => list.push(list.new(), c)
    '{' => list.push(list.new(), c)
    ')' => match list.last(list.last(xs)) {
      '(' => list.drop_end(xs, 1)
      _ => xs
    }
    ']' => match list.last(list.last(xs)) {
      '[' => list.drop_end(xs, 1)
      _ => xs
    }
    '}' => match list.last(list.last(xs)) {
      '{' => list.drop_end(xs, 1)
      _ => xs
    }
    _ => xs
  })
  in list.is_empty(xs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:3:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     '(' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:4:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     '[' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:5:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
5 |     '{' => list.push(list.new(), c)
  |                              ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:6:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-0.almd:6:38
  in call to list.last()
  hint: Fix the argument type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:7:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
7 |       '(' => list.drop_end(xs, 1)
  |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:8:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
8 |       _ => xs
  |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:10:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-0.almd:10:38
  in call to list.last()
  hint: Fix the argument type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:11:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
11 |       '[' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:12:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
12 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:14:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-0.almd:14:38
  in call to list.last()
  hint: Fix the argument type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:15:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
15 |       '{' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:16:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
16 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-0.almd:18:10
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
18 |     _ => xs
   |          ^^
error[E002]: undefined function 'list.from_iter'
  --> /tmp/dojo-balanced-parens-0.almd:18:10
  in call to list.from_iter()
  hint: No function 'from_iter' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-0.almd:6:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-0.almd:10:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-0.almd:14:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?3]
  --> /tmp/dojo-balanced-parens-0.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?3].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?3]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?6]
  --> /tmp/dojo-balanced-parens-0.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?6].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?6]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?9]
  --> /tmp/dojo-balanced-parens-0.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?9].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?9]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^

23 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let xs = list.from_iter(string.chars(s), (c) => match c {
    '(' => list.push(list.new(), c)
    '[' => list.push(list.new(), c)
    '{' => list.push(list.new(), c)
    ')' => match list.last(list.last(xs)) {
      '(' => list.drop_end(xs, 1)
      _ => xs
    }
    ']' => match list.last(list.last(xs)) {
      '[' => list.drop_end(xs, 1)
      _ => xs
    }
    '}' => match list.last(list.last(xs)) {
      '{' => list.drop_end(xs, 1)
      _ => xs
    }
    _ => xs
  })
  in match xs {
    [] => true
    _ => false
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:3:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     '(' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:4:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     '[' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:5:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
5 |     '{' => list.push(list.new(), c)
  |                              ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:6:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-1.almd:6:38
  in call to list.last()
  hint: Fix the argument type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:7:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
7 |       '(' => list.drop_end(xs, 1)
  |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:8:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
8 |       _ => xs
  |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:10:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-1.almd:10:38
  in call to list.last()
  hint: Fix the argument type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:11:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
11 |       '[' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:12:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
12 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:14:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-1.almd:14:38
  in call to list.last()
  hint: Fix the argument type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:15:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
15 |       '{' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:16:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
16 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-1.almd:18:10
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
18 |     _ => xs
   |          ^^
error[E002]: undefined function 'list.from_iter'
  --> /tmp/dojo-balanced-parens-1.almd:18:10
  in call to list.from_iter()
  hint: No function 'from_iter' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-1.almd:6:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-1.almd:10:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-1.almd:14:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?3]
  --> /tmp/dojo-balanced-parens-1.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?3].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?3]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?6]
  --> /tmp/dojo-balanced-parens-1.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?6].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?6]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?9]
  --> /tmp/dojo-balanced-parens-1.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?9].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?9]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^

23 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let xs = list.from_iter(string.chars(s), (c) => match c {
    '(' => list.push(list.new(), c)
    '[' => list.push(list.new(), c)
    '{' => list.push(list.new(), c)
    ')' => match list.last(list.last(xs)) {
      '(' => list.drop_end(xs, 1)
      _ => xs
    }
    ']' => match list.last(list.last(xs)) {
      '[' => list.drop_end(xs, 1)
      _ => xs
    }
    '}' => match list.last(list.last(xs)) {
      '{' => list.drop_end(xs, 1)
      _ => xs
    }
    _ => xs
  })
  in match xs {
    [] => true
    _ => false
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:3:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     '(' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:4:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     '[' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:5:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
5 |     '{' => list.push(list.new(), c)
  |                              ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:6:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-2.almd:6:38
  in call to list.last()
  hint: Fix the argument type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:7:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
7 |       '(' => list.drop_end(xs, 1)
  |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:8:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
8 |       _ => xs
  |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:10:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-2.almd:10:38
  in call to list.last()
  hint: Fix the argument type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:11:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
11 |       '[' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:12:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
12 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:14:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-2.almd:14:38
  in call to list.last()
  hint: Fix the argument type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:15:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
15 |       '{' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:16:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
16 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-2.almd:18:10
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
18 |     _ => xs
   |          ^^
error[E002]: undefined function 'list.from_iter'
  --> /tmp/dojo-balanced-parens-2.almd:18:10
  in call to list.from_iter()
  hint: No function 'from_iter' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-2.almd:6:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-2.almd:10:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-2.almd:14:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?3]
  --> /tmp/dojo-balanced-parens-2.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?3].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?3]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?6]
  --> /tmp/dojo-balanced-parens-2.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?6].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?6]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?9]
  --> /tmp/dojo-balanced-parens-2.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?9].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?9]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^

23 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool =
  let xs = list.from_iter(string.chars(s), (c) => match c {
    '(' => list.push(list.new(), c)
    '[' => list.push(list.new(), c)
    '{' => list.push(list.new(), c)
    ')' => match list.last(list.last(xs)) {
      '(' => list.drop_end(xs, 1)
      _ => xs
    }
    ']' => match list.last(list.last(xs)) {
      '[' => list.drop_end(xs, 1)
      _ => xs
    }
    '}' => match list.last(list.last(xs)) {
      '{' => list.drop_end(xs, 1)
      _ => xs
    }
    _ => xs
  })
  in match xs {
    [] => true
    _ => false
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:3:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
3 |     '(' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:4:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     '[' => list.push(list.new(), c)
  |                              ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:5:30
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
5 |     '{' => list.push(list.new(), c)
  |                              ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:6:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-3.almd:6:38
  in call to list.last()
  hint: Fix the argument type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:7:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
7 |       '(' => list.drop_end(xs, 1)
  |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:8:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
  |
8 |       _ => xs
  |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:10:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-3.almd:10:38
  in call to list.last()
  hint: Fix the argument type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:11:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
11 |       '[' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:12:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
12 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:14:38
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E005]: argument 'xs' expects List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-3.almd:14:38
  in call to list.last()
  hint: Fix the argument type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:15:28
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
15 |       '{' => list.drop_end(xs, 1)
   |                            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:16:12
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
16 |       _ => xs
   |            ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-balanced-parens-3.almd:18:10
  in variable xs
  hint: Did you mean `s`?
  try:
      // xs  →  s
      s
   |
18 |     _ => xs
   |          ^^
error[E002]: undefined function 'list.from_iter'
  --> /tmp/dojo-balanced-parens-3.almd:18:10
  in call to list.from_iter()
  hint: No function 'from_iter' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?1]
  --> /tmp/dojo-balanced-parens-3.almd:6:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
  |
6 |     ')' => match list.last(list.last(xs)) {
  |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?4]
  --> /tmp/dojo-balanced-parens-3.almd:10:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
10 |     ']' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in call to list.last(): expected List[A] but got Option[?7]
  --> /tmp/dojo-balanced-parens-3.almd:14:38
  in call to list.last()
  hint: Fix the expression type or change the expected type
   |
14 |     '}' => match list.last(list.last(xs)) {
   |                                      ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?3]
  --> /tmp/dojo-balanced-parens-3.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?3].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?3]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?6]
  --> /tmp/dojo-balanced-parens-3.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?6].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?6]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^
error[E001]: type mismatch in match arm: expected Unit but got List[?9]
  --> /tmp/dojo-balanced-parens-3.almd:18:10
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  try:
      // a match arm is a statement (returns Unit). Each arm must produce List[?9].
      //   match expr {
      //     PatA => value_a,   // <-- must be List[?9]
      //     PatB => value_b,
      //   }
   |
18 |     _ => xs
   |          ^^

23 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
