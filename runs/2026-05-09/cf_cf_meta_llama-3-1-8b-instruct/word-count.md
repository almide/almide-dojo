# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let 
    words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    init = map.new[String, Int]()
  in 
    list.fold(words, init, (m, word) => 
      let 
        count = map.get_or(m, word, 0) + 1
      in 
        map.set(m, word, count)
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-word-count-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 3:49 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:3:49
  |
3 |     words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                 ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:5:3
  |
5 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let
  |       ^^^
error: Expected expression at line 9:7 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:9:7
  |
9 |       in
  |       ^
error: Expected expression at line 11:5 (got RParen ')')
  --> /tmp/dojo-word-count-0.almd:11:5
   |
11 |     )
   |     ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-0.almd:8:28
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
8 |         count = map.get_or(m, word, 0) + 1
  |                            ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:8:31
  in variable word
  hint: Check the variable name
  |
8 |         count = map.get_or(m, word, 0) + 1
  |                               ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-0.almd:10:17
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
   |
10 |         map.set(m, word, count)
   |                 ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:10:20
  in variable word
  hint: Check the variable name
   |
10 |         map.set(m, word, count)
   |                    ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:10:26
  in variable count
  hint: Check the variable name
   |
10 |         map.set(m, word, count)
   |                          ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:10:26
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
   |
10 |         map.set(m, word, count)
   |                          ^^^^^

12 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let 
    words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    init = map.new[String, Int]()
  in 
    let 
      fold_result = list.fold(words, init, (m, word) => 
        let 
          count = map.get_or(m, word, 0) + 1
        in 
          map.set(m, word, count)
      )
    in 
      fold_result
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-word-count-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 3:49 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:3:49
  |
3 |     words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                 ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-word-count-1.almd:5:3
  |
5 |   in
  |   ^
error: Expected identifier at line 6:9 (got Newline '')
  --> /tmp/dojo-word-count-1.almd:6:9
  |
6 |     let
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let
  |         ^^^
error: Expected expression at line 10:9 (got In 'in')
  --> /tmp/dojo-word-count-1.almd:10:9
   |
10 |         in
   |         ^
error: Expected expression at line 12:7 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:12:7
   |
12 |       )
   |       ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:9:30
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
9 |           count = map.get_or(m, word, 0) + 1
  |                              ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:9:33
  in variable word
  hint: Check the variable name
  |
9 |           count = map.get_or(m, word, 0) + 1
  |                                 ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:11:19
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
   |
11 |           map.set(m, word, count)
   |                   ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:11:22
  in variable word
  hint: Check the variable name
   |
11 |           map.set(m, word, count)
   |                      ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:11:28
  in variable count
  hint: Check the variable name
   |
11 |           map.set(m, word, count)
   |                            ^^^^^
error[E003]: undefined variable 'fold_result'
  --> /tmp/dojo-word-count-1.almd:14:7
  in variable fold_result
  hint: Check the variable name
   |
14 |       fold_result
   |       ^^^^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let 
    words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    init = map.new[String, Int]()
  in 
    list.fold(words, init, (map, word) => 
      let 
        count = map.get_or(word, 0) + 1
      in 
        map.set(word, count)
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-word-count-2.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 3:49 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:3:49
  |
3 |     words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                 ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-word-count-2.almd:5:3
  |
5 |   in
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let
  |       ^^^
error: Expected expression at line 9:7 (got In 'in')
  --> /tmp/dojo-word-count-2.almd:9:7
  |
9 |       in
  |       ^
error: Expected expression at line 11:5 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:11:5
   |
11 |     )
   |     ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:8:28
  in variable word
  hint: Check the variable name
  |
8 |         count = map.get_or(word, 0) + 1
  |                            ^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:8:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
8 |         count = map.get_or(word, 0) + 1
  |                                  ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:10:17
  in variable word
  hint: Check the variable name
   |
10 |         map.set(word, count)
   |                 ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:10:23
  in variable count
  hint: Check the variable name
   |
10 |         map.set(word, count)
   |                       ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:10:23
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
   |
10 |         map.set(word, count)
   |                       ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:10:23
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
   |
10 |         map.set(word, count)
   |                       ^^^^^

12 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let 
    words = string.split(s, " ") |> list.filter(fn(x) => x != "")
    init = map.new[String, Int]()
  in 
    list.fold(words, init, fn(map, word) => 
      let 
        count = map.get_or(word, 0) + 1
      in 
        map.set(word, count)
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-word-count-3.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 3:49 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:3:49
  |
3 |     words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                 ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-word-count-3.almd:5:3
  |
5 |   in
  |   ^
error: Expected expression at line 6:28 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:6:28
  |
6 |     list.fold(words, init, fn(map, word) =>
  |                            ^
error: Expected identifier at line 7:11 (got Newline '')
  --> /tmp/dojo-word-count-3.almd:7:11
  |
7 |       let
  |           ^
error: Expected expression at line 9:7 (got In 'in')
  --> /tmp/dojo-word-count-3.almd:9:7
  |
9 |       in
  |       ^
error: Expected expression at line 11:5 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:11:5
   |
11 |     )
   |     ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:8:28
  in variable word
  hint: Check the variable name
  |
8 |         count = map.get_or(word, 0) + 1
  |                            ^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:8:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
8 |         count = map.get_or(word, 0) + 1
  |                                  ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:10:17
  in variable word
  hint: Check the variable name
   |
10 |         map.set(word, count)
   |                 ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:10:23
  in variable count
  hint: Check the variable name
   |
10 |         map.set(word, count)
   |                       ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:10:23
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
   |
10 |         map.set(word, count)
   |                       ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:10:23
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
   |
10 |         map.set(word, count)
   |                       ^^^^^

13 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
