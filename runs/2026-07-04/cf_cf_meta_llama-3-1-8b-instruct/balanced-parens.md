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
  let brackets = string.chars("([{])")
  for c in brackets {
    if list.contains(stack, c) {
      list.push(stack, c)
    } else if list.is_empty(stack) {
      return false
    } else if match c {
      '(' => match list.last(stack) {
        ')' => list.drop_end(stack, 1),
        _ => return false
      },
      '[' => match list.last(stack) {
        ']' => list.drop_end(stack, 1),
        _ => return false
      },
      '{' => match list.last(stack) {
        '}' => list.drop_end(stack, 1),
        _ => return false
      },
      _ => return false
    } {
      return false
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
  let brackets = string.chars("([{])")
  for c in brackets {
    if list.contains(stack, c) {
      list.push(stack, c)
    } else if list.is_empty(stack) {
      return false
    } else if match c {
      '(' => match list.last(stack) {
        ')' => list.drop_end(stack, 1),
        _ => return false
      },
      '[' => match list.last(stack) {
        ']' => list.drop_end(stack, 1),
        _ => return false
      },
      '{' => match list.last(stack) {
        '}' => list.drop_end(stack, 1),
        _ => return false
      },
      _ => return false
    } {
      return false
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected Then at line 5:32 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-1.almd:5:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if list.contains(stack, c) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:7:7
  |
7 |     } else if list.is_empty(stack) {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let stack = list.new[String]()
  |                       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:6:24
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
6 |       list.push(stack, c)
  |                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:6:24
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
6 |       list.push(stack, c)
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
  let stack = []
  let brackets = string.chars("([{])")
  for c in brackets {
    if list.contains(stack, string.from_codepoint(c)) {
      list.push(stack, string.from_codepoint(c))
    } else if list.is_empty(stack) {
      return false
    } else if match c {
      '(' => match list.last(stack) {
        ')' => list = list.drop_end(1),
        _ => return false
      },
      '[' => match list.last(stack) {
        ']' => list = list.drop_end(1),
        _ => return false
      },
      '{' => match list.last(stack) {
        '}' => list = list.drop_end(1),
        _ => return false
      },
      _ => return false
    } {
      return false
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected Then at line 5:55 (got LBrace '{')
  --> /tmp/dojo-balanced-parens-2.almd:5:55
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |     if list.contains(stack, string.from_codepoint(c)) {
  |                                                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:7:7
  |
7 |     } else if list.is_empty(stack) {
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:6:46
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
6 |       list.push(stack, string.from_codepoint(c))
  |                                              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:6:46
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
6 |       list.push(stack, string.from_codepoint(c))
  |                                              ^

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
  let brackets = string.chars("([{])")
  for c in brackets {
    match c {
      '(' => list.push(stack, "("),
      '[' => list.push(stack, "["),
      '{' => list.push(stack, "{"),
      _ => (),
    }
    if match c {
      ')' => match list.last(stack) {
        ')' => list = list.drop_end(1),
        _ => return false,
      },
      ']' => match list.last(stack) {
        ']' => list = list.drop_end(1),
        _ => return false,
      },
      '}' => match list.last(stack) {
        '}' => list = list.drop_end(1),
        _ => return false,
      },
      _ => (),
    } {
      return false
    }
  }
  list.is_empty(stack)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected pattern at line 13:21 (got Eq '=')
  --> /tmp/dojo-balanced-parens-3.almd:13:21
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
13 |         ')' => list = list.drop_end(1),
   |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:8 (got Comma ',')
  --> /tmp/dojo-balanced-parens-3.almd:15:8
   |
15 |       },
   |        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:3:31
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
3 |   let brackets = string.chars("([{])")
  |                               ^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
