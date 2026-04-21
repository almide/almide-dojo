# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
  let brackets = ['(', ')', '[', ']', '{', '}']
  let bracket_map = Map[Char, Char]{
    '(' => ')',
    '[' => ']',
    '{' => '}',
  }
  let stack = list.new[String]()
  for c in string.chars(s) {
    if brackets.contains(c) {
      if bracket_map.contains(c) {
        list.push(stack, c)
      } else {
        if list.is_empty(stack) {
          return false
        }
        let last = list.last(stack)
        if bracket_map.get(last) != Some(c) {
          return false
        }
        list.drop_end(stack, 1)
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-balanced-parens-0.almd:1:35
  hint: Almide requires '=' before the body. Write: fn is_balanced(...) -> Type = { ... }
  |
1 | fn is_balanced(s: String) -> Bool {
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let brackets = ['(', ')', '[', ']', '{', '}']
  let bracket_map = Map[Char, Char]{
    '(' => ')',
    '[' => ']',
    '{' => '}',
  }
  let stack = list.new[String]()
  for c in string.chars(s) {
    if brackets.contains(c) {
      if bracket_map.contains(c) {
        list.push(stack, c)
      } else {
        if list.is_empty(stack) {
          return false
        }
        let last = list.last(stack)
        if bracket_map.get(last) != Some(c) {
          return false
        }
        list.drop_end(stack, 1)
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected expression at line 4:9 (got FatArrow '=>')
  --> /tmp/dojo-balanced-parens-1.almd:4:9
  |
4 |     '(' => ')',
  |         ^
error: Expected Then at line 10:29 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:10:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |     if brackets.contains(c) {
   |                             ^
error: Expected Then at line 11:34 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:11:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |       if bracket_map.contains(c) {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:13:9
   |
13 |       } else {
   |         ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:8:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
8 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:12:26
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
12 |         list.push(stack, c)
   |                          ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:12:26
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
12 |         list.push(stack, c)
   |                          ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let brackets = ['(', ')', '[', ']', '{', '}']
  let bracket_map = Map[Char, Char]{
    '(' => ')',
    '[' => ']',
    '{' => '}',
  }
  let stack = []
  for c in string.chars(s) {
    if brackets.contains(c) {
      if bracket_map.contains(c) {
        stack = stack + [c]
      } else {
        if list.is_empty(stack) {
          return false
        }
        let last = list.last(stack)
        if bracket_map.get(last) != Some(c) {
          return false
        }
        stack = list.drop_end(stack, 1)
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected expression at line 4:9 (got FatArrow '=>')
  --> /tmp/dojo-balanced-parens-2.almd:4:9
  |
4 |     '(' => ')',
  |         ^
error: Expected Then at line 10:29 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:10:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |     if brackets.contains(c) {
   |                             ^
error: Expected Then at line 11:34 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:11:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |       if bracket_map.contains(c) {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:13:9
   |
13 |       } else {
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:12:26
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
12 |         stack = stack + [c]
   |                          ^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:12:26
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 8 |   let stack = []
   |   --------------------- 'stack' declared here
...
12 |         stack = stack + [c]
   |                          ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:12:26
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
12 |         stack = stack + [c]
   |                          ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let brackets = ['(', ')', '[', ']', '{', '}']
  let bracket_map = Map[Char, Char]{
    '(' => ')',
    '[' => ']',
    '{' => '}',
  }
  var stack = []
  for c in string.chars(s) {
    if brackets.contains(c) {
      if bracket_map.contains(c) {
        stack = stack + [c]
      } else {
        if list.is_empty(stack) {
          return false
        }
        let last = list.last(stack)
        if bracket_map.get(last) != Some(c) {
          return false
        }
        stack = list.drop_end(stack, 1)
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected expression at line 4:9 (got FatArrow '=>')
  --> /tmp/dojo-balanced-parens-3.almd:4:9
  |
4 |     '(' => ')',
  |         ^
error: Expected Then at line 10:29 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:10:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |     if brackets.contains(c) {
   |                             ^
error: Expected Then at line 11:34 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:11:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
11 |       if bracket_map.contains(c) {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:9 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:13:9
   |
13 |       } else {
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:12:26
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
12 |         stack = stack + [c]
   |                          ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:12:26
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
12 |         stack = stack + [c]
   |                          ^

6 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
