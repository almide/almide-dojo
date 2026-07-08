# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then 
    sum_digits(int.abs(n))
  else 
    if n == 0 then 0
    else int.to_int(float.to_float(n % 10) + sum_digits(int.to_float(n / 10)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-sum-digits-0.almd:6:40
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
6 |     else int.to_int(float.to_float(n % 10) + sum_digits(int.to_float(n / 10)))
  |                                        ^^
error[E005]: argument 'n' expects Int but got Float
  --> /tmp/dojo-sum-digits-0.almd:6:74
  in call to sum_digits()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
1 | fn sum_digits(n: Int) -> Int =
  | ---------------------------- fn sum_digits() defined here
...
6 |     else int.to_int(float.to_float(n % 10) + sum_digits(int.to_float(n / 10)))
  |                                                                          ^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:6:74
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     else int.to_int(float.to_float(n % 10) + sum_digits(int.to_float(n / 10)))
  |                                                                          ^^
error[E001]: type mismatch in call to sum_digits(): expected Int but got Float
  --> /tmp/dojo-sum-digits-0.almd:6:74
  in call to sum_digits()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
6 |     else int.to_int(float.to_float(n % 10) + sum_digits(int.to_float(n / 10)))
  |                                                                          ^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n < 0 then 
    sum_digits(int.abs(n))
  else 
    if n == 0 then 0
    else int.to_int(float.sqrt(int.to_float(n % 10)) + sum_digits(int.to_int(float.sqrt(int.to_float(n / 10)))))


fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else int.to_int(float.sqrt(int.to_float(n % 10))) + sum_digits(int.to_int(float.sqrt(int.to_float(n / 10))))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E012]: duplicate function 'sum_digits'
  at line 9
  in fn sum_digits
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn sum_digits(n: Int) -> Int =
  | ------------------------------------- first definition of 'sum_digits' here
...
9 | fn sum_digits(n: Int) -> Int =
  | ^^^^^^^^^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-1.almd:6:106
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     else int.to_int(float.sqrt(int.to_float(n % 10)) + sum_digits(int.to_int(float.sqrt(int.to_float(n / 10)))))
  |                                                                                                          ^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-1.almd:6:106
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     else int.to_int(float.sqrt(int.to_float(n % 10)) + sum_digits(int.to_int(float.sqrt(int.to_float(n / 10)))))
  |                                                                                                          ^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-1.almd:11:47
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
11 |   else int.to_int(float.sqrt(int.to_float(n % 10))) + sum_digits(int.to_int(float.sqrt(int.to_float(n / 10))))
   |                                               ^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-1.almd:11:105
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
11 |   else int.to_int(float.sqrt(int.to_float(n % 10))) + sum_digits(int.to_int(float.sqrt(int.to_float(n / 10))))
   |                                                                                                         ^^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else int.to_string(n).chars().map(int.parse).sum()
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'xs' expects List[Int] but got List[Result[Int, String]]
  --> /tmp/dojo-sum-digits-2.almd:3:22
  in call to list.sum()
  hint: Fix the argument type
  |
3 |   else int.to_string(n).chars().map(int.parse).sum()
  |                      ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[Result[Int, String]]
  --> /tmp/dojo-sum-digits-2.almd:3:22
  in call to list.sum()
  hint: Fix the expression type or change the expected type
  |
3 |   else int.to_string(n).chars().map(int.parse).sum()
  |                      ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else int.to_string(n).chars().map(int.parse).filter_map(option.unwrap_or_else(_, fn(_) => 0)).sum()
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected expression at line 3:84 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-3.almd:3:84
  |
3 |   else int.to_string(n).chars().map(int.parse).filter_map(option.unwrap_or_else(_, fn(_) => 0)).sum()
  |                                                                                    ^
error: Expected function name at line 3:86 (got LParen '(')
  --> /tmp/dojo-sum-digits-3.almd:3:86
  |
3 |   else int.to_string(n).chars().map(int.parse).filter_map(option.unwrap_or_else(_, fn(_) => 0)).sum()
  |                                                                                      ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
