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
  let opening = ['(', '[', '{']
  let closing = [')', ']', '}']
  let stack = list.new()
  for c in string.chars(s) {
    if list.contains(opening, c) {
      list.push(stack, c)
    } else if list.contains(closing, c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      if (c == ')' && last != '(') || (c == ']' && last != '[') || (c == '}' && last != '{') {
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
  let brackets = ['(', ')', '[', ']', '{', '}']
  let opening = ['(', '[', '{']
  let closing = [')', ']', '}']
  let stack = list.new()
  for c in string.chars(s) {
    if list.contains(opening, c) {
      list.push(stack, c)
    } else if list.contains(closing, c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      if (c == ')' && last != '(') || (c == ']' && last != '[') || (c == '}' && last != '{') {
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
error: Expected Then at line 7:34 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:7:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |     if list.contains(opening, c) {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:9:7
  |
9 |     } else if list.contains(closing, c) {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:5:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
5 |   let stack = list.new()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:8:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
8 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:8:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
8 |       list.push(stack, c)
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
  let brackets = ['(', ')', '[', ']', '{', '}']
  let opening = ['(', '[', '{']
  let closing = [')', ']', '}']
  let stack = []
  for c in string.chars(s) {
    if list.contains(opening, c) {
      stack = stack + [c]
    } else if list.contains(closing, c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      if (c == ')' && last != '(') || (c == ']' && last != '[') || (c == '}' && last != '{') {
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
error: Expected Then at line 7:34 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:7:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |     if list.contains(opening, c) {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:9:7
  |
9 |     } else if list.contains(closing, c) {
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:8:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
8 |       stack = stack + [c]
  |                        ^
error[E009]: cannot reassign immutable binding 'stack'
  --> /tmp/dojo-balanced-parens-2.almd:8:24
  in stack = ...
  hint: Use 'var stack = ...' instead of 'let stack = ...' to declare a mutable variable
  try:
      // let stack = ...  →  var stack = ...
      var stack = <initial value>
  |
5 |   let stack = []
  |   --------------------- 'stack' declared here
...
8 |       stack = stack + [c]
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:8:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
8 |       stack = stack + [c]
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
  let brackets = ['(', ')', '[', ']', '{', '}']
  let opening = ['(', '[', '{']
  let closing = [')', ']', '}']
  var stack = []
  for c in string.chars(s) {
    if list.contains(opening, c) {
      stack = stack + [c]
    } else if list.contains(closing, c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      if (c == ')' && last != '(') || (c == ']' && last != '[') || (c == '}' && last != '{') {
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
error: Expected Then at line 7:34 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:7:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |     if list.contains(opening, c) {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:9:7
  |
9 |     } else if list.contains(closing, c) {
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:8:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
8 |       stack = stack + [c]
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:8:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
8 |       stack = stack + [c]
  |                        ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
