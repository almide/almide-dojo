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
  let bracket_map = map.new[String, String]()

  bracket_map.set("(", ")")
  bracket_map.set("[", "]")
  bracket_map.set("{", "}")

  for c in string.chars(s) {
    if bracket_map.contains(c) {
      stack.push(c)
    } else if stack.is_empty() || bracket_map.get(stack.last()).unwrap() != c {
      return false
    } else {
      stack.drop_end()
    }
  }

  stack.is_empty()
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
  let bracket_map = map.new[String, String]()
  bracket_map.set("(", ")")
  bracket_map.set("[", "]")
  bracket_map.set("{", "}")
  for c in string.chars(s) {
    if bracket_map.contains(c) {
      stack.push(c)
    } else if stack.is_empty() || bracket_map.get(stack.last()).unwrap() != c {
      return false
    } else {
      stack.drop_end()
    }
  }
  stack.is_empty()
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected Then at line 8:32 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:8:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if bracket_map.contains(c) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:10:7
   |
10 |     } else if stack.is_empty() || bracket_map.get(stack.last()).unwrap() != c {
   |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:9:18
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
9 |       stack.push(c)
  |                  ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let stack = []
  let bracket_map = map.new[String, String]()
  bracket_map.set("(", ")")
  bracket_map.set("[", "]")
  bracket_map.set("{", "}")
  for c in string.chars(s) {
    if bracket_map.contains(c) {
      stack.push(c)
    } else if stack.is_empty() || bracket_map.get(stack.last()).unwrap() != c {
      return false
    } else {
      stack.drop_end()
    }
  }
  stack.is_empty()
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected Then at line 8:32 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:8:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if bracket_map.contains(c) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:10:7
   |
10 |     } else if stack.is_empty() || bracket_map.get(stack.last()).unwrap() != c {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:9:18
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
9 |       stack.push(c)
  |                  ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:9:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |       stack.push(c)
  |       ^^^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let stack = []
  let bracket_map = map.new[String, String]()
  bracket_map.set("(", ")")
  bracket_map.set("[", "]")
  bracket_map.set("{", "}")
  for c in string.chars(s) {
    if bracket_map.contains(c) {
      stack.push(c)
    } else if !stack.is_empty() && bracket_map.get(stack.last()).unwrap() != c {
      return false
    } else if !stack.is_empty() {
      stack.drop_end()
    }
  }
  stack.is_empty()
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected Then at line 8:32 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:8:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if bracket_map.contains(c) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:10:7
   |
10 |     } else if !stack.is_empty() && bracket_map.get(stack.last()).unwrap() != c {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:9:18
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
9 |       stack.push(c)
  |                  ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:9:7
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |       stack.push(c)
  |       ^^^^^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
