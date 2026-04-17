# flatten-nested

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn flatten(xss: List[List[Int]]) -> List[Int] {
    list.flatten(xss)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-flatten-nested-0.almd
error: Missing '=' before function body at line 1:47
  --> /tmp/dojo-flatten-nested-0.almd:1:47
  hint: Almide requires '=' before the body. Write: fn flatten(...) -> Type = { ... }
  |
1 | fn flatten(xss: List[List[Int]]) -> List[Int] {
  |                                               ^

1 error(s) found
Compile error for /tmp/dojo-flatten-nested-0.almd:
compile failed
FAILED: /tmp/dojo-flatten-nested-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn flatten(xss: List[List[Int]]) -> List[Int] = list.flatten(xss)
```
