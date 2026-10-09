# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:4:5
  in let-in
  here: let count = map.get_or(m, word, 0) + 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-0.almd:6:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   )
  |   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-0.almd:5:13
  in variable m
  here: map.set(m, word, count)
  hint: Did you mean `s`?
  try:
      s
  |
5 |     map.set(m, word, count)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:5:16
  in variable word
  here: map.set(m, word, count)
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:5:22
  in variable count
  here: map.set(m, word, count)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:5:22
  in fn 'word_count'
  here: map.set(m, word, count)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-0.almd:5:5
  in this expression with an unconstrained type
  here: map.set(m, word, count)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     map.set(m, word, count)
  |     ^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
Compile error for /tmp/dojo-word-count-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:4:5
  in let-in
  here: let count = map.get_or(m, word, 0) + 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:6:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   )
  |   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:5:13
  in variable m
  here: map.set(m, word, count)
  hint: Did you mean `s`?
  try:
      s
  |
5 |     map.set(m, word, count)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:16
  in variable word
  here: map.set(m, word, count)
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:5:22
  in variable count
  here: map.set(m, word, count)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:5:22
  in fn 'word_count'
  here: map.set(m, word, count)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-1.almd:5:5
  in this expression with an unconstrained type
  here: map.set(m, word, count)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     map.set(m, word, count)
  |     ^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-1.almd
Compile error for /tmp/dojo-word-count-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:4:5
  in let-in
  here: let count = map.get_or(m, word, 0) + 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:6:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   )
  |   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:5:13
  in variable m
  here: map.set(m, word, count)
  hint: Did you mean `s`?
  try:
      s
  |
5 |     map.set(m, word, count)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:16
  in variable word
  here: map.set(m, word, count)
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:5:22
  in variable count
  here: map.set(m, word, count)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:5:22
  in fn 'word_count'
  here: map.set(m, word, count)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-2.almd:5:5
  in this expression with an unconstrained type
  here: map.set(m, word, count)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     map.set(m, word, count)
  |     ^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-2.almd
Compile error for /tmp/dojo-word-count-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not(string.is_empty(x)))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:4:5
  in let-in
  here: let count = map.get_or(m, word, 0) + 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:6:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   )
  |   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:5:13
  in variable m
  here: map.set(m, word, count)
  hint: Did you mean `s`?
  try:
      s
  |
5 |     map.set(m, word, count)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:16
  in variable word
  here: map.set(m, word, count)
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:5:22
  in variable count
  here: map.set(m, word, count)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:5:22
  in fn 'word_count'
  here: map.set(m, word, count)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-3.almd:5:5
  in this expression with an unconstrained type
  here: map.set(m, word, count)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     map.set(m, word, count)
  |     ^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-3.almd
Compile error for /tmp/dojo-word-count-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
