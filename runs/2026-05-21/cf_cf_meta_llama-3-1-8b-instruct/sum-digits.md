# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    (n >= 0) 
    ? list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
    : list.fold(list.chars(int.to_string(int.abs(n))), 0, (acc, x) -> acc + int.parse(x))
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 4:5 (got Question '?')
  --> /tmp/dojo-sum-digits-0.almd:4:5
  |
4 |     ? list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
  |     ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:3:11
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
3 |     (n >= 0)
  |           ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n >= 0 
    then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
    else list.fold(list.chars(int.to_string(int.abs(n))), 0, (acc, x) -> acc + int.parse(x))
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected ')' to close function call opened at line 4:19
  --> /tmp/dojo-sum-digits-1.almd:4:62
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
  |                   --------------- '(' opened here
  |
4 |     then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
  |                                                              ^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-1.almd:2:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum =
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n >= 0 
    then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
    else list.fold(list.chars(int.to_string(int.abs(n))), 0, (acc, x) -> acc + int.parse(x))
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected ')' to close function call opened at line 4:19
  --> /tmp/dojo-sum-digits-2.almd:4:62
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
  |                   --------------- '(' opened here
  |
4 |     then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
  |                                                              ^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-2.almd:6:3
  in variable sum
  hint: Check the variable name
  |
6 |   sum
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n >= 0 
    then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
    else list.fold(list.chars(int.to_string(int.abs(n))), 0, (acc, x) -> acc + int.parse(x))
  list.fold(list.chars(int.to_string(sum)), 0, (acc, x) -> acc + int.parse(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected ')' to close function call opened at line 4:19
  --> /tmp/dojo-sum-digits-3.almd:4:62
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |     then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
  |                   --------------- '(' opened here
  |
4 |     then list.fold(list.chars(int.to_string(n)), 0, (acc, x) -> acc + int.parse(x))
  |                                                              ^^
error: Expected ')' to close function call opened at line 6:12
  --> /tmp/dojo-sum-digits-3.almd:6:57
  hint: Add ')' or check for a missing delimiter inside the function call
  |
6 |   list.fold(list.chars(int.to_string(sum)), 0, (acc, x) -> acc + int.parse(x))
  |            --------------- '(' opened here
  |
6 |   list.fold(list.chars(int.to_string(sum)), 0, (acc, x) -> acc + int.parse(x))
  |                                                         ^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-3.almd:2:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum =
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
