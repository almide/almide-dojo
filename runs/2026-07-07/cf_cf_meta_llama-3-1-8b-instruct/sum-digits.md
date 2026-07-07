# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i))) 
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:60
  in call to list.len()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i)))
  |                                                            ^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-0.almd:2:123
  in call to int.get()
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i)))
  |                                                                                                                           ^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:2:123
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i)))
  |                                                                                                                           ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i)))
  |                                                            ^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let str_n = int.to_string(n)
  in list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-sum-digits-1.almd:3:96
  in call to int.parse()
  hint: Fix the argument type
  |
3 |   list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)))
  |                                                                                                ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:3:96
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)))
  |                                                                                                ^
error[E001]: type mismatch in call to int.parse(): expected String but got Option[String]
  --> /tmp/dojo-sum-digits-1.almd:3:96
  in call to int.parse()
  hint: Fix the expression type or change the expected type
  |
3 |   list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => acc + int.parse(string.get(str_n, i)))
  |                                                                                                ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let str_n = int.to_string(n)
  in list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => 
    match string.get(str_n, i) {
      some(c) => acc + int.parse(c),
      none => acc
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:5:34
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |       some(c) => acc + int.parse(c),
  |                                  ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let str_n = int.to_string(n)
  in list.fold(list.range(0, string.len(str_n)), 0, (acc, i) => 
    match string.get(str_n, i) {
      some(c) => match int.parse(c) {
        ok(x) => acc + x,
        err(_) => acc
      },
      none => acc
    })
```
