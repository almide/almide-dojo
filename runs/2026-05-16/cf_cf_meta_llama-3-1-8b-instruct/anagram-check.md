# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  list.sort(a) == list.sort(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:2:61
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error: Expected expression at line 3:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-0.almd:3:61
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:13
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:29
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:13
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:29
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  list.sort(a) == list.sort(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:61
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error: Expected expression at line 3:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:61
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-1.almd:4:13
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-1.almd:4:29
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-1.almd:4:13
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-1.almd:4:29
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  list.sort(a) == list.sort(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:61
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error: Expected expression at line 3:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:61
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-2.almd:4:13
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-2.almd:4:29
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-2.almd:4:13
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-2.almd:4:29
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  list.sort(a) == list.sort(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:2:61
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error: Expected expression at line 3:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:61
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) = x != ' ')
  |                                                             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-3.almd:4:13
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-3.almd:4:29
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-3.almd:4:13
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-3.almd:4:29
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
