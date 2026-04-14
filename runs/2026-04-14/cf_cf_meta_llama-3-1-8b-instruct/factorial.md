# factorial

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn factorial(n: Int) -> Int = 
  if n == 0 then 1 else n * (n - 1).factorial
```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-0.almd
Compile error for /tmp/dojo-factorial-0.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /tmp/dojo-factorial-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn factorial(n: Int) -> Int = 
  if n == 0 then 1 else n * (n - 1).factorial
```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-1.almd
Compile error for /tmp/dojo-factorial-1.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /tmp/dojo-factorial-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn factorial(n: Int) -> Int = 
  if n == 0 then 1 else n * (n - 1).factorial
```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-2.almd
Compile error for /tmp/dojo-factorial-2.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error; 1 warning emitted

FAILED: /tmp/dojo-factorial-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn factorial(n: Int) -> Int = 
  n.fold(1, (acc, x) => acc * x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-3.almd
error[E001]: type mismatch in method call: expected Int but got fn(Int, fn(?0, ?1) -> ?0) -> Int
  --> /tmp/dojo-factorial-3.almd:2:3
  in method call
  hint: Fix the expression type or change the expected type
  |
2 |   n.fold(1, (acc, x) => acc * x)
  |   ^

1 error(s) found
Compile error for /tmp/dojo-factorial-3.almd:
compile failed
FAILED: /tmp/dojo-factorial-3.almd

1/1 test file(s) failed

```
