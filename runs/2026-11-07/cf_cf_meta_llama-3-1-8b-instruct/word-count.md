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
  let words = string.split(s, " ") 
  list.fold(words, map.new(), (m, w) => 
    let count = map.get(m, w) ?? 0 
    map.set(m, w, count + 1) 
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:4:5
  in let-in
  here: let count = map.get(m, w) ?? 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get(m, w) ?? 0
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
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
5 |     map.set(m, w, count + 1)
  |             ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-0.almd:5:16
  in variable w
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
5 |     map.set(m, w, count + 1)
  |                ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:5:19
  in variable count
  here: map.set(m, w, count + 1)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
5 |     map.set(m, w, count + 1)
  |                   ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:5:27
  in fn 'word_count'
  here: map.set(m, w, count + 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(m, w, count + 1)
  |                           ^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-0.almd:5:5
  in this expression with an unconstrained type
  here: map.set(m, w, count + 1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     map.set(m, w, count + 1)
  |     ^^^^^^^^^^^^^^^^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 6:3 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") 
  list.filter(words, (w) => string.is_not_empty(w)) 
  list.fold(words, map.new(), (m, w) => 
    let count = map.get(m, w) ?? 0 
    map.set(m, w, count + 1) 
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:5:5
  in let-in
  here: let count = map.get(m, w) ?? 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get(m, w) ?? 0
  |     ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:7:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   )
  |   ^
error[E002]: undefined function 'string.is_not_empty'
  --> /tmp/dojo-word-count-1.almd:3:29
  in call to string.is_not_empty()
  here: list.filter(words, (w) => string.is_not_empty(w))
  hint: Did you mean `string.is_empty`?
  try:
      string.is_empty
  |
3 |   list.filter(words, (w) => string.is_not_empty(w))
  |                             ^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:6:13
  in variable m
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
6 |     map.set(m, w, count + 1)
  |             ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-1.almd:6:16
  in variable w
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
6 |     map.set(m, w, count + 1)
  |                ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:6:19
  in variable count
  here: map.set(m, w, count + 1)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
6 |     map.set(m, w, count + 1)
  |                   ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:6:27
  in fn 'word_count'
  here: map.set(m, w, count + 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     map.set(m, w, count + 1)
  |                           ^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-1.almd:6:5
  in this expression with an unconstrained type
  here: map.set(m, w, count + 1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |     map.set(m, w, count + 1)
  |     ^^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 7:3 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") 
  list.filter(words, (w) => string.is_not_empty(w)) 
  list.fold(words, map.new(), (m, w) => 
    let count = map.get(m, w) ?? 0 
    map.set(m, w, count + 1) 
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:5:5
  in let-in
  here: let count = map.get(m, w) ?? 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get(m, w) ?? 0
  |     ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:7:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   )
  |   ^
error[E002]: undefined function 'string.is_not_empty'
  --> /tmp/dojo-word-count-2.almd:3:29
  in call to string.is_not_empty()
  here: list.filter(words, (w) => string.is_not_empty(w))
  hint: Did you mean `string.is_empty`?
  try:
      string.is_empty
  |
3 |   list.filter(words, (w) => string.is_not_empty(w))
  |                             ^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:6:13
  in variable m
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
6 |     map.set(m, w, count + 1)
  |             ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-2.almd:6:16
  in variable w
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
6 |     map.set(m, w, count + 1)
  |                ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:6:19
  in variable count
  here: map.set(m, w, count + 1)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
6 |     map.set(m, w, count + 1)
  |                   ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:6:27
  in fn 'word_count'
  here: map.set(m, w, count + 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     map.set(m, w, count + 1)
  |                           ^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-2.almd:6:5
  in this expression with an unconstrained type
  here: map.set(m, w, count + 1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |     map.set(m, w, count + 1)
  |     ^^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-2.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 7:3 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") 
  list.filter(words, (w) => string.is_not_empty(w)) 
  list.fold(words, map.new(), (m, w) => 
    let count = map.get(m, w) ?? 0 
    map.set(m, w, count + 1) 
  )
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:5:5
  in let-in
  here: let count = map.get(m, w) ?? 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get(m, w) ?? 0
  |     ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:7:3
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   )
  |   ^
error[E002]: undefined function 'string.is_not_empty'
  --> /tmp/dojo-word-count-3.almd:3:29
  in call to string.is_not_empty()
  here: list.filter(words, (w) => string.is_not_empty(w))
  hint: Did you mean `string.is_empty`?
  try:
      string.is_empty
  |
3 |   list.filter(words, (w) => string.is_not_empty(w))
  |                             ^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:6:13
  in variable m
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
6 |     map.set(m, w, count + 1)
  |             ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-3.almd:6:16
  in variable w
  here: map.set(m, w, count + 1)
  hint: Did you mean `s`?
  try:
      s
  |
6 |     map.set(m, w, count + 1)
  |                ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:6:19
  in variable count
  here: map.set(m, w, count + 1)
  hint: Did you mean `map.count`?
  try:
      map.count
  |
6 |     map.set(m, w, count + 1)
  |                   ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:6:27
  in fn 'word_count'
  here: map.set(m, w, count + 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     map.set(m, w, count + 1)
  |                           ^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-3.almd:6:5
  in this expression with an unconstrained type
  here: map.set(m, w, count + 1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
6 |     map.set(m, w, count + 1)
  |     ^^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-3.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 7:3 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
