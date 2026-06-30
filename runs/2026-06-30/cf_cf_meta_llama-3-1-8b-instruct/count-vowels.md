# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int {
  list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c)))
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
error: Expected function name at line 2:37 (got LParen '(')
  --> /tmp/dojo-count-vowels-0.almd:2:37
  |
2 |   list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c)))
  |                                     ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c)))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: Expected expression at line 2:35 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-1.almd:2:35
  |
2 |   list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c)))
  |                                   ^
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
  list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c.to_lower())))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-2.almd
error: Expected expression at line 2:35 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-2.almd:2:35
  |
2 |   list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c.to_lower())))
  |                                   ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-2.almd:1:37
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
Compile error for /tmp/dojo-count-vowels-2.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c.to_lower())).map(fn(_) => 1))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-3.almd
error: Expected expression at line 2:35 (got Fn 'fn')
  --> /tmp/dojo-count-vowels-3.almd:2:35
  |
2 |   list.len(string.chars(s).filter(fn(c) => string.contains("aeiou", c.to_lower())).map(fn(_) => 1))
  |                                   ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-3.almd:1:37
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
Compile error for /tmp/dojo-count-vowels-3.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-3.almd

1/1 test file(s) failed

```
