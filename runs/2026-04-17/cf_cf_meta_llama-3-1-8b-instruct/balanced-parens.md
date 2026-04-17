# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
  let opening_brackets = list.new[String]()
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      list.push(opening_brackets, c)
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(opening_brackets) {
        return false
      }
      let last_opening = list.last(opening_brackets)
      if (c == ")" && last_opening != "(") ||
         (c == "]" && last_opening != "[") ||
         (c == "}" && last_opening != "{") {
        return false
      }
      list.drop_end(opening_brackets, 1)
    }
  }
  list.is_empty(opening_brackets)
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
  let opening_brackets = list.new[String]()
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      list.push(opening_brackets, c)
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(opening_brackets) {
        return false
      }
      let last_opening = list.last(opening_brackets)
      if (c == ")" && last_opening != "(") ||
         (c == "]" && last_opening != "[") ||
         (c == "}" && last_opening != "{") {
        return false
      }
      list.drop_end(opening_brackets, 1)
    }
  }
  list.is_empty(opening_brackets)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: '||' is not valid in Almide at line 4:17
  --> /tmp/dojo-balanced-parens-1.almd:4:17
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     if c == "(" || c == "[" || c == "{" {
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-1.almd:6:7
  |
6 |     } else if c == ")" || c == "]" || c == "}" {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-1.almd:2:34
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let opening_brackets = list.new[String]()
  |                                  ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:5:35
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(opening_brackets, c)
  |                                   ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:5:35
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(opening_brackets, c)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let opening_brackets = list.new[String]()
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      list.push(opening_brackets, c)
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(opening_brackets) {
        return false
      }
      let last_opening = list.last(opening_brackets)
      if (c == ")" && last_opening != "(") ||
         (c == "]" && last_opening != "[") ||
         (c == "}" && last_opening != "{") {
        return false
      }
      list.drop_end(opening_brackets, 1)
    }
  }
  list.is_empty(opening_brackets)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: '||' is not valid in Almide at line 4:17
  --> /tmp/dojo-balanced-parens-2.almd:4:17
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     if c == "(" || c == "[" || c == "{" {
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-2.almd:6:7
  |
6 |     } else if c == ")" || c == "]" || c == "}" {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-2.almd:2:34
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let opening_brackets = list.new[String]()
  |                                  ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:5:35
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(opening_brackets, c)
  |                                   ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:5:35
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(opening_brackets, c)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let opening_brackets = list.new[String]()
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      list.push(opening_brackets, c)
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(opening_brackets) {
        return false
      }
      let last_opening = list.last(opening_brackets)
      if (c == ")" && last_opening != "(") ||
         (c == "]" && last_opening != "[") ||
         (c == "}" && last_opening != "{") {
        return false
      }
      list.drop_end(opening_brackets, 1)
    }
  }
  list.is_empty(opening_brackets)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: '||' is not valid in Almide at line 4:17
  --> /tmp/dojo-balanced-parens-3.almd:4:17
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     if c == "(" || c == "[" || c == "{" {
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:7 (got Else 'else')
  --> /tmp/dojo-balanced-parens-3.almd:6:7
  |
6 |     } else if c == ")" || c == "]" || c == "}" {
  |       ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-3.almd:2:34
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let opening_brackets = list.new[String]()
  |                                  ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:5:35
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(opening_brackets, c)
  |                                   ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:5:35
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(opening_brackets, c)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
