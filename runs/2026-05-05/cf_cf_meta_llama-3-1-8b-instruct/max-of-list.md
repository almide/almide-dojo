# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'option.max'
  --> /tmp/dojo-max-of-list-0.almd:3:63
  in call to option.max()
  hint: Did you mean `option.map`?
  try:
      // option.max(...)  →  option.map(...)
      option.map(...)
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
  |                                                               ^^^

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
  else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E002]: undefined function 'option.max'
  --> /tmp/dojo-max-of-list-1.almd:3:63
  in call to option.max()
  hint: Did you mean `option.map`?
  try:
      // option.max(...)  →  option.map(...)
      option.map(...)
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
  |                                                               ^^^

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
  else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E002]: undefined function 'option.max'
  --> /tmp/dojo-max-of-list-2.almd:3:63
  in call to option.max()
  hint: Did you mean `option.map`?
  try:
      // option.max(...)  →  option.map(...)
      option.map(...)
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
  |                                                               ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E002]: undefined function 'option.max'
  --> /tmp/dojo-max-of-list-3.almd:3:63
  in call to option.max()
  hint: Did you mean `option.map`?
  try:
      // option.max(...)  →  option.map(...)
      option.map(...)
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => option.max(x, acc))
  |                                                               ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
