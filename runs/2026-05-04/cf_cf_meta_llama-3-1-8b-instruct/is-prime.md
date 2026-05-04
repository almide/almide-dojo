# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    case 0 | 1 => false
    case _ if n < 0 => false
    case _ => 
      let max_divisor = int.sqrt(n)
      list.all(list.range(2, max_divisor + 1), fn(x) => int.rem(n, x) != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected FatArrow at line 3:10 (got Int '0')
  --> /tmp/dojo-is-prime-0.almd:3:10
  |
3 |     case 0 | 1 => false
  |          ^
error: Expected function name at line 7:50 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:7:50
  |
7 |       list.all(list.range(2, max_divisor + 1), fn(x) => int.rem(n, x) != 0)
  |                                                  ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    case 0 | 1 => false
    case _ if n < 0 => false
    case _ => 
      let max_divisor = int.to_int(float.sqrt(int.to_float(n)))
      list.all(list.range(2, max_divisor + 1), (x) => int.rem(n, x) != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected FatArrow at line 3:10 (got Int '0')
  --> /tmp/dojo-is-prime-1.almd:3:10
  |
3 |     case 0 | 1 => false
  |          ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    case 0 | 1 => false
    case _ if n < 0 => false
    case _ => 
      let max_divisor = int.to_int(float.sqrt(int.to_float(n)))
      list.all(list.range(2, max_divisor + 1), (x) => int.rem(n, x) != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected FatArrow at line 3:10 (got Int '0')
  --> /tmp/dojo-is-prime-2.almd:3:10
  |
3 |     case 0 | 1 => false
  |          ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    case 0 | 1 => false
    case _ if n < 0 => false
    case _ => 
      let max_divisor = int.to_int(float.sqrt(int.to_float(n)))
      list.all(list.range(2, max_divisor + 1), (x) => int.rem(n, x) != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected FatArrow at line 3:10 (got Int '0')
  --> /tmp/dojo-is-prime-3.almd:3:10
  |
3 |     case 0 | 1 => false
  |          ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
