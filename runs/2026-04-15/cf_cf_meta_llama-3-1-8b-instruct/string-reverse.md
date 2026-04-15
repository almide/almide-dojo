# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = s.chars()
  let reversed = chars.reverse()
  String.from_chars(reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E001]: type mismatch in method call: expected String but got fn(List[String]) -> String
  --> /tmp/dojo-string-reverse-0.almd:4:3
  in method call
  hint: Fix the expression type or change the expected type
  |
4 |   String.from_chars(reversed)
  |   ^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = s.chars()
  let reversed = chars.reverse()
  reversed
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E001]: type mismatch in fn 'reverse': expected String but got List[String]
  --> /tmp/dojo-string-reverse-1.almd:4:3
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  |
4 |   reversed
  |   ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = s.chars()
  let reversed = chars.foldl("", (acc, x) => acc + x)
  reversed
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined method 'foldl' on list
  --> /tmp/dojo-string-reverse-2.almd:3:18
  in method call .foldl()
  hint: Almide doesn't use method-call syntax. Write `list.fold(x)` (or `x |> list.fold`). Method syntax `x.foldl()` is not supported.
  |
3 |   let reversed = chars.foldl("", (acc, x) => acc + x)
  |                  ^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = s.chars()
  let reversed = chars |> list.foldl("", (acc, x) => acc + x)
  reversed
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'list.foldl'
  --> /tmp/dojo-string-reverse-3.almd:3:60
  in call to list.foldl()
  hint: Did you mean `list.fold`?
  |
3 |   let reversed = chars |> list.foldl("", (acc, x) => acc + x)
  |                                                            ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
