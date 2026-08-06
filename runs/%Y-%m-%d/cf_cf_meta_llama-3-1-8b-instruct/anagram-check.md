# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool {
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  list.eq(a, b)
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
error: Expected function name at line 2:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:2:63
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  |                                                               ^
error: Expected function name at line 3:63 (got LParen '(')
  --> /tmp/dojo-anagram-check-0.almd:3:63
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  |                                                               ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  list.eq(a, b)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:2:61
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  |                                                             ^
error: Expected expression at line 3:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-1.almd:3:61
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  |                                                             ^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-anagram-check-1.almd:4:14
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
4 |   list.eq(a, b)
  |              ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort |> list.unique;
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort |> list.unique;
  list.eq(a, b)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:2:61
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort |> list.unique;
  |                                                             ^
error: Expected expression at line 3:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-2.almd:3:61
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort |> list.unique;
  |                                                             ^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-anagram-check-2.almd:4:14
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
4 |   list.eq(a, b)
  |              ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-2.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  list.eq(a, b)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error: Expected expression at line 2:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:2:61
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  |                                                             ^
error: Expected expression at line 3:61 (got Fn 'fn')
  --> /tmp/dojo-anagram-check-3.almd:3:61
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(fn(x) => x != ' ') |> list.sort;
  |                                                             ^
error[E002]: undefined function 'list.eq'
  --> /tmp/dojo-anagram-check-3.almd:4:14
  in call to list.eq()
  hint: Did you mean `list.get`?
  try:
      // list.eq(...)  →  list.get(...)
      list.get(...)
  |
4 |   list.eq(a, b)
  |              ^

3 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
