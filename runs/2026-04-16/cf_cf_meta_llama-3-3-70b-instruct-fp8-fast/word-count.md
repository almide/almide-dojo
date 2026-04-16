# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
      |> list.filter((x) => x != "")
      |> list.map(string.to_lower)
  in list.fold(words, map.new(), (acc, word) =>
    map.set(acc, word, map.get_or(acc, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-word-count-0.almd:5:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
5 |   in list.fold(words, map.new(), (acc, word) =>
  |   ^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:4:25
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let words = ...` (a statement, returns Unit).
      // Add `words` as the trailing expression so the fn returns Map[String, Int]:
      //
      //   let words = <computation>
      //   words                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
4 |       |> list.map(string.to_lower)
  |                         ^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ") 
      |> list.filter((x) => x != "")
  in list.fold(words, map.new(), (acc, word) =>
    map.set(acc, word, map.get_or(acc, word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-word-count-1.almd:4:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
4 |   in list.fold(words, map.new(), (acc, word) =>
  |   ^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:3:34
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let words = ...` (a statement, returns Unit).
      // Add `words` as the trailing expression so the fn returns Map[String, Int]:
      //
      //   let words = <computation>
      //   words                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
3 |       |> list.filter((x) => x != "")
  |                                  ^^

2 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ") 
      |> list.filter((x) => x != "")
  let result = list.fold(words, map.new(), (acc, word) =>
    map.set(acc, word, map.get_or(acc, word, 0) + 1))
  in result
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-word-count-2.almd:6:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
6 |   in result
  |   ^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:5:51
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let result = ...` (a statement, returns Unit).
      // Add `result` as the trailing expression so the fn returns Map[String, Int]:
      //
      //   let result = <computation>
      //   result                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
5 |     map.set(acc, word, map.get_or(acc, word, 0) + 1))
  |                                                   ^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ") 
      |> list.filter((x) => x != "")
  let result = list.fold(words, map.new(), (acc, word) =>
    map.set(acc, word, map.get_or(acc, word, 0) + 1))
  result
```
