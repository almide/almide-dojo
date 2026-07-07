# balanced-parens

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let opening_brackets = list.from_list(["(", "[", "{"])
  let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, "(", "))"))
  let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  let stack = list.new()
  for c in string.chars(s) do
    match c {
      some(x) =>
        if list.contains(brackets, x) then
          list.push(stack, x)
        else
          match list.last(stack) {
            some(x) =>
              if string.equals(x, string.replace(c, string.get(c, 0), string.get(c, 2))) then
                list.drop_end(stack, 1)
              else
                return false
            none => return false
          }
        end
      none => 
        ()
    }
  end
  match list.is_empty(stack) {
    true => true
    none => false
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-0.almd
error: Expected expression at line 3:53 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-0.almd:3:53
  |
3 |   let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, "(", "))"))
  |                                                     ^
error: Expected expression at line 4:57 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-0.almd:4:57
  |
4 |   let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  |                                                         ^
error: Expected LBrace at line 6:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-0.almd:6:28
  |
6 |   for c in string.chars(s) do
  |                            ^
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-balanced-parens-0.almd:20:12
   |
20 |         end
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-0.almd:23:5
   |
23 |     }
   |     ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-balanced-parens-0.almd:2:52
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let opening_brackets = list.from_list(["(", "[", "{"])
  |                                                    ^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-balanced-parens-0.almd:5:23
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
5 |   let stack = list.new()
  |                       ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-0.almd:5:23
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |   let stack = list.new()
  |                       ^

8 error(s) found
Compile error for /tmp/dojo-balanced-parens-0.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let opening_brackets = list.from_list(["(", "[", "{"])
  let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, "(", "))"))
  let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  let stack = []
  for c in string.chars(s) do
    match c {
      some(x) =>
        if list.contains(brackets, x) then
          stack = stack + [x]
        else
          match list.last(stack) {
            some(x) =>
              if string.equals(x, string.replace(c, string.get(c, 0), string.get(c, 2))) then
                stack = list.drop_end(stack, 1)
              else
                return false
            none => return false
          }
        end
      none => 
        ()
    }
  end
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-1.almd
error: Expected expression at line 3:53 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-1.almd:3:53
  |
3 |   let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, "(", "))"))
  |                                                     ^
error: Expected expression at line 4:57 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-1.almd:4:57
  |
4 |   let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  |                                                         ^
error: Expected LBrace at line 6:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-1.almd:6:28
  |
6 |   for c in string.chars(s) do
  |                            ^
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-balanced-parens-1.almd:20:12
   |
20 |         end
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-1.almd:23:5
   |
23 |     }
   |     ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-balanced-parens-1.almd:2:52
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let opening_brackets = list.from_list(["(", "[", "{"])
  |                                                    ^^^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-1.almd:5:15
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |   let stack = []
  |               ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-1.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let opening_brackets = ["(", "[", "{"]
  let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, string.get(x, 0), string.get(x, 2)))
  let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  let stack = list.from_list([])
  for c in string.chars(s) do
    match c {
      some(x) =>
        if list.contains(brackets, x) then
          stack = stack + [x]
        else
          match list.last(stack) {
            some(y) =>
              if string.equals(x, string.get(y, 0)) then
                stack = list.drop_end(stack, 1)
              else
                return false
            none => return false
          }
        end
      none => 
        ()
    }
  end
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-2.almd
error: Expected expression at line 3:53 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-2.almd:3:53
  |
3 |   let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, string.get(x, 0), string.get(x, 2)))
  |                                                     ^
error: Expected expression at line 4:57 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-2.almd:4:57
  |
4 |   let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  |                                                         ^
error: Expected LBrace at line 6:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-2.almd:6:28
  |
6 |   for c in string.chars(s) do
  |                            ^
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-balanced-parens-2.almd:20:12
   |
20 |         end
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-2.almd:23:5
   |
23 |     }
   |     ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-balanced-parens-2.almd:5:30
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |   let stack = list.from_list([])
  |                              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-2.almd:5:30
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |   let stack = list.from_list([])
  |                              ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-2.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_balanced(s: String) -> Bool = 
  let opening_brackets = ["(", "[", "{"]
  let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, string.get(x, 0), string.get(x, 2)))
  let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  let stack = list.from_list([])
  for c in string.chars(s) do
    match c {
      some(x) =>
        if list.contains(brackets, x) then
          stack = stack + [x]
        else
          match list.last(stack) {
            some(y) =>
              if string.equals(x, string.get(y, 0)) then
                stack = list.drop_end(stack, 1)
              else
                return false
            none => return false
          }
        end
      none => 
        ()
    }
  end
  list.is_empty(stack)
```

**Diagnostic:**

```
Compiling /tmp/dojo-balanced-parens-3.almd
error: Expected expression at line 3:53 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-3.almd:3:53
  |
3 |   let closing_brackets = list.map(opening_brackets, fn (x) => string.replace(x, string.get(x, 0), string.get(x, 2)))
  |                                                     ^
error: Expected expression at line 4:57 (got Fn 'fn')
  --> /tmp/dojo-balanced-parens-3.almd:4:57
  |
4 |   let brackets = list.concat(list.map(opening_brackets, fn (x) => [x, closing_brackets.find(x)]))
  |                                                         ^
error: Expected LBrace at line 6:28 (got Ident 'do')
  --> /tmp/dojo-balanced-parens-3.almd:6:28
  |
6 |   for c in string.chars(s) do
  |                            ^
error: Expected FatArrow at line 20:12 (got Newline '')
  --> /tmp/dojo-balanced-parens-3.almd:20:12
   |
20 |         end
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:5 (got RBrace '}')
  --> /tmp/dojo-balanced-parens-3.almd:23:5
   |
23 |     }
   |     ^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-balanced-parens-3.almd:5:30
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |   let stack = list.from_list([])
  |                              ^
error[E001]: type mismatch in fn 'is_balanced': expected Bool but got Unit
  --> /tmp/dojo-balanced-parens-3.almd:5:30
  in fn 'is_balanced'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |   let stack = list.from_list([])
  |                              ^

7 error(s) found
Compile error for /tmp/dojo-balanced-parens-3.almd:
compile failed
FAILED: /tmp/dojo-balanced-parens-3.almd

1/1 test file(s) failed

```
