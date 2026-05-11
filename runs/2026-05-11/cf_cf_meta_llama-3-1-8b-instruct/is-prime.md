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
      let sqrt_n = int.to_float(n) |> float.sqrt |> int.to_int
      let is_prime = (x: Int) => 
        match x {
          case 1 => true
          case _ if x > sqrt_n => true
          case _ if n % x == 0 => false
          case _ => is_prime(x + 1)
        }
      is_prime(2)
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

1 error(s) found
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
      let sqrt_n = int.to_float(n) |> float.sqrt |> int.to_int
      let is_prime = (x: Int) => 
        match x {
          case 1 => true
          case _ if x > sqrt_n => true
          case _ if n % x == 0 => false
          case _ => is_prime(x + 1)
        }
      is_prime(2)
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
      let sqrt_n = int.to_float(n) |> float.sqrt |> int.to_int
      let is_prime = (x: Int) => 
        match x {
          case 1 => true
          case _ if x > sqrt_n => true
          case _ if n % x == 0 => false
          case _ => is_prime(x + 1)
        }
      is_prime(2)
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
      let sqrt_n = int.to_float(n) |> float.sqrt |> int.to_int
      let is_prime = (x: Int) => 
        match x {
          case 1 => true
          case _ if x > sqrt_n => true
          case _ if n % x == 0 => false
          case _ => is_prime(x + 1)
        }
      is_prime(2)
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
