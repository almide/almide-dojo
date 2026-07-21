# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let max = list.fold(xs, xs.first(), (acc, x) => if x > acc then x else acc)
    some(max)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Int], Int) -> Option[Int] but got fn(Option[Int], Option[Int]) -> Option[Int]
  --> /tmp/dojo-max-of-list-0.almd:4:76
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     let max = list.fold(xs, xs.first(), (acc, x) => if x > acc then x else acc)
  |                                                                            ^^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-0.almd:5:10
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  |
5 |     some(max)
  |          ^^^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let max = list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
    some(max)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-1.almd:4:29
  in variable int
  hint: Check the variable name
  |
4 |     let max = list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                             ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let max = list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
    some(max)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-2.almd:4:29
  in variable int
  hint: Check the variable name
  |
4 |     let max = list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                             ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let max = list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
    some(max)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-3.almd:4:29
  in variable int
  hint: Check the variable name
  |
4 |     let max = list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                             ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
