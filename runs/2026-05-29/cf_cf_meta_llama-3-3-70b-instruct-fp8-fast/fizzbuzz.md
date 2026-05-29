# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String =
  if int.parse("15") == ok(15) && n % 15 == 0 then
    "FizzBuzz"
  else if n % 3 == 0 then
    "Fizz"
  else if n % 5 == 0 then
    "Buzz"
  else
    int.to_string(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-0.almd
error: '&&' is not valid in Almide at line 2:32
  --> /tmp/dojo-fizzbuzz-0.almd:2:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
2 |   if int.parse("15") == ok(15) && n % 15 == 0 then
  |                                ^

1 error(s) found
Compile error for /tmp/dojo-fizzbuzz-0.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn fizzbuzz(n: Int) -> String =
  if n % 15 == 0 then
    "FizzBuzz"
  else if n % 3 == 0 then
    "Fizz"
  else if n % 5 == 0 then
    "Buzz"
  else
    int.to_string(n)
```
