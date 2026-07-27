# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits_sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, 
    (acc, _) => acc + int.parse(int.get(int.to_string(n), _)) 
  ) 
  in digits_sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:67
  in call to list.len()
  hint: Fix the argument type
  |
2 |   let digits_sum = list.fold(list.range(0, list.len(int.to_string(n))), 0,
  |                                                                   ^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-0.almd:3:59
  in call to int.get()
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |     (acc, _) => acc + int.parse(int.get(int.to_string(n), _))
  |                                                           ^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:3:59
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |     (acc, _) => acc + int.parse(int.get(int.to_string(n), _))
  |                                                           ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:67
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
2 |   let digits_sum = list.fold(list.range(0, list.len(int.to_string(n))), 0,
  |                                                                   ^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let str_n = int.to_string(int.abs(n))
  in list.fold(list.range(0, list.len(str_n)), 0, 
    (acc, i) => acc + int.parse(string.get(str_n, i))
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:3:36
  in call to list.len()
  hint: Fix the argument type
  |
3 |   list.fold(list.range(0, list.len(str_n)), 0,
  |                                    ^^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-sum-digits-1.almd:4:51
  in call to int.parse()
  hint: Fix the argument type
  |
4 |     (acc, i) => acc + int.parse(string.get(str_n, i))
  |                                                   ^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:4:51
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |     (acc, i) => acc + int.parse(string.get(str_n, i))
  |                                                   ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:3:36
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   list.fold(list.range(0, list.len(str_n)), 0,
  |                                    ^^^^^
error[E001]: type mismatch in call to int.parse(): expected String but got Option[String]
  --> /tmp/dojo-sum-digits-1.almd:4:51
  in call to int.parse()
  hint: Fix the expression type or change the expected type
  |
4 |     (acc, i) => acc + int.parse(string.get(str_n, i))
  |                                                   ^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let str_n = int.to_string(int.abs(n))
  in list.fold(list.range(0, list.len(str_n)), 0, 
    (acc, i) => match string.get(str_n, i) {
      some(c) => acc + int.parse(c),
      none => acc
    }
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:3:36
  in call to list.len()
  hint: Fix the argument type
  |
3 |   list.fold(list.range(0, list.len(str_n)), 0,
  |                                    ^^^^^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:5:34
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |       some(c) => acc + int.parse(c),
  |                                  ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:3:36
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   list.fold(list.range(0, list.len(str_n)), 0,
  |                                    ^^^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let str_n = int.to_string(int.abs(n))
  in list.fold(list.range(0, list.len(str_n)), 0, 
    (acc, i) => match string.get(str_n, i) {
      some(c) => match int.parse(c) {
        ok(d) => acc + d,
        err(_) => acc
      },
      none => acc
    }
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:3:36
  in call to list.len()
  hint: Fix the argument type
  |
3 |   list.fold(list.range(0, list.len(str_n)), 0,
  |                                    ^^^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:3:36
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   list.fold(list.range(0, list.len(str_n)), 0,
  |                                    ^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
