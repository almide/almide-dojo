# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int {
  list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-count-vowels-0.almd:1:35
  hint: Almide requires '=' before the body. Write: fn count_vowels(...) -> Type = { ... }
  |
1 | fn count_vowels(s: String) -> Int {
  |                                   ^
error: Expected function name at line 2:33 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:33
  |
2 |   list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c))
  |                                 ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-1.almd:2:31
  |
2 |   list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c))
  |                               ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-1.almd:1:37
  in fn 'count_vowels'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
1 | fn count_vowels(s: String) -> Int = {
  |                                     ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c)) |>
  int.to_int
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-2.almd:2:31
  |
2 |   list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c)) |>
  |                               ^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-count-vowels-2.almd:3:3
  in variable int
  hint: Check the variable name
  |
3 |   int.to_int
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c)) |>
  int.to_int
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error: Expected expression at line 2:31 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-3.almd:2:31
  |
2 |   list.count(string.chars(s), fn(c) => list.contains(["a", "e", "i", "o", "u"], c)) |>
  |                               ^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-count-vowels-3.almd:3:3
  in variable int
  hint: Check the variable name
  |
3 |   int.to_int
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
