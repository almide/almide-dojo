# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  string.join(string.map(words, string.capitalize), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-title-case-0.almd:3:39
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.join(string.map(words, string.capitalize), " ")
  |                                       ^

1 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  string.join(list.map(words, string.capitalize), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  string.join(list.map(words, (word) => string.capitalize(word) | string.to_lower(word)), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error: '|x|' closure syntax is not valid in Almide at line 3:65
  --> /tmp/dojo-title-case-2.almd:3:65
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |   string.join(list.map(words, (word) => string.capitalize(word) | string.to_lower(word)), " ")
  |                                                                 ^
error[E001]: type mismatch in fn 'title_case': expected String but got Unit
  --> /tmp/dojo-title-case-2.almd:2:31
  in fn 'title_case'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let words = string.split(s, " ")
  |                               ^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.capitalize(word) | string.to_lower(word))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error: '|x|' closure syntax is not valid in Almide at line 3:77
  --> /tmp/dojo-title-case-3.almd:3:77
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |   let capitalized_words = list.map(words, (word) => string.capitalize(word) | string.to_lower(word))
  |                                                                             ^
error[E003]: undefined variable 'capitalized_words'
  --> /tmp/dojo-title-case-3.almd:4:15
  in variable capitalized_words
  hint: Check the variable name
  |
4 |   string.join(capitalized_words, " ")
  |               ^^^^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
