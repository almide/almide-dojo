# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => int.parse(c)), 0, (acc, x) => acc + x) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
internal compiler error: IR verify: AddInt expects Int operands, got Int and Result[Int, String] (in sum_digits) at line 2
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => option.unwrap_or(int.parse(c), 0)), 0, (acc, x) => acc + x) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'o' expects Option[A] but got Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:2:102
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => option.unwrap_or(int.parse(c), 0)), 0, (acc, x) => acc + x)
  |                                                                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:2:102
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => option.unwrap_or(int.parse(c), 0)), 0, (acc, x) => acc + x)
  |                                                                                                      ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => match int.parse(c) { ok(x) => x, err(_) => 0 }), 0, (acc, x) => acc + x) in 
  sum
```
