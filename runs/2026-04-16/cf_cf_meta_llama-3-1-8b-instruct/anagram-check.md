# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool {
  let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  list.equals(a_chars, b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Missing '=' before function body at line 1:45
  --> /tmp/dojo-anagram-check-0.almd:1:45
  hint: Almide requires '=' before the body. Write: fn is_anagram(...) -> Type = { ... }
  |
1 | fn is_anagram(a: String, b: String) -> Bool {
  |                                             ^
error: Expected function name at line 2:50 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:2:50
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                  ^
error: Expected function name at line 3:50 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:3:50
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                  ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  list.equals(a_chars, b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 2:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:48
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                ^
error: Expected expression at line 3:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:48
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:15
  in variable a_chars
  hint: Check the variable name
  |
4 |   list.equals(a_chars, b_chars)
  |               ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:24
  in variable b_chars
  hint: Check the variable name
  |
4 |   list.equals(a_chars, b_chars)
  |                        ^^^^^^^
error[E002]: undefined function 'list.equals'
  --> /tmp/dojo-anagram-check-1.almd:4:24
  in call to list.equals()
  hint: No function 'equals' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
4 |   list.equals(a_chars, b_chars)
  |                        ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  list.equals(list.sort(a_chars), list.sort(b_chars))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 2:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:48
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                ^
error: Expected expression at line 3:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:48
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-2.almd:4:25
  in variable a_chars
  hint: Check the variable name
  |
4 |   list.equals(list.sort(a_chars), list.sort(b_chars))
  |                         ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-2.almd:4:45
  in variable b_chars
  hint: Check the variable name
  |
4 |   list.equals(list.sort(a_chars), list.sort(b_chars))
  |                                             ^^^^^^^
error[E002]: undefined function 'list.equals'
  --> /tmp/dojo-anagram-check-2.almd:4:45
  in call to list.equals()
  hint: No function 'equals' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
4 |   list.equals(list.sort(a_chars), list.sort(b_chars))
  |                                             ^^^^^^^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  list.equals(list.sort(string.chars(a) |> list.filter(fn(x) => x != " ")), list.sort(string.chars(b) |> list.filter(fn(x) => x != " ")))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 2:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:2:48
  |
2 |   let a_chars = string.chars(a) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                ^
error: Expected expression at line 3:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:48
  |
3 |   let b_chars = string.chars(b) |> list.filter(fn(x) => x != " ") |> list.sort()
  |                                                ^
error: Expected expression at line 4:56 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:4:56
  |
4 |   list.equals(list.sort(string.chars(a) |> list.filter(fn(x) => x != " ")), list.sort(string.chars(b) |> list.filter(fn(x) => x != " ")))
  |                                                        ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-3.almd:1:47
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
1 | fn is_anagram(a: String, b: String) -> Bool = {
  |                                               ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
