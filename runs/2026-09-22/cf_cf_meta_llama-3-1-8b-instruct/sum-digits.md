# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = list.fold(list.range(0, int.len(abs_n)), 0, (acc, i) => acc + int.get(abs_n, i) % 10)
  sum
}
```

**Diagnostic:**

```
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-0.almd:3:45
  in call to int.len()
  here: let sum = list.fold(list.range(0, int.len(abs_n)), 0, (acc, i) => acc + int.get(abs_n, i) % 10)
  hint: Did you mean `int.min`?
  try:
      int.min
  |
3 |   let sum = list.fold(list.range(0, int.len(abs_n)), 0, (acc, i) => acc + int.get(abs_n, i) % 10)
  |                                             ^^^^^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-0.almd:3:90
  in call to int.get()
  here: let sum = list.fold(list.range(0, int.len(abs_n)), 0, (acc, i) => acc + int.get(abs_n, i) % 10)
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.range(0, int.len(abs_n)), 0, (acc, i) => acc + int.get(abs_n, i) % 10)
  |                                                                                          ^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-0.almd
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  sum
}
```

**Diagnostic:**

```
error[E002]: undefined function 'to_string'
  --> /tmp/dojo-sum-digits-1.almd:3:55
  in call to to_string()
  here: let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  hint: Check the function name
  |
3 |   let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  |                                                       ^^^^^
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-1.almd:3:55
  in call to int.len()
  here: let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  hint: Did you mean `int.min`?
  try:
      int.min
  |
3 |   let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  |                                                       ^^^^^
error[E002]: undefined function 'to_string'
  --> /tmp/dojo-sum-digits-1.almd:3:124
  in call to to_string()
  here: let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  hint: Check the function name
  |
3 |   let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  |                                                                                                                            ^^^^^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-1.almd:3:132
  in call to int.get()
  here: let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  |                                                                                                                                    ^
error[E002]: undefined function 'to_string'
  --> /tmp/dojo-sum-digits-1.almd:3:132
  in call to to_string()
  here: let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  hint: Check the function name
  |
3 |   let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  |                                                                                                                                    ^
error: operator '%' requires numeric types but got Result[Int, String] and Int
  --> /tmp/dojo-sum-digits-1.almd:3:139
  in operator %
  here: let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  hint: Unwrap the Result operand first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
  |
3 |   let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  |                                                                                                                                           ^^
error: operator '+' requires numeric, String, or List types but got Int and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:3:139
  in operator +
  here: let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  hint: Unwrap the Result operand first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
  |
3 |   let sum = list.fold(list.range(0, int.len(to_string(abs_n))), 0, (acc, i) => acc + int.parse(to_string(int.get(to_string(abs_n), i))) % 10)
  |                                                                                                                                           ^^

7 error(s) found
FAILED: /tmp/dojo-sum-digits-1.almd
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let str_n = string.to_string(abs_n)
  let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)) % 10)
  sum
}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-2.almd:3:32
  in call to string.to_string()
  here: let str_n = string.to_string(abs_n)
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   let str_n = string.to_string(abs_n)
  |                                ^^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-sum-digits-2.almd:4:88
  in call to int.parse()
  here: let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)) % 10)
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
4 |   let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)) % 10)
  |                                                                                        ^^^^^^^^^^^^^^^^^^^^
error: operator '%' requires numeric types but got Result[Int, String] and Int
  --> /tmp/dojo-sum-digits-2.almd:4:112
  in operator %
  here: let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)) % 10)
  hint: Unwrap the Result operand first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
  |
4 |   let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)) % 10)
  |                                                                                                                ^^
error: operator '+' requires numeric, String, or List types but got Int and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:4:112
  in operator +
  here: let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)) % 10)
  hint: Unwrap the Result operand first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
  |
4 |   let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)) % 10)
  |                                                                                                                ^^

4 error(s) found
FAILED: /tmp/dojo-sum-digits-2.almd
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let str_n = string.to_string(abs_n)
  let sum = list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => {
    let digit = int.parse(string.get(str_n, i)) ?? 0
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-3.almd:3:32
  in call to string.to_string()
  here: let str_n = string.to_string(abs_n)
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   let str_n = string.to_string(abs_n)
  |                                ^^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-sum-digits-3.almd:5:27
  in call to int.parse()
  here: let digit = int.parse(string.get(str_n, i)) ?? 0
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
5 |     let digit = int.parse(string.get(str_n, i)) ?? 0
  |                           ^^^^^^^^^^^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-3.almd
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
