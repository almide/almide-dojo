# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool {
  let open_brackets = list.new[String]()
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      list.push(open_brackets, c)
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(open_brackets) {
        return false
      }
      let last = list.last(open_brackets)
      if (c == ")" && last != "(") || (c == "]" && last != "[") || (c == "}" && last != "{") {
        return false
      }
      list.drop_end(open_brackets, 1)
    }
  }
  list.is_empty(open_brackets)
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
  let open_brackets = list.new[String]()
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      list.push(open_brackets, c)
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(open_brackets) {
        return false
      }
      let last = list.last(open_brackets)
      if (c == ")" && last != "(") || (c == "]" && last != "[") || (c == "}" && last != "{") {
        return false
      }
      list.drop_end(open_brackets, 1)
    }
  }
  list.is_empty(open_brackets)
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
  --> /tmp/dojo-balanced-parens-1.almd:2:31
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
2 |   let open_brackets = list.new[String]()
  |                               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-1.almd:5:32
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       list.push(open_brackets, c)
  |                                ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:5:32
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       list.push(open_brackets, c)
  |                                ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  let open_brackets = []
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      open_brackets = open_brackets + [c]
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(open_brackets) {
        return false
      }
      let last = list.last(open_brackets)
      if (c == ")" && last != "(") || (c == "]" && last != "[") || (c == "}" && last != "{") {
        return false
      }
      open_brackets = list.drop_end(open_brackets, 1)
    }
  }
  list.is_empty(open_brackets)
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
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-2.almd:5:40
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       open_brackets = open_brackets + [c]
  |                                        ^
error[E009]: cannot reassign immutable binding 'open_brackets'
  --> /tmp/dojo-balanced-parens-2.almd:5:40
  in open_brackets = ...
  hint: Use 'var open_brackets = ...' instead of 'let open_brackets = ...' to declare a mutable variable
  try:
      // let open_brackets = ...  →  var open_brackets = ...
      var open_brackets = <initial value>
  |
2 |   let open_brackets = []
  |   ----------------------------- 'open_brackets' declared here
...
5 |       open_brackets = open_brackets + [c]
  |                                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:5:40
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       open_brackets = open_brackets + [c]
  |                                        ^

5 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = {
  var open_brackets = []
  for c in string.chars(s) {
    if c == "(" || c == "[" || c == "{" {
      open_brackets = open_brackets + [c]
    } else if c == ")" || c == "]" || c == "}" {
      if list.is_empty(open_brackets) {
        return false
      }
      let last = list.last(open_brackets)
      if (c == ")" && last != "(") || (c == "]" && last != "[") || (c == "}" && last != "{") {
        return false
      }
      open_brackets = list.drop_end(open_brackets, 1)
    }
  }
  list.is_empty(open_brackets)
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
error[E003]: undefined variable 'c'
  --> /tmp/dojo-balanced-parens-3.almd:5:40
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
  |
5 |       open_brackets = open_brackets + [c]
  |                                        ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:5:40
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |       open_brackets = open_brackets + [c]
  |                                        ^

4 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
