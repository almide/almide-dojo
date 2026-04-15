# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(x => x != "")
  list.fold(words, Map[String, Int](), (map, word) => 
    map.get_or(word, 0) + 1 => map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:2:53
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ") |> list.filter(x => x != "")
  |                                                     ^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:4:29
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
4 |     map.get_or(word, 0) + 1 => map.set(word, map.get_or(word, 0) + 1))
  |                             ^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:2:3
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
2 |   let words = string.split(s, " ") |> list.filter(x => x != "")
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(x => x != "")
  list.fold(words, Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0) + 1
    map.set(word, count) => count)
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-1.almd:2:53
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ") |> list.filter(x => x != "")
  |                                                     ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0) + 1
  |     ^^^
error: Expected expression at line 5:26 (got FatArrow '=>')
  --> /tmp/dojo-word-count-1.almd:5:26
  |
5 |     map.set(word, count) => count)
  |                          ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count) => count)
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count) => count)
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:19
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count) => count)
  |                   ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:5:19
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count) => count)
  |                   ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(x => x != "")
  list.fold(words, Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0) + 1
    map.set(word, count) 
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:2:53
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ") |> list.filter(x => x != "")
  |                                                     ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0) + 1
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:6:3
  |
6 |   )
  |   ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count)
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count)
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:19
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count)
  |                   ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:5:19
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count)
  |                   ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(x => x != "")
  list.fold(words, Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0) + 1
    Map[String, Int]().set(word, count) 
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-3.almd:2:53
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ") |> list.filter(x => x != "")
  |                                                     ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0) + 1
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:6:3
  |
6 |   )
  |   ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:28
  in variable word
  hint: Check the variable name
  |
5 |     Map[String, Int]().set(word, count)
  |                            ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:5:34
  in variable count
  hint: Check the variable name
  |
5 |     Map[String, Int]().set(word, count)
  |                                  ^^^^^
error[E001]: type mismatch in method call: expected Map but got fn(Unknown, Unknown) -> ?0
  --> /tmp/dojo-word-count-3.almd:5:5
  in method call
  hint: Fix the expression type or change the expected type
  |
5 |     Map[String, Int]().set(word, count)
  |     ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:5:5
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     Map[String, Int]().set(word, count)
  |     ^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
