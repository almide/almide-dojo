# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
    let abs_n = int.abs(n)
    in list.fold(string.chars(int.to_string(abs_n)), 0, (acc, x) => acc + int.parse(x).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-sum-digits-0.almd:3:5
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
3 |     in list.fold(string.chars(int.to_string(abs_n)), 0, (acc, x) => acc + int.parse(x).unwrap_or(0))
  |     ^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:2:25
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let abs_n = ...` (a statement, returns Unit).
      // Add `abs_n` as the trailing expression so the fn returns Int:
      //
      //   let abs_n = <computation>
      //   abs_n                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
2 |     let abs_n = int.abs(n)
  |                         ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
    let abs_n = int.abs(n)
    let chars = string.chars(int.to_string(abs_n))
    list.fold(chars, 0, (acc, x) => acc + int.parse(x).unwrap_or(0))
```
