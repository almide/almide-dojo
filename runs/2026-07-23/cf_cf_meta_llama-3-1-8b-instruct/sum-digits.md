# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs(int.to_int(n) / 10 pow i) % 10) in 
  int.abs(sum)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Missing ',' between function arguments at line 2:98
  --> /tmp/dojo-sum-digits-0.almd:2:98
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs(int.to_int(n) / 10 pow i) % 10) in
  |                                                                                                  ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:3:11
  in variable sum
  hint: Check the variable name
  |
3 |   int.abs(sum)
  |           ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in 
  int.abs(sum)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected ')' to close parenthesized expression opened at line 2:79
  --> /tmp/dojo-sum-digits-1.almd:2:99
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in
  |                                                                               --------------- '(' opened here
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in
  |                                                                                                   ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-1.almd:3:11
  in variable sum
  hint: Check the variable name
  |
3 |   int.abs(sum)
  |           ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in 
  int.abs(sum)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected ')' to close parenthesized expression opened at line 2:79
  --> /tmp/dojo-sum-digits-2.almd:2:99
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in
  |                                                                               --------------- '(' opened here
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in
  |                                                                                                   ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-2.almd:3:11
  in variable sum
  hint: Check the variable name
  |
3 |   int.abs(sum)
  |           ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected ')' to close parenthesized expression opened at line 2:79
  --> /tmp/dojo-sum-digits-3.almd:2:99
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in
  |                                                                               --------------- '(' opened here
  |
2 |   let sum = list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.abs((int.to_int(n) / 10 pow i) % 10)) in
  |                                                                                                   ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-3.almd:3:3
  in variable sum
  hint: Check the variable name
  |
3 |   sum
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
