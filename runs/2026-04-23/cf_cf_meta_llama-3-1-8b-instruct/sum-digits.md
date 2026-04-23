# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = int.len(n) in 
  let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)) % 10) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-0.almd:2:24
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
2 |   let digits = int.len(n)
  |                        ^
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-0.almd:3:84
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
3 |   let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)) % 10)
  |                                                                                    ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = int.to_string(n).len() in 
  let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)).to_int() % 10) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-1.almd:3:84
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
3 |   let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)).to_int() % 10)
  |                                                                                    ^
error[E002]: undefined method 'to_int' on int
  --> /tmp/dojo-sum-digits-1.almd:3:84
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `to_int` on `int`. Run `almide explain E002` for examples.
  |
3 |   let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)).to_int() % 10)
  |                                                                                    ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = int.to_string(n).len() in 
  let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)) % 10) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-2.almd:3:84
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
3 |   let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)) % 10)
  |                                                                                    ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = int.to_string(n).len() in 
  let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)) % 10) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-3.almd:3:84
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
3 |   let sum = list.fold(list.range(0, digits), 0, (acc, i) => acc + (n / int.pow(10, i)) % 10)
  |                                                                                    ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
