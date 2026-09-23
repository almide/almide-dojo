# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  if int.rem(n, 15) == 0 then "FizzBuzz"
  else if int.rem(n, 3) == 0 then "Fizz"
  else if int.rem(n, 5) == 0 then "Buzz"
  else int.to_string(n)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-0.almd:2:17
  in call to int.rem()
  here: if int.rem(n, 15) == 0 then "FizzBuzz"
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   if int.rem(n, 15) == 0 then "FizzBuzz"
  |                 ^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-0.almd:3:22
  in call to int.rem()
  here: else if int.rem(n, 3) == 0 then "Fizz"
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else if int.rem(n, 3) == 0 then "Fizz"
  |                      ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-0.almd:4:22
  in call to int.rem()
  here: else if int.rem(n, 5) == 0 then "Buzz"
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 |   else if int.rem(n, 5) == 0 then "Buzz"
  |                      ^

3 error(s) found
FAILED: /tmp/dojo-fizzbuzz-0.almd
Compile error for /tmp/dojo-fizzbuzz-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn fizzbuzz(n: Int) -> String = 
  if n % 15 == 0 then "FizzBuzz"
  else if n % 3 == 0 then "Fizz"
  else if n % 5 == 0 then "Buzz"
  else int.to_string(n)
```
