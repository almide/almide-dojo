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
  let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected name at line 3:54 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-0.almd:3:54
  |
3 |   let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  |                                                      ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:4:3
  in variable sum
  hint: Check the variable name
  |
4 |   sum
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected name at line 3:54 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-1.almd:3:54
  |
3 |   let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  |                                                      ^
error: Expected name at line 4:44 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-1.almd:4:44
  |
4 |   int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  |                                            ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-1.almd:2:23
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let abs_n = int.abs(n)
  |                       ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected name at line 3:54 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-2.almd:3:54
  |
3 |   let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  |                                                      ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-2.almd:4:3
  in variable sum
  hint: Check the variable name
  |
4 |   sum
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  acc
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected name at line 3:54 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-3.almd:3:54
  |
3 |   let sum = int.fold(abs_n, 0, (acc, x) => acc + int.mod(x, 10))
  |                                                      ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-sum-digits-3.almd:4:3
  in variable acc
  hint: Check the variable name
  |
4 |   acc
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
