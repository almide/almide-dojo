# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
  let opening_brackets = List[String]({"(", "[", "{"})
  let closing_brackets = List[String]({"(", "]", "}"}).map(
    fn (x) => string.replace(x, ")", "(").replace(x, "]", "[").replace(x, "}", "{")
  )
  let stack = List[String]()
  for c in string.chars(s) {
    if opening_brackets.contains(c) {
      list.push(stack, c)
    } else if closing_brackets.contains(c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      list.drop_end(stack, 1)
      if closing_brackets.index_of(c) != opening_brackets.index_of(last) {
        return false
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
error: Expected function name at line 4:8 (got LParen '(')
  --> /tmp/dojo-balanced-parens-0.almd:4:8
  |
4 |     fn (x) => string.replace(x, ")", "(").replace(x, "]", "[").replace(x, "}", "{")
  |        ^

2 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let opening_brackets = List[String]({"(", "[", "{"})
  let closing_brackets = List[String]({"(", "]", "}"}).map(
    fn (x) => string.replace(x, ")", "(").replace(x, "]", "[").replace(x, "}", "{")
  )
  let stack = List[String]()
  for c in string.chars(s) {
    if opening_brackets.contains(c) {
      list.push(stack, c)
    } else if closing_brackets.contains(c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      list.drop_end(stack, 1)
      if closing_brackets.index_of(c) != opening_brackets.index_of(last) {
        return false
      }
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected expression at line 2:43 (got Comma ',')
  --> /tmp/dojo-balanced-parens-1.almd:2:43
  |
2 |   let opening_brackets = List[String]({"(", "[", "{"})
  |                                           ^
error: Expected expression at line 3:43 (got Comma ',')
  --> /tmp/dojo-balanced-parens-1.almd:3:43
  |
3 |   let closing_brackets = List[String]({"(", "]", "}"}).map(
  |                                           ^
error: Expected Then at line 8:37 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:8:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if opening_brackets.contains(c) {
  |                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:10:7
   |
10 |     } else if closing_brackets.contains(c) {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:9:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
9 |       list.push(stack, c)
  |                        ^
error[E005]: argument 'xs' expects List[A] but got List
  --> /tmp/dojo-balanced-parens-1.almd:9:24
  in call to list.push()
  hint: Fix the argument type
  |
9 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in call to list.push(): expected List[A] but got List
  --> /tmp/dojo-balanced-parens-1.almd:9:24
  in call to list.push()
  hint: Fix the expression type or change the expected type
  |
9 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:9:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |       list.push(stack, c)
  |                        ^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let opening_brackets = List[String]({"(", "[", "{"})
  let closing_brackets = List[String]({"(", "]", "}"}).map(
    fn (x) => string.replace(x, ")", "(").replace(x, "]", "[").replace(x, "}", "{")
  )
  let stack = List[String]()
  for c in string.chars(s) {
    if opening_brackets.contains(c) {
      list.push(stack, c)
    } else if closing_brackets.contains(c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      list.drop_end(stack, 1)
      if closing_brackets.index_of(c) != opening_brackets.index_of(last) {
        return false
      }
    }
  }
  let stack_len = list.len(stack)
  if stack_len == 0 {
    return true
  } else {
    return false
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected expression at line 2:43 (got Comma ',')
  --> /tmp/dojo-balanced-parens-2.almd:2:43
  |
2 |   let opening_brackets = List[String]({"(", "[", "{"})
  |                                           ^
error: Expected expression at line 3:43 (got Comma ',')
  --> /tmp/dojo-balanced-parens-2.almd:3:43
  |
3 |   let closing_brackets = List[String]({"(", "]", "}"}).map(
  |                                           ^
error: Expected Then at line 8:37 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:8:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if opening_brackets.contains(c) {
  |                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:10:7
   |
10 |     } else if closing_brackets.contains(c) {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:9:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
9 |       list.push(stack, c)
  |                        ^
error[E005]: argument 'xs' expects List[A] but got List
  --> /tmp/dojo-balanced-parens-2.almd:9:24
  in call to list.push()
  hint: Fix the argument type
  |
9 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in call to list.push(): expected List[A] but got List
  --> /tmp/dojo-balanced-parens-2.almd:9:24
  in call to list.push()
  hint: Fix the expression type or change the expected type
  |
9 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:9:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |       list.push(stack, c)
  |                        ^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let opening_brackets = List[String]({"(", "[", "{"})
  let closing_brackets = List[String]({"(", "]", "}"}).map(
    fn (x) => string.replace(x, ")", "(").replace(x, "]", "[").replace(x, "}", "{")
  )
  let stack = List[String]()
  for c in string.chars(s) {
    if opening_brackets.contains(c) {
      list.push(stack, c)
    } else if closing_brackets.contains(c) {
      if list.is_empty(stack) {
        return false
      }
      let last = list.last(stack)
      list.drop_end(stack, 1)
      if closing_brackets.index_of(c) != opening_brackets.index_of(last) {
        return false
      }
    }
  }
  let stack_len = list.len(stack)
  if stack_len == 0 {
    return true
  } else {
    return false
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected expression at line 2:43 (got Comma ',')
  --> /tmp/dojo-balanced-parens-3.almd:2:43
  |
2 |   let opening_brackets = List[String]({"(", "[", "{"})
  |                                           ^
error: Expected expression at line 3:43 (got Comma ',')
  --> /tmp/dojo-balanced-parens-3.almd:3:43
  |
3 |   let closing_brackets = List[String]({"(", "]", "}"}).map(
  |                                           ^
error: Expected Then at line 8:37 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-3.almd:8:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if opening_brackets.contains(c) {
  |                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 10:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:10:7
   |
10 |     } else if closing_brackets.contains(c) {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:9:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
9 |       list.push(stack, c)
  |                        ^
error[E005]: argument 'xs' expects List[A] but got List
  --> /tmp/dojo-balanced-parens-3.almd:9:24
  in call to list.push()
  hint: Fix the argument type
  |
9 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in call to list.push(): expected List[A] but got List
  --> /tmp/dojo-balanced-parens-3.almd:9:24
  in call to list.push()
  hint: Fix the expression type or change the expected type
  |
9 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:9:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |       list.push(stack, c)
  |                        ^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
