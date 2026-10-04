# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (c) => string.is_lower(c)) 
  |> list.filter((c) => string.is_one_of(c, "aeiou")) 
  |> list.len
```

**Diagnostic:**

```
error[E002]: undefined function 'string.is_one_of'
  --> /tmp/dojo-count-vowels-0.almd:3:25
  in call to string.is_one_of()
  here: |> list.filter((c) => string.is_one_of(c, "aeiou"))
  hint: No function 'is_one_of' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   |> list.filter((c) => string.is_one_of(c, "aeiou"))
  |                         ^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-count-vowels-0.almd:3:42
  in call to list.filter()
  here: |> list.filter((c) => string.is_one_of(c, "aeiou"))
  hint: Fix the argument type
...
3 |   |> list.filter((c) => string.is_one_of(c, "aeiou"))
  |                                          ^

2 error(s) found
FAILED: /tmp/dojo-count-vowels-0.almd
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_one_of(c, "aeiou")) 
  |> list.len
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 2:58
  --> /tmp/dojo-count-vowels-1.almd:2:58
  here: list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_one_of(c, "aeiou"))
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   list.filter(string.chars(s), (c) => string.is_lower(c) && string.is_one_of(c, "aeiou"))
  |                                                          ^

1 error(s) found
FAILED: /tmp/dojo-count-vowels-1.almd
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (c) => string.is_lower(c) and string.is_one_of(c, "aeiou")) 
  |> list.len
```

**Diagnostic:**

```
error[E002]: undefined function 'string.is_one_of'
  --> /tmp/dojo-count-vowels-2.almd:2:62
  in call to string.is_one_of()
  here: list.filter(string.chars(s), (c) => string.is_lower(c) and string.is_one_of(c, "aeiou"))
  hint: No function 'is_one_of' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.filter(string.chars(s), (c) => string.is_lower(c) and string.is_one_of(c, "aeiou"))
  |                                                              ^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-count-vowels-2.almd
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  list.filter(string.chars(s), (c) => string.is_lower(c) and string.is_one_of(c, "aeiou")) 
  |> list.len
```

**Diagnostic:**

```
error[E002]: undefined function 'string.is_one_of'
  --> /tmp/dojo-count-vowels-3.almd:2:62
  in call to string.is_one_of()
  here: list.filter(string.chars(s), (c) => string.is_lower(c) and string.is_one_of(c, "aeiou"))
  hint: No function 'is_one_of' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.filter(string.chars(s), (c) => string.is_lower(c) and string.is_one_of(c, "aeiou"))
  |                                                              ^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-count-vowels-3.almd
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
