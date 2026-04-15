# gcd

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int {
  if b == 0 {
    a
  } else {
    gcd(b, a % b)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-gcd-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn gcd(...) -> Type = { ... }
  |
1 | fn gcd(a: Int, b: Int) -> Int {
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-gcd-0.almd:
compile failed
FAILED: /tmp/dojo-gcd-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int = {
  if b == 0 {
    a
  } else {
    gcd(b, a % b)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-1.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-gcd-1.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if b == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-gcd-1.almd:4:5
  |
4 |   } else {
  |     ^

2 error(s) found
Compile error for /tmp/dojo-gcd-1.almd:
compile failed
FAILED: /tmp/dojo-gcd-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int = {
  if b == 0 {
    a
  } else {
    gcd(b, a % b)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-2.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-gcd-2.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if b == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-gcd-2.almd:4:5
  |
4 |   } else {
  |     ^

2 error(s) found
Compile error for /tmp/dojo-gcd-2.almd:
compile failed
FAILED: /tmp/dojo-gcd-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int = {
  if b == 0 {
    a
  } else {
    gcd(b, a % b)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-3.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-gcd-3.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if b == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-gcd-3.almd:4:5
  |
4 |   } else {
  |     ^

2 error(s) found
Compile error for /tmp/dojo-gcd-3.almd:
compile failed
FAILED: /tmp/dojo-gcd-3.almd

1/1 test file(s) failed

```
