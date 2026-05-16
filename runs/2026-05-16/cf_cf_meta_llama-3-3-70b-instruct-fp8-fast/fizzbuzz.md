# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String =
  if int.mod(n, 15) == 0 then
    "FizzBuzz"
  else if int.mod(n, 3) == 0 then
    "Fizz"
  else if int.mod(n, 5) == 0 then
    "Buzz"
  else
    int.to_string(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-0.almd
error: Expected name at line 2:10 (got Mod 'mod')
  --> /tmp/dojo-fizzbuzz-0.almd:2:10
  |
2 |   if int.mod(n, 15) == 0 then
  |          ^
error: Expected Fn at line 2:13 (got LParen '(')
  --> /tmp/dojo-fizzbuzz-0.almd:2:13
  |
2 |   if int.mod(n, 15) == 0 then
  |             ^
error: Expected Fn at line 4:18 (got LParen '(')
  --> /tmp/dojo-fizzbuzz-0.almd:4:18
  |
4 |   else if int.mod(n, 3) == 0 then
  |                  ^
error: Expected Fn at line 6:18 (got LParen '(')
  --> /tmp/dojo-fizzbuzz-0.almd:6:18
  |
6 |   else if int.mod(n, 5) == 0 then
  |                  ^

4 error(s) found
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
