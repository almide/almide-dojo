# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String {
  if n % 15 == 0 {
    "FizzBuzz"
  } else if n % 3 == 0 {
    "Fizz"
  } else if n % 5 == 0 {
    "Buzz"
  } else {
    int.to_string(n)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-fizzbuzz-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn fizzbuzz(...) -> Type = { ... }
  |
1 | fn fizzbuzz(n: Int) -> String {
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-fizzbuzz-0.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn fizzbuzz(n: Int) -> String = 
  if n % 15 == 0 then "FizzBuzz" else 
    if n % 3 == 0 then "Fizz" else 
      if n % 5 == 0 then "Buzz" else int.to_string(n)
```
