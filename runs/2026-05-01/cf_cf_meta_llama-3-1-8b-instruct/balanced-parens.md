# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
  let stack = list.new[String]()
  for c in string.chars(s) {
    if list.is_empty(stack) {
      list.push(stack, c)
    } else {
      let last = list.last(stack)
      match (c, last) {
        ("(", ")") => list.drop_end(stack, 1),
        ("[", "]") => list.drop_end(stack, 1),
        ("{", "}") => list.drop_end(stack, 1),
        _ => list.push(stack, c)
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
  let stack = list.new[String]()
  for c in string.chars(s) {
    if list.is_empty(stack) {
      list.push(stack, c)
    } else {
      let last = list.last(stack)
      match (c, last) {
        ("(", ")") => list.drop_end(stack, 1),
        ("[", "]") => list.drop_end(stack, 1),
        ("{", "}") => list.drop_end(stack, 1),
        _ => list.push(stack, c)
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected Then at line 4:29 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:4:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if list.is_empty(stack) {
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:6:7
  |
6 |     } else {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:5:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:5:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(stack, c)
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
  let stack = list.new[String]()
  for c in string.chars(s) {
    if list.is_empty(stack) {
      list.push(stack, c)
    } else {
      let last = list.last(stack)
      match (c, last) {
        ("(", ")") => if list.last(stack) == "(" then list.drop_end(stack, 1) else list.push(stack, c),
        ("[", "]") => if list.last(stack) == "[" then list.drop_end(stack, 1) else list.push(stack, c),
        ("{", "}") => if list.last(stack) == "{" then list.drop_end(stack, 1) else list.push(stack, c),
        _ => list.push(stack, c)
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected Then at line 4:29 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:4:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if list.is_empty(stack) {
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:6:7
  |
6 |     } else {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:5:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:5:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(stack, c)
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
  let stack = list.new[String]()
  for c in string.chars(s) {
    if list.is_empty(stack) {
      list.push(stack, c)
    } else {
      let last = list.last(stack)
      match (c, last) {
        ("(", ")") => if last == "(" then list.drop_end(stack, 1) else list.push(stack, c),
        ("[", "]") => if last == "[" then list.drop_end(stack, 1) else list.push(stack, c),
        ("{", "}") => if last == "{" then list.drop_end(stack, 1) else list.push(stack, c),
        _ => list.push(stack, c)
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected Then at line 4:29 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:4:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     if list.is_empty(stack) {
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:6:7
  |
6 |     } else {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:5:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:5:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(stack, c)
  |                        ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
