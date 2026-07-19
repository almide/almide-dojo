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
    string.chars(s) |> list.reverse |> string.join(string.from_list)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E003]: undefined variable 'string'
  --> /tmp/dojo-string-reverse-0.almd:2:52
  in variable string
  hint: Check the variable name
  |
2 |     string.chars(s) |> list.reverse |> string.join(string.from_list)
  |                                                    ^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
    string.chars(s) |> list.reverse |> string.join(string.from_list)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E003]: undefined variable 'string'
  --> /tmp/dojo-string-reverse-1.almd:2:52
  in variable string
  hint: Check the variable name
  |
2 |     string.chars(s) |> list.reverse |> string.join(string.from_list)
  |                                                    ^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
    string.chars(s) |> list.reverse |> string.join(string.from_list)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E003]: undefined variable 'string'
  --> /tmp/dojo-string-reverse-2.almd:2:52
  in variable string
  hint: Check the variable name
  |
2 |     string.chars(s) |> list.reverse |> string.join(string.from_list)
  |                                                    ^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
    list.chars(s) |> list.reverse |> string.join(list.to_list)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'list.chars'
  --> /tmp/dojo-string-reverse-3.almd:2:16
  in call to list.chars()
  hint: No function 'chars' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |     list.chars(s) |> list.reverse |> string.join(list.to_list)
  |                ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-string-reverse-3.almd:2:50
  in variable list
  hint: Check the variable name
  |
2 |     list.chars(s) |> list.reverse |> string.join(list.to_list)
  |                                                  ^^^^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
