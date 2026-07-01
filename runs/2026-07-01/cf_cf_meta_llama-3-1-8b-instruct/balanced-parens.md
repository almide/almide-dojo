# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
  let brackets = string.chars(s)
  let opening_brackets = ['(', '[', '{']
  let closing_brackets = [')', ']', '}']
  let bracket_pairs = [('(', ')'), ('[', ']'), ('{', '}')]
  let stack = list.new()

  for c in brackets {
    if list.contains(opening_brackets, c) {
      list.push(stack, c)
    } else if list.contains(closing_brackets, c) {
      if list.is_empty(stack) {
        return false
      }
      let last_opening = list.last(stack)
      let pair = list.find(bracket_pairs, (x, y) => x == last_opening && y == c)
      if pair.is_none() {
        return false
      }
      list.drop_end(stack, 1)
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
  let brackets = string.chars(s)
  let opening_brackets = ['(', '[', '{']
  let closing_brackets = [')', ']', '}']
  let bracket_pairs = [('(', ')'), ('[', ']'), ('{', '}')]
  let stack = list.new()

  for c in brackets {
    if list.contains(opening_brackets, c) {
      list.push(stack, c)
    } else if list.contains(closing_brackets, c) {
      if list.is_empty(stack) {
        return false
      }
      let last_opening = list.last(stack)
      let pair = list.find(bracket_pairs, (x, y) => x == last_opening && y == c)
      if pair.is_none() {
        return false
      }
      list.drop_end(stack, 1)
    }
  }

  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected Then at line 9:43 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:9:43
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if list.contains(opening_brackets, c) {
  |                                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:11:7
   |
11 |     } else if list.contains(closing_brackets, c) {
   |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:6:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
6 |   let stack = list.new()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:10:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
10 |       list.push(stack, c)
   |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:10:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
10 |       list.push(stack, c)
   |                        ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let brackets = string.chars(s)
  let opening_brackets = ['(', '[', '{']
  let closing_brackets = [')', ']', '}']
  let bracket_pairs = [('(', ')'), ('[', ']'), ('{', '}')]
  let stack = []

  for c in brackets {
    if list.contains(opening_brackets, c) {
      stack = stack + [c]
    } else if list.contains(closing_brackets, c) {
      if list.is_empty(stack) {
        return false
      }
      let last_opening = list.last(stack)
      let pair = list.find(bracket_pairs, (x, y) => x == last_opening && y == c)
      if pair.is_none() {
        return false
      }
      stack = list.drop_end(stack, 1)
    }
  }

  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected Then at line 9:43 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:9:43
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if list.contains(opening_brackets, c) {
  |                                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:11:7
   |
11 |     } else if list.contains(closing_brackets, c) {
   |       ^
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
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:10:24
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
   |
 6 |   let stack = []
   |   --------------------- 'stack' declared here
...
10 |       stack = stack + [c]
   |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:10:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
10 |       stack = stack + [c]
   |                        ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let brackets = string.chars(s)
  let opening_brackets = ['(', '[', '{']
  let closing_brackets = [')', ']', '}']
  let bracket_pairs = [('(', ')'), ('[', ']'), ('{', '}')]
  var stack = []

  for c in brackets {
    if list.contains(opening_brackets, c) {
      stack = stack + [c]
    } else if list.contains(closing_brackets, c) {
      if list.is_empty(stack) {
        return false
      }
      let last_opening = list.last(stack)
      let pair = list.find(bracket_pairs, (x, y) => x == last_opening && y == c)
      if pair.is_none() {
        return false
      }
      stack = list.drop_end(stack, 1)
    }
  }

  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected Then at line 9:43 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:9:43
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if list.contains(opening_brackets, c) {
  |                                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:11:7
   |
11 |     } else if list.contains(closing_brackets, c) {
   |       ^
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
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:10:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
   |
10 |       stack = stack + [c]
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
