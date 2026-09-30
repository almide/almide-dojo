# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, int.to_float(n)), (x) => n % x != 0)
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:29
  --> /tmp/dojo-is-prime-0.almd:1:29
  here: fn is_prime(n: Int) -> Bool {
  hint: Almide requires '=' before the body. Write: fn is_prime(...) -> Type = { ... }
  |
1 | fn is_prime(n: Int) -> Bool {
  |                             ^

1 error(s) found
FAILED: /tmp/dojo-is-prime-0.almd
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, int.to_float(n)), (x) => n % x != 0)
}
```

**Diagnostic:**

```
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-1.almd:5:31
  in call to list.range()
  here: else list.all(list.range(3, int.to_float(n)), (x) => n % x != 0)
  hint: Fix the argument type. Or use `float.to_int(x)` to convert Float to Int (truncates)
  try:
      // Try:
      float.to_int(int.to_float(n))
...
5 |   else list.all(list.range(3, int.to_float(n)), (x) => n % x != 0)
  |                               ^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-is-prime-1.almd
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, float.to_int(math.sqrt(int.to_float(n)))), (x) => n % x != 0)
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-is-prime-2.almd
  test: is_prime 9 is false
  at:   /tmp/dojo-is-prime-2.almd:15
  expected: false
  found:    true
  test: is_prime 25 is false
  at:   /tmp/dojo-is-prime-2.almd:17
  expected: false
  found:    true

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, float.to_int(math.sqrt(int.to_float(n)))), (x) => x != 2 && n % x != 0)
}
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 5:88
  --> /tmp/dojo-is-prime-3.almd:5:88
  here: else list.all(list.range(3, float.to_int(math.sqrt(int.to_float(n)))), (x) => x != 2 && n % x != 0)
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |   else list.all(list.range(3, float.to_int(math.sqrt(int.to_float(n)))), (x) => x != 2 && n % x != 0)
  |                                                                                        ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:1:31
  in fn 'is_prime'
  here: fn is_prime(n: Int) -> Bool = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
1 | fn is_prime(n: Int) -> Bool = {
  |                               ^

2 error(s) found
FAILED: /tmp/dojo-is-prime-3.almd
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
