# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, Map[String, Int](), (map, word) => 
    map.get_or(word, 0) + 1 => map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses at line 2:45
  --> /tmp/dojo-word-count-0.almd:2:45
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-0.almd:4:29
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
4 |     map.get_or(word, 0) + 1 => map.set(word, map.get_or(word, 0) + 1))
  |                             ^^
error: Lambda parameter must be wrapped in parentheses at line 4:29
  --> /tmp/dojo-word-count-0.almd:4:29
  |
4 |     map.get_or(word, 0) + 1 => map.set(word, map.get_or(word, 0) + 1))
  |                             ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:2:3
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |   ^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "")
  list.fold(words, Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0)
    map.set(word, count + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-1.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses at line 2:45
  --> /tmp/dojo-word-count-1.almd:2:45
  |
2 |   let words = string.split(s, " ").filter(x => x != "")
  |                                             ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0)
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-word-count-1.almd:4:5
  |
4 |     let count = map.get_or(word, 0)
  |     ^
error: Expected expression at line 5:29 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:5:29
  |
5 |     map.set(word, count + 1))
  |                             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count + 1))
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count + 1))
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count + 1))
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1))
  |                           ^

9 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "").map(x => x)
  list.fold(words, Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0)
    map.set(word, count + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-2.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "").map(x => x)
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses at line 2:45
  --> /tmp/dojo-word-count-2.almd:2:45
  |
2 |   let words = string.split(s, " ").filter(x => x != "").map(x => x)
  |                                             ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0)
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-word-count-2.almd:4:5
  |
4 |     let count = map.get_or(word, 0)
  |     ^
error: Expected expression at line 5:29 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:5:29
  |
5 |     map.set(word, count + 1))
  |                             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count + 1))
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count + 1))
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count + 1))
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1))
  |                           ^

9 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(x => x != "").map(x => x)
  list.fold(words, Map[String, Int](), (map, word) => 
    let count = map.get_or(word, 0)
    map.set(word, count + 1)).as_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-word-count-3.almd:2:45
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let words = string.split(s, " ").filter(x => x != "").map(x => x)
  |                                             ^^
error: Lambda parameter must be wrapped in parentheses at line 2:45
  --> /tmp/dojo-word-count-3.almd:2:45
  |
2 |   let words = string.split(s, " ").filter(x => x != "").map(x => x)
  |                                             ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0)
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-word-count-3.almd:4:5
  |
4 |     let count = map.get_or(word, 0)
  |     ^
error: Expected expression at line 5:29 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:5:29
  |
5 |     map.set(word, count + 1)).as_map
  |                             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count + 1)).as_map
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count + 1)).as_map
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  |
5 |     map.set(word, count + 1)).as_map
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
5 |     map.set(word, count + 1)).as_map
  |                           ^

9 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
