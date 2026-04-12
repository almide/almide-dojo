# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected Eq at line 2:11 (got Ident 'loop')
  --> /tmp/dojo-sum-digits-3.almd:2:11
  hint: Missing '=' before value. Write: let x = value
  |
2 |   let rec loop = (x, acc) => if x == 0 then acc else loop((x / 10, acc + x % 10))
  |           ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-3.almd:2:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  |
2 |   let rec loop = (x, acc) => if x == 0 then acc else loop((x / 10, acc + x % 10))
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn sum_digits(n: Int) -> Int = 
  let rec loop = (x, acc) => if x == 0 then acc else loop((x / 10, acc + x % 10))
  in loop((int.abs(n), 0))
```
