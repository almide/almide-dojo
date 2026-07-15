# fibonacci

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn fibonacci(n: Int) -> Int {
  if n == 0 {
    0
  } else if n == 1 {
    1
  } else {
    fibonacci(n - 1) + fibonacci(n - 2)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-0.almd
error: Missing '=' before function body at line 1:29
  --> /tmp/dojo-fibonacci-0.almd:1:29
  hint: Almide requires '=' before the body. Write: fn fibonacci(...) -> Type = { ... }
  |
1 | fn fibonacci(n: Int) -> Int {
  |                             ^

1 error(s) found
Compile error for /tmp/dojo-fibonacci-0.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = {
  if n == 0 {
    0
  } else if n == 1 {
    1
  } else {
    fibonacci(n - 1) + fibonacci(n - 2)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-1.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-fibonacci-1.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-fibonacci-1.almd:4:5
  |
4 |   } else if n == 1 {
  |     ^
error[E001]: type mismatch in fn 'fibonacci': expected Int but got Unit
  --> /tmp/dojo-fibonacci-1.almd:1:31
  in fn 'fibonacci'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn fibonacci(n: Int) -> Int = {
  |                               ^

3 error(s) found
Compile error for /tmp/dojo-fibonacci-1.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = {
  if n == 0 {
    0
  } else if n == 1 {
    1
  } else {
    fibonacci(n - 1) + fibonacci(n - 2)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-2.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-fibonacci-2.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-fibonacci-2.almd:4:5
  |
4 |   } else if n == 1 {
  |     ^
error[E001]: type mismatch in fn 'fibonacci': expected Int but got Unit
  --> /tmp/dojo-fibonacci-2.almd:1:31
  in fn 'fibonacci'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn fibonacci(n: Int) -> Int = {
  |                               ^

3 error(s) found
Compile error for /tmp/dojo-fibonacci-2.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = {
  if n == 0 {
    0
  } else if n == 1 {
    1
  } else {
    fibonacci(n - 1) + fibonacci(n - 2)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-3.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-fibonacci-3.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-fibonacci-3.almd:4:5
  |
4 |   } else if n == 1 {
  |     ^
error[E001]: type mismatch in fn 'fibonacci': expected Int but got Unit
  --> /tmp/dojo-fibonacci-3.almd:1:31
  in fn 'fibonacci'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn fibonacci(n: Int) -> Int = {
  |                               ^

3 error(s) found
Compile error for /tmp/dojo-fibonacci-3.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-3.almd

1/1 test file(s) failed

```
