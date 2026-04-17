# remove-duplicates

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.fold(
    xs, 
    list.new[Int](), 
    (acc, x) => 
      if list.contains(acc, x) then acc 
      else acc + [x]
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-remove-duplicates-0.almd
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-remove-duplicates-0.almd:4:13
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
4 |     list.new[Int](),
  |             ^

1 error(s) found
Compile error for /tmp/dojo-remove-duplicates-0.almd:
compile failed
FAILED: /tmp/dojo-remove-duplicates-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = 
  list.fold(
    xs, 
    [], 
    (acc, x) => 
      if list.contains(acc, x) then acc 
      else acc + [x]
  )
```
