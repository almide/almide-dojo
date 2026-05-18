# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  match (n % 15, n % 3, n % 5) {
    (0, 0, 0) => "FizzBuzz"
    (0, 0, _) => "Fizz"
    (0, _, 0) => "Buzz"
    _ => int.to_string(n)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-0.almd
FAILED: /tmp/dojo-fizzbuzz-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  match (n % 15, n % 3, n % 5) {
    (0, 0, 0) => "FizzBuzz"
    (0, _, 0) => "Fizz"
    (0, _, _) => "Buzz"
    (_, _, _) => int.to_string(n)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-1.almd
FAILED: /tmp/dojo-fizzbuzz-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  match (n % 15, n % 3, n % 5) {
    (0, 0, 0) => "FizzBuzz"
    (0, _, 0) => "Fizz"
    (0, _, _) => "Buzz"
    (_, _, 0) => "Buzz"
    (_, _, _) => int.to_string(n)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-2.almd
FAILED: /tmp/dojo-fizzbuzz-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  match (n % 15, n % 3, n % 5) {
    (0, 0, 0) => "FizzBuzz"
    (0, 0, _) => "Fizz"
    (0, _, 0) => "Buzz"
    (_, 0, 0) => "Buzz"
    (_, _, _) => int.to_string(n)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-3.almd
FAILED: /tmp/dojo-fizzbuzz-3.almd

1/1 test file(s) failed

```
