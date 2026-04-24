# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
Compiling /tmp/dojo-fizzbuzz-0.almd
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-0.almd:2:17
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   if int.rem(n, 15) == 0 then "FizzBuzz"
  |                 ^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-0.almd:3:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else if int.rem(n, 3) == 0 then "Fizz"
  |                      ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-0.almd:4:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 |   else if int.rem(n, 5) == 0 then "Buzz"
  |                      ^

3 error(s) found
Compile error for /tmp/dojo-fizzbuzz-0.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  if int.rem(n, 15) == 0 then "FizzBuzz"
  else if int.rem(n, 3) == 0 then "Fizz"
  else if int.rem(n, 5) == 0 then "Buzz"
  else int.to_string(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-1.almd
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-1.almd:2:17
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   if int.rem(n, 15) == 0 then "FizzBuzz"
  |                 ^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-1.almd:3:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else if int.rem(n, 3) == 0 then "Fizz"
  |                      ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-1.almd:4:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 |   else if int.rem(n, 5) == 0 then "Buzz"
  |                      ^

3 error(s) found
Compile error for /tmp/dojo-fizzbuzz-1.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  if int.rem(n, 15) == 0 then "FizzBuzz"
  else if int.rem(n, 3) == 0 then "Fizz"
  else if int.rem(n, 5) == 0 then "Buzz"
  else int.to_string(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-2.almd
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-2.almd:2:17
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   if int.rem(n, 15) == 0 then "FizzBuzz"
  |                 ^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-2.almd:3:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else if int.rem(n, 3) == 0 then "Fizz"
  |                      ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-2.almd:4:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 |   else if int.rem(n, 5) == 0 then "Buzz"
  |                      ^

3 error(s) found
Compile error for /tmp/dojo-fizzbuzz-2.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  if int.rem(n, 15) == 0 then "FizzBuzz"
  else if int.rem(n, 3) == 0 then "Fizz"
  else if int.rem(n, 5) == 0 then "Buzz"
  else int.to_string(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-3.almd
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-3.almd:2:17
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   if int.rem(n, 15) == 0 then "FizzBuzz"
  |                 ^^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-3.almd:3:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else if int.rem(n, 3) == 0 then "Fizz"
  |                      ^
error[E002]: undefined function 'int.rem'
  --> /tmp/dojo-fizzbuzz-3.almd:4:22
  in call to int.rem()
  hint: No function 'rem' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 |   else if int.rem(n, 5) == 0 then "Buzz"
  |                      ^

3 error(s) found
Compile error for /tmp/dojo-fizzbuzz-3.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-3.almd

1/1 test file(s) failed

```
