# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool {
  let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
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
error: Expected function name at line 2:59 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:2:59
  |
2 |   let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  |                                                           ^
error: Expected function name at line 3:59 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:3:59
  |
3 |   let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  |                                                           ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 2:57 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:57
  |
2 |   let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  |                                                         ^
error: Expected expression at line 3:57 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:57
  |
3 |   let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  |                                                         ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:13
  in variable a_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-1.almd:4:35
  in variable b_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 2:57 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:57
  |
2 |   let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  |                                                         ^
error: Expected expression at line 3:57 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:57
  |
3 |   let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  |                                                         ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-2.almd:4:13
  in variable a_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-2.almd:4:35
  in variable b_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 2:57 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:2:57
  |
2 |   let a_chars = string.chars(string.to_lower(a)).filter(fn(x) => x != ' ')
  |                                                         ^
error: Expected expression at line 3:57 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:57
  |
3 |   let b_chars = string.chars(string.to_lower(b)).filter(fn(x) => x != ' ')
  |                                                         ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-3.almd:4:13
  in variable a_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-3.almd:4:35
  in variable b_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
