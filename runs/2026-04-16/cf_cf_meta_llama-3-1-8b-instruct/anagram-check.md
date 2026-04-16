# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool {
  let a_chars = string.chars(string.to_lower(a));
  let b_chars = string.chars(string.to_lower(b));
  let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
  list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
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
error: Expected function name at line 4:50 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:4:50
  |
4 |   let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  |                                                  ^
error: Expected function name at line 5:50 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:5:50
  |
5 |   let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
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
  let a_chars = string.chars(string.to_lower(a));
  let b_chars = string.chars(string.to_lower(b));
  let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
  list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 4:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:4:48
  |
4 |   let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  |                                                ^
error: Expected expression at line 5:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:5:48
  |
5 |   let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
  |                                                ^
error[E003]: undefined variable 'a_chars_no_spaces'
  --> /tmp/dojo-anagram-check-1.almd:6:13
  in variable a_chars_no_spaces
  hint: Check the variable name
  |
6 |   list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
  |             ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'b_chars_no_spaces'
  --> /tmp/dojo-anagram-check-1.almd:6:45
  in variable b_chars_no_spaces
  hint: Check the variable name
  |
6 |   list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
  |                                             ^^^^^^^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(string.to_lower(a));
  let b_chars = string.chars(string.to_lower(b));
  let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
  list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 4:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:4:48
  |
4 |   let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  |                                                ^
error: Expected expression at line 5:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:5:48
  |
5 |   let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
  |                                                ^
error[E003]: undefined variable 'a_chars_no_spaces'
  --> /tmp/dojo-anagram-check-2.almd:6:13
  in variable a_chars_no_spaces
  hint: Check the variable name
  |
6 |   list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
  |             ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'b_chars_no_spaces'
  --> /tmp/dojo-anagram-check-2.almd:6:45
  in variable b_chars_no_spaces
  hint: Check the variable name
  |
6 |   list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
  |                                             ^^^^^^^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(string.to_lower(a));
  let b_chars = string.chars(string.to_lower(b));
  let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
  list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 4:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:4:48
  |
4 |   let a_chars_no_spaces = list.filter(a_chars, fn(x) => x != " ");
  |                                                ^
error: Expected expression at line 5:48 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:5:48
  |
5 |   let b_chars_no_spaces = list.filter(b_chars, fn(x) => x != " ");
  |                                                ^
error[E003]: undefined variable 'a_chars_no_spaces'
  --> /tmp/dojo-anagram-check-3.almd:6:13
  in variable a_chars_no_spaces
  hint: Check the variable name
  |
6 |   list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
  |             ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'b_chars_no_spaces'
  --> /tmp/dojo-anagram-check-3.almd:6:45
  in variable b_chars_no_spaces
  hint: Check the variable name
  |
6 |   list.sort(a_chars_no_spaces) == list.sort(b_chars_no_spaces)
  |                                             ^^^^^^^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
