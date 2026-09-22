# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    let max = 
      list.fold(xs, 
        int.min_value, 
        (acc, x) => 
          if x > acc then x else acc)
    in 
    some(max)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-0.almd:4:5
  in let-in
  here: let max =
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let max =
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-max-of-list-0.almd:4:5
  here: let max =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let max =
  |     ^

2 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    let max = 
      { let acc = int.min_value in list.fold(xs, acc, (x, acc) => if x > acc then x else acc) }
    in 
    some(max)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-1.almd:4:5
  in let-in
  here: let max =
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let max =
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-max-of-list-1.almd:4:5
  here: let max =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let max =
  |     ^

2 error(s) found
FAILED: /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    let acc = int.min_value
    list.fold(xs, acc, (x, acc) => if x > acc then x else acc) |>
    some

fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    let acc = int.min_value
    list.fold(xs, acc, (x, acc) => if x > acc then x else acc)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-2.almd:4:5
  in let-in
  here: let acc = int.min_value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let acc = int.min_value
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-max-of-list-2.almd:4:5
  here: let acc = int.min_value
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let acc = int.min_value
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-2.almd:11:5
  in let-in
  here: let acc = int.min_value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let acc = int.min_value
   |     ^^^
error: 'let' is not an expression in Almide at line 11:5
  --> /tmp/dojo-max-of-list-2.almd:11:5
  here: let acc = int.min_value
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let acc = int.min_value
   |     ^
error[E012]: duplicate function 'max_of_list'
  at line 8
  in fn max_of_list
  here: fn max_of_list(xs: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | -------------------------------------- first definition of 'max_of_list' here
...
8 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | ^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-max-of-list-2.almd
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    let acc = int.min_value
    list.fold(xs, acc, (x, acc) => if x > acc then x else acc) |>
    some

fn max_of_list(xs: List[Int]) -> Option[Int] =
  if list.is_empty(xs) then none
  else 
    let acc = int.min_value
    list.fold(xs, acc, (x, acc) => if x > acc then x else acc) |>
    some
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-3.almd:4:5
  in let-in
  here: let acc = int.min_value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let acc = int.min_value
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-max-of-list-3.almd:4:5
  here: let acc = int.min_value
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let acc = int.min_value
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-3.almd:11:5
  in let-in
  here: let acc = int.min_value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let acc = int.min_value
   |     ^^^
error: 'let' is not an expression in Almide at line 11:5
  --> /tmp/dojo-max-of-list-3.almd:11:5
  here: let acc = int.min_value
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let acc = int.min_value
   |     ^
error[E012]: duplicate function 'max_of_list'
  at line 8
  in fn max_of_list
  here: fn max_of_list(xs: List[Int]) -> Option[Int] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | -------------------------------------- first definition of 'max_of_list' here
...
8 | fn max_of_list(xs: List[Int]) -> Option[Int] =
  | ^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-max-of-list-3.almd
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
