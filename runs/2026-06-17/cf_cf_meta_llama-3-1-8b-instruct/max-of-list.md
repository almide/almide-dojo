# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    match list.reduce(xs, (a, b) => if a > b then a else b) do 
      some(result) => some(result) 
      _ => none
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected LBrace at line 5:61 (got Ident 'do')
  --> /tmp/dojo-max-of-list-0.almd:5:61
  |
5 |     match list.reduce(xs, (a, b) => if a > b then a else b) do
  |                                                             ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    match list.reduce(xs, (a, b) => if a > b then a else b) with 
      some(result) => some(result) 
      none => none
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected LBrace at line 5:61 (got Ident 'with')
  --> /tmp/dojo-max-of-list-1.almd:5:61
  |
5 |     match list.reduce(xs, (a, b) => if a > b then a else b) with
  |                                                             ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    match list.reduce(xs, (a, b) => if a > b then a else b) {
      some(result) => some(result)
      none => none
    }
```
