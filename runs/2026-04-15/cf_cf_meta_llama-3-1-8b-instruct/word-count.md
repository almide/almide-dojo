# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.filter(string.split(s, " "), (x) => x != "") 
  |> list.fold(Map[String, Int](), (m, x) => 
    match m.get_or(x, 0) {
      some(count) => m.set(x, count + 1),
      none => m.set(x, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?3
  --> /tmp/dojo-word-count-0.almd:6:15
  in call to list.fold()
  hint: Fix the argument type
  |
6 |       none => m.set(x, 1)
  |               ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?3
  --> /tmp/dojo-word-count-0.almd:6:15
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |       none => m.set(x, 1)
  |               ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-0.almd:6:15
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
6 |       none => m.set(x, 1)
  |               ^

3 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.filter(string.split(s, " "), (x) => x != "") 
  |> list.fold(Map[String, Int](), (m, x) => 
    match m.get_or(x, 0) {
      some(count) => Map.set(m, x, count + 1),
      none => Map.set(m, x, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?4
  --> /tmp/dojo-word-count-1.almd:6:15
  in call to list.fold()
  hint: Fix the argument type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in method call: expected Map but got fn(fn(?2, Int) -> ?3, ?2, Unknown) -> ?4
  --> /tmp/dojo-word-count-1.almd:5:22
  in method call
  hint: Fix the expression type or change the expected type
  |
5 |       some(count) => Map.set(m, x, count + 1),
  |                      ^^^
error[E001]: type mismatch in method call: expected Map but got fn(fn(?2, Int) -> ?3, ?2, Int) -> ?4
  --> /tmp/dojo-word-count-1.almd:6:15
  in method call
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?4
  --> /tmp/dojo-word-count-1.almd:6:15
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-1.almd:6:15
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.filter(string.split(s, " "), (x) => x != "") 
  |> list.fold(Map[String, Int](), (m, x) => 
    match m.get_or(x, 0) {
      some(count) => Map.set(m, x, count + 1),
      none => Map.set(m, x, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?4
  --> /tmp/dojo-word-count-2.almd:6:15
  in call to list.fold()
  hint: Fix the argument type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in method call: expected Map but got fn(fn(?2, Int) -> ?3, ?2, Unknown) -> ?4
  --> /tmp/dojo-word-count-2.almd:5:22
  in method call
  hint: Fix the expression type or change the expected type
  |
5 |       some(count) => Map.set(m, x, count + 1),
  |                      ^^^
error[E001]: type mismatch in method call: expected Map but got fn(fn(?2, Int) -> ?3, ?2, Int) -> ?4
  --> /tmp/dojo-word-count-2.almd:6:15
  in method call
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?4
  --> /tmp/dojo-word-count-2.almd:6:15
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-2.almd:6:15
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  list.filter(string.split(s, " "), (x) => x != "") 
  |> list.fold(Map[String, Int](), (m, x) => 
    match m.get_or(x, 0) {
      some(count) => Map.set(m, x, count + 1),
      none => Map.set(m, x, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E005]: argument 'f' expects fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?4
  --> /tmp/dojo-word-count-3.almd:6:15
  in call to list.fold()
  hint: Fix the argument type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in method call: expected Map but got fn(fn(?2, Int) -> ?3, ?2, Unknown) -> ?4
  --> /tmp/dojo-word-count-3.almd:5:22
  in method call
  hint: Fix the expression type or change the expected type
  |
5 |       some(count) => Map.set(m, x, count + 1),
  |                      ^^^
error[E001]: type mismatch in method call: expected Map but got fn(fn(?2, Int) -> ?3, ?2, Int) -> ?4
  --> /tmp/dojo-word-count-3.almd:6:15
  in method call
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map, String) -> Map but got fn(fn(?2, Int) -> ?3, ?2) -> ?4
  --> /tmp/dojo-word-count-3.almd:6:15
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map
  --> /tmp/dojo-word-count-3.almd:6:15
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
6 |       none => Map.set(m, x, 1)
  |               ^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
