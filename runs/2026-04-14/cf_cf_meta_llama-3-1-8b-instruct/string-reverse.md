# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = s.chars().rev().collect()
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E001]: type mismatch in method call: expected List[String] but got fn() -> fn() -> String
  --> /tmp/dojo-string-reverse-0.almd:1:35
  in method call
  hint: Fix the expression type or change the expected type
  |
1 | fn reverse(s: String) -> String = s.chars().rev().collect()
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = s.chars().rev().collect(String)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E001]: type mismatch in method call: expected List[String] but got fn() -> fn(String) -> String
  --> /tmp/dojo-string-reverse-1.almd:1:35
  in method call
  hint: Fix the expression type or change the expected type
  |
1 | fn reverse(s: String) -> String = s.chars().rev().collect(String)
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = s.chars().rev().collect()
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E001]: type mismatch in method call: expected List[String] but got fn() -> fn() -> String
  --> /tmp/dojo-string-reverse-2.almd:1:35
  in method call
  hint: Fix the expression type or change the expected type
  |
1 | fn reverse(s: String) -> String = s.chars().rev().collect()
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = s.chars().rev().collect()
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E001]: type mismatch in method call: expected List[String] but got fn() -> fn() -> String
  --> /tmp/dojo-string-reverse-3.almd:1:35
  in method call
  hint: Fix the expression type or change the expected type
  |
1 | fn reverse(s: String) -> String = s.chars().rev().collect()
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
