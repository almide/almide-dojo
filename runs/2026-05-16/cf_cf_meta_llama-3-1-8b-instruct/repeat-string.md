# repeat-string

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String {
  match n {
    0 => "",
    _ => s + repeat(s, n - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-0.almd
error: Missing '=' before function body at line 1:40
  --> /tmp/dojo-repeat-string-0.almd:1:40
  hint: Almide requires '=' before the body. Write: fn repeat(...) -> Type = { ... }
  |
1 | fn repeat(s: String, n: Int) -> String {
  |                                        ^

1 error(s) found
Compile error for /tmp/dojo-repeat-string-0.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn repeat(s: String, n: Int) -> String = match n {
  0 => "",
  _ => s + repeat(s, n - 1)
}
```
