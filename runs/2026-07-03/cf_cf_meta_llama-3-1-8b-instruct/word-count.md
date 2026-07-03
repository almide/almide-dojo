# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "") 
  let init_map = map.new()
  list.fold(words, init_map, (m, w) => map.get_or(m, w, 0) + 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, init_map, (m, w) => map.get_or(m, w, 0) + 1)
  |             ^^^^^
error[E005]: argument 'f' expects fn(Map[?0, ?1], ?3) -> Map[?0, ?1] but got fn(Map[?3, Int], ?3) -> Int
  --> /tmp/dojo-word-count-0.almd:4:62
  in call to list.fold()
  hint: Fix the argument type
  |
4 |   list.fold(words, init_map, (m, w) => map.get_or(m, w, 0) + 1)
  |                                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], String) -> Int
  --> /tmp/dojo-word-count-0.almd:4:62
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |   list.fold(words, init_map, (m, w) => map.get_or(m, w, 0) + 1)
  |                                                              ^

4 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (m, w) => map.set(m, w, map.get_or(m, w, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, w) => map.set(m, w, map.get_or(m, w, 0) + 1))
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let m = map.new()
  list.fold(words, m, (m, w) => map.set(m, w, map.get_or(m, w, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, m, (m, w) => map.set(m, w, map.get_or(m, w, 0) + 1))
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let m = map.new()
  list.fold(words, m, (m, w) => 
    let new_count = map.get_or(m, w, 0) + 1
    map.set(m, w, new_count))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let new_count = map.get_or(m, w, 0) + 1
  |     ^^^
error: Expected expression at line 6:29 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:6:29
  |
6 |     map.set(m, w, new_count))
  |                             ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-3.almd:6:16
  in variable w
  hint: Did you mean `s`?
  try:
      // w  →  s
      s
  |
6 |     map.set(m, w, new_count))
  |                ^
error[E003]: undefined variable 'new_count'
  --> /tmp/dojo-word-count-3.almd:6:19
  in variable new_count
  hint: Check the variable name
  |
6 |     map.set(m, w, new_count))
  |                   ^^^^^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:6:19
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     map.set(m, w, new_count))
  |                   ^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
