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
    | n if n <= 1 => false
    | _ if n == 2 => true
    | _ if n % 2 == 0 => false
    | _ => list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-is-prime-0.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | n if n <= 1 => false
  |     ^
error: Expected function name at line 6:68 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:6:68
  |
6 |     | _ => list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                                    ^

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
    | _ if n < 1 => false
    | _ if n == 2 => true
    | _ if n % 2 == 0 => false
    | _ => list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-is-prime-1.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | _ if n < 1 => false
  |     ^
error: Expected function name at line 6:68 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:6:68
  |
6 |     | _ => list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                                    ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    | _ if n < 1 => false
    | _ if n == 2 => true
    | _ if n % 2 == 0 => false
    | _ => Thorium.list.all(Thorium.list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-is-prime-2.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | _ if n < 1 => false
  |     ^
error: Expected function name at line 6:84 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:6:84
  |
6 |     | _ => Thorium.list.all(Thorium.list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                                                    ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    | _ if n < 1 => false
    | 2 => true
    | _ if n % 2 == 0 => false
    | _ => Thorium.list.all(Thorium.list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-is-prime-3.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | _ if n < 1 => false
  |     ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
