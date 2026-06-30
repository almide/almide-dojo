# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = list.fold(list.range(0, list.len(int.to_string(abs_n))), 0, (acc, i) => {
    let digit = int.to_int(int.to_string(abs_n)[i])
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:3:60
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let sum = list.fold(list.range(0, list.len(int.to_string(abs_n))), 0, (acc, i) => {
  |                                                            ^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:4:49
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 |     let digit = int.to_int(int.to_string(abs_n)[i])
  |                                                 ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:3:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let sum = list.fold(list.range(0, list.len(int.to_string(abs_n))), 0, (acc, i) => {
  |                                                            ^^^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let str_n = string.to_string(abs_n)
  let sum = list.fold(list.range(0, list.len(str_n)), 0, (acc, i) => {
    let digit = int.parse(str_n[i]).unwrap_or(0)
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-1.almd:3:32
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   let str_n = string.to_string(abs_n)
  |                                ^^^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let str_n = string.from_int(abs_n)
  let sum = list.fold(list.range(0, list.len(str_n)), 0, (acc, i) => {
    let digit = int.parse(str_n[i]).unwrap_or(0)
    acc + digit
  })
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected expression at line 10:1 (got Test 'test')
  --> /tmp/dojo-sum-digits-2.almd:10:1
   |
10 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
   | ^
error[E002]: undefined function 'string.from_int'
  --> /tmp/dojo-sum-digits-2.almd:3:31
  in call to string.from_int()
  hint: No function 'from_int' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   let str_n = string.from_int(abs_n)
  |                               ^^^^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-2.almd:8:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
8 |   sum
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let str_n = string.to_string(abs_n)
  let sum = list.fold(list.range(0, list.len(str_n)), 0, (acc, i) => {
    let digit = int.parse(str_n[i]).unwrap_or(0)
    acc + digit
  })
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected expression at line 10:1 (got Test 'test')
  --> /tmp/dojo-sum-digits-3.almd:10:1
   |
10 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
   | ^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-3.almd:3:32
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   let str_n = string.to_string(abs_n)
  |                                ^^^^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-3.almd:8:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
8 |   sum
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
