# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(string.to_lower(a)) |>
    list.filter(fn(x) => x != ' ')
  let b_chars = string.chars(string.to_lower(b)) |>
    list.filter(fn(x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected expression at line 3:17 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:3:17
  |
3 |     list.filter(fn(x) => x != ' ')
  |                 ^
error: Expected expression at line 5:17 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:5:17
  |
5 |     list.filter(fn(x) => x != ' ')
  |                 ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:13
  in variable a_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:35
  in variable b_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_chars = string.chars(string.to_lower(a)) |>
    list.filter(fn(x) => x != ' ')
  let b_chars = string.chars(string.to_lower(b)) |>
    list.filter(fn(x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 3:17 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:17
  |
3 |     list.filter(fn(x) => x != ' ')
  |                 ^
error: Expected expression at line 5:17 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:5:17
  |
5 |     list.filter(fn(x) => x != ' ')
  |                 ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-1.almd:6:13
  in variable a_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-1.almd:6:35
  in variable b_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
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
  let a_chars = string.chars(string.to_lower(a)) |>
    list.filter(fn(x) => x != ' ')
  let b_chars = string.chars(string.to_lower(b)) |>
    list.filter(fn(x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 3:17 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:17
  |
3 |     list.filter(fn(x) => x != ' ')
  |                 ^
error: Expected expression at line 5:17 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:5:17
  |
5 |     list.filter(fn(x) => x != ' ')
  |                 ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-2.almd:6:13
  in variable a_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-2.almd:6:35
  in variable b_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
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
  let a_chars = string.chars(string.to_lower(a)) |>
    list.filter(x => x != ' ')
  let b_chars = string.chars(string.to_lower(b)) |>
    list.filter(x => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-3.almd:3:19
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |     list.filter(x => x != ' ')
  |                   ^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-3.almd:5:19
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |     list.filter(x => x != ' ')
  |                   ^^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-3.almd:6:13
  in variable a_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-3.almd:6:35
  in variable b_chars
  hint: Check the variable name
  |
6 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
