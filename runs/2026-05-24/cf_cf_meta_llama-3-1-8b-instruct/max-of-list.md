# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.from_string("-inf"), (acc, x) => if int.to_int(x) > int.to_int(acc) then x else acc) |> some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected LParen at line 3:118 (got Newline '')
  --> /tmp/dojo-max-of-list-0.almd:3:118
  |
3 |   else list.fold(xs, Int.from_string("-inf"), (acc, x) => if int.to_int(x) > int.to_int(acc) then x else acc) |> some
  |                                                                                                                      ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, int.to_int(Int.from_string("-inf")), (acc, x) => if int.to_int(x) > acc then int.to_int(x) else acc) |> some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected LParen at line 3:130 (got Newline '')
  --> /tmp/dojo-max-of-list-1.almd:3:130
  |
3 |   else list.fold(xs, int.to_int(Int.from_string("-inf")), (acc, x) => if int.to_int(x) > acc then int.to_int(x) else acc) |> some
  |                                                                                                                                  ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, int.to_int(Int.from_string("-inf")), (acc, x) => if int.to_int(x) > acc then int.to_int(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-max-of-list-2.almd:3:33
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, int.to_int(Int.from_string("-inf")), (acc, x) => if int.to_int(x) > acc then int.to_int(x) else acc)
  |                                 ^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-max-of-list-2.almd:3:85
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, int.to_int(Int.from_string("-inf")), (acc, x) => if int.to_int(x) > acc then int.to_int(x) else acc)
  |                                                                                     ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-max-of-list-2.almd:3:110
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, int.to_int(Int.from_string("-inf")), (acc, x) => if int.to_int(x) > acc then int.to_int(x) else acc)
  |                                                                                                              ^
error[E001]: type mismatch in method call: expected Int but got fn(String) -> ?1
  --> /tmp/dojo-max-of-list-2.almd:3:33
  in method call
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, int.to_int(Int.from_string("-inf")), (acc, x) => if int.to_int(x) > acc then int.to_int(x) else acc)
  |                                 ^^^

4 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, math.to_int(-inf), (acc, x) => if math.to_int(x) > acc then math.to_int(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E003]: undefined variable 'inf'
  --> /tmp/dojo-max-of-list-3.almd:4:33
  in variable inf
  hint: Check the variable name
  |
4 | else list.fold(xs, math.to_int(-inf), (acc, x) => if math.to_int(x) > acc then math.to_int(x) else acc)
  |                                 ^^^
error[E002]: undefined function 'math.to_int'
  --> /tmp/dojo-max-of-list-3.almd:4:33
  in call to math.to_int()
  hint: No function 'to_int' in module 'math'. See docs/CHEATSHEET.md for available functions
  |
4 | else list.fold(xs, math.to_int(-inf), (acc, x) => if math.to_int(x) > acc then math.to_int(x) else acc)
  |                                 ^^^
error[E002]: undefined function 'math.to_int'
  --> /tmp/dojo-max-of-list-3.almd:4:66
  in call to math.to_int()
  hint: No function 'to_int' in module 'math'. See docs/CHEATSHEET.md for available functions
  |
4 | else list.fold(xs, math.to_int(-inf), (acc, x) => if math.to_int(x) > acc then math.to_int(x) else acc)
  |                                                                  ^
error[E002]: undefined function 'math.to_int'
  --> /tmp/dojo-max-of-list-3.almd:4:92
  in call to math.to_int()
  hint: No function 'to_int' in module 'math'. See docs/CHEATSHEET.md for available functions
  |
4 | else list.fold(xs, math.to_int(-inf), (acc, x) => if math.to_int(x) > acc then math.to_int(x) else acc)
  |                                                                                            ^

4 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
