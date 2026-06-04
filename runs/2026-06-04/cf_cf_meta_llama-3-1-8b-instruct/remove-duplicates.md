# remove-duplicates

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] {
  list.unique(xs)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-remove-duplicates-0.almd
error: Missing '=' before function body at line 1:50
  --> /tmp/dojo-remove-duplicates-0.almd:1:50
  hint: Almide requires '=' before the body. Write: fn remove_duplicates(...) -> Type = { ... }
  |
1 | fn remove_duplicates(xs: List[Int]) -> List[Int] {
  |                                                  ^

1 error(s) found
Compile error for /tmp/dojo-remove-duplicates-0.almd:
compile failed
FAILED: /tmp/dojo-remove-duplicates-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn remove_duplicates(xs: List[Int]) -> List[Int] = list.unique(xs)
```
