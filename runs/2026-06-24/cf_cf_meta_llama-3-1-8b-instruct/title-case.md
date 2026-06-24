# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-title-case-1.almd:3:108
  in call to string.capitalize()
  hint: Fix the argument type
  |
3 |   let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  |                                                                                                            ^^^^
error[E001]: type mismatch in call to string.capitalize(): expected String but got Option[String]
  --> /tmp/dojo-title-case-1.almd:3:108
  in call to string.capitalize()
  hint: Fix the expression type or change the expected type
  |
3 |   let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  |                                                                                                            ^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => 
    let first_char = string.first(word)
    string.to_lower(string.drop(first_char)) + string.capitalize(first_char)
  )
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-title-case-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let first_char = string.first(word)
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-title-case-2.almd:6:3
  |
6 |   )
  |   ^
error[E003]: undefined variable 'first_char'
  --> /tmp/dojo-title-case-2.almd:5:33
  in variable first_char
  hint: Check the variable name
  |
5 |     string.to_lower(string.drop(first_char)) + string.capitalize(first_char)
  |                                 ^^^^^^^^^^
error[E004]: string.drop() expects 2 argument(s) but got 1
  --> /tmp/dojo-title-case-2.almd:5:33
  in call to string.drop()
  hint: Check the number of arguments
  try:
      // string.drop() takes 2 arg(s) — you passed 1
      string.drop(<s: String>, <n: Int>)
  |
5 |     string.to_lower(string.drop(first_char)) + string.capitalize(first_char)
  |                                 ^^^^^^^^^^
error[E003]: undefined variable 'first_char'
  --> /tmp/dojo-title-case-2.almd:5:66
  in variable first_char
  hint: Check the variable name
  |
5 |     string.to_lower(string.drop(first_char)) + string.capitalize(first_char)
  |                                                                  ^^^^^^^^^^
error[E003]: undefined variable 'capitalized_words'
  --> /tmp/dojo-title-case-2.almd:7:15
  in variable capitalized_words
  hint: Check the variable name
  |
7 |   string.join(capitalized_words, " ")
  |               ^^^^^^^^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => 
    let first_char = string.first(word)
    let rest = string.drop(first_char)
    string.to_lower(rest) + string.capitalize(first_char)
  )
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-title-case-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let first_char = string.first(word)
  |     ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-title-case-3.almd:7:3
  |
7 |   )
  |   ^
error[E003]: undefined variable 'first_char'
  --> /tmp/dojo-title-case-3.almd:5:28
  in variable first_char
  hint: Check the variable name
  |
5 |     let rest = string.drop(first_char)
  |                            ^^^^^^^^^^
error[E004]: string.drop() expects 2 argument(s) but got 1
  --> /tmp/dojo-title-case-3.almd:5:28
  in call to string.drop()
  hint: Check the number of arguments
  try:
      // string.drop() takes 2 arg(s) — you passed 1
      string.drop(<s: String>, <n: Int>)
  |
5 |     let rest = string.drop(first_char)
  |                            ^^^^^^^^^^
error[E003]: undefined variable 'first_char'
  --> /tmp/dojo-title-case-3.almd:6:47
  in variable first_char
  hint: Check the variable name
  |
6 |     string.to_lower(rest) + string.capitalize(first_char)
  |                                               ^^^^^^^^^^
error[E003]: undefined variable 'capitalized_words'
  --> /tmp/dojo-title-case-3.almd:8:15
  in variable capitalized_words
  hint: Check the variable name
  |
8 |   string.join(capitalized_words, " ")
  |               ^^^^^^^^^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
