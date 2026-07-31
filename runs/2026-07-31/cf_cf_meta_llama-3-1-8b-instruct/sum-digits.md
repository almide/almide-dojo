# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs = int.abs(n)
  let sum = list.fold(list.range(0, list.len(int.to_string(abs))), 0, (acc, i) => {
    let digit = int.to_string(abs) |> string.get(i, 0) |> int.parse
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:3:60
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let sum = list.fold(list.range(0, list.len(int.to_string(abs))), 0, (acc, i) => {
  |                                                            ^^^
error[E004]: string.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-sum-digits-0.almd:4:53
  in call to string.get()
  hint: Check the number of arguments
  try:
      // string.get() takes 2 arg(s) — you passed 3
      string.get(<s: String>, <i: Int>)
  |
4 |     let digit = int.to_string(abs) |> string.get(i, 0) |> int.parse
  |                                                     ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-sum-digits-0.almd:4:53
  in call to int.parse()
  hint: Fix the argument type
  |
4 |     let digit = int.to_string(abs) |> string.get(i, 0) |> int.parse
  |                                                     ^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:5:11
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |     acc + digit
  |           ^^^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:3:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let sum = list.fold(list.range(0, list.len(int.to_string(abs))), 0, (acc, i) => {
  |                                                            ^^^
error[E001]: type mismatch in call to int.parse(): expected String but got Option[String]
  --> /tmp/dojo-sum-digits-0.almd:4:53
  in call to int.parse()
  hint: Fix the expression type or change the expected type
  |
4 |     let digit = int.to_string(abs) |> string.get(i, 0) |> int.parse
  |                                                     ^

6 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs = int.abs(n)
  let sum = list.fold(list.range(0, list.len(int.to_string(abs))), 0, (acc, i) => {
    let str = int.to_string(abs)
    let digit = list.get(str, i) |> option.unwrap_or(0) |> int.parse
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:3:60
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let sum = list.fold(list.range(0, list.len(int.to_string(abs))), 0, (acc, i) => {
  |                                                            ^^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:5:31
  in call to list.get()
  hint: Fix the argument type
  |
5 |     let digit = list.get(str, i) |> option.unwrap_or(0) |> int.parse
  |                               ^
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-sum-digits-1.almd:5:54
  in call to int.parse()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
  |
5 |     let digit = list.get(str, i) |> option.unwrap_or(0) |> int.parse
  |                                                      ^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:6:11
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |     acc + digit
  |           ^^^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:3:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let sum = list.fold(list.range(0, list.len(int.to_string(abs))), 0, (acc, i) => {
  |                                                            ^^^
error[E001]: type mismatch in call to list.get(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:5:31
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
5 |     let digit = list.get(str, i) |> option.unwrap_or(0) |> int.parse
  |                               ^
error[E001]: type mismatch in call to int.parse(): expected String but got Int
  --> /tmp/dojo-sum-digits-1.almd:5:54
  in call to int.parse()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
  |
5 |     let digit = list.get(str, i) |> option.unwrap_or(0) |> int.parse
  |                                                      ^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs = int.abs(n)
  let str = int.to_string(abs)
  let sum = list.fold(list.range(0, list.len(str)), 0, (acc, i) => {
    let digit = str.slice(i, i + 1)
    let num = int.parse(digit)
    acc + num
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:4:46
  in call to list.len()
  hint: Fix the argument type
  |
4 |   let sum = list.fold(list.range(0, list.len(str)), 0, (acc, i) => {
  |                                              ^^^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:7:11
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |     acc + num
  |           ^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:4:46
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
4 |   let sum = list.fold(list.range(0, list.len(str)), 0, (acc, i) => {
  |                                              ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs = int.abs(n)
  let str = int.to_string(abs)
  let sum = list.fold(list.range(0, list.len(str)), 0, (acc, i) => {
    let digit = str.slice(i, i + 1)
    let num = int.parse(digit).unwrap_or(0)
    acc + num
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:4:46
  in call to list.len()
  hint: Fix the argument type
  |
4 |   let sum = list.fold(list.range(0, list.len(str)), 0, (acc, i) => {
  |                                              ^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:4:46
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
4 |   let sum = list.fold(list.range(0, list.len(str)), 0, (acc, i) => {
  |                                              ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
