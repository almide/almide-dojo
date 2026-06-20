# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, _) => acc + int.parse(int.get(int.to_string(n), _))) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:60
  in call to list.len()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, _) => acc + int.parse(int.get(int.to_string(n), _)))
  |                                                            ^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-0.almd:2:123
  in call to int.get()
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, _) => acc + int.parse(int.get(int.to_string(n), _)))
  |                                                                                                                           ^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:2:123
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, _) => acc + int.parse(int.get(int.to_string(n), _)))
  |                                                                                                                           ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, _) => acc + int.parse(int.get(int.to_string(n), _)))
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
  let digits = string.chars(int.to_string(n))
  let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x)) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:3:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                              ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = string.chars(int.to_string(n))
  let sum = list.fold(digits, 0, (acc, x) => 
    match int.parse(x) {
      ok(d) => acc + d,
      err(_) => acc
    }
  ) in 
  sum
```
