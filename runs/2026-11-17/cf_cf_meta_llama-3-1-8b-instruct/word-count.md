# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") 
  list.fold(words, map.new(), (m, w) => 
    match string.to_codepoint(w) {
      some(c) => 
        let count = map.get(m, w) ?? 0
        map.set(m, w, count + 1),
      none => m
    })
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:6:9
  in let-in
  here: let count = map.get(m, w) ?? 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |         let count = map.get(m, w) ?? 0
  |         ^^^
error: Expected expression at line 7:33 (got Comma ',')
  --> /tmp/dojo-word-count-0.almd:7:33
  here: map.set(m, w, count + 1),
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |         map.set(m, w, count + 1),
  |                                 ^
error: this indented line is not part of `fn word_count`: a body without braces is a single expression
  --> /tmp/dojo-word-count-0.almd:9:5
  in fn body
  here: })
  hint: `fn word_count` ends after its first expression (line 8), so line 9 is read as a new top-level declaration. To run several statements, wrap the body in braces:
  try:
      fn word_count(s: String) -> Map[String, Int] = {
        let words = string.split(s, " ")
        list.fold(words, map.new(), (m, w) =>
          match string.to_codepoint(w) {
            some(c) =>
              let count = map.get(m, w) ?? 0
              map.set(m, w, count + 1),
            none => m
          })
      }
  |
1 | fn word_count(s: String) -> Map[String, Int] =
  | ------------- declared here
...
9 |     })
  |     ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-0.almd:7:17
  in variable m
  here: map.set(m, w, count + 1),
  hint: Did you mean `s`?
  try:
      s
  |
7 |         map.set(m, w, count + 1),
  |                 ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-0.almd:7:20
  in variable w
  here: map.set(m, w, count + 1),
  hint: Did you mean `s`?
  try:
      s
  |
7 |         map.set(m, w, count + 1),
  |                    ^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:7:23
  in variable count
  here: map.set(m, w, count + 1),
  hint: Did you mean `map.count`?
  try:
      map.count
  |
7 |         map.set(m, w, count + 1),
  |                       ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:7:31
  in fn 'word_count'
  here: map.set(m, w, count + 1),
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
7 |         map.set(m, w, count + 1),
  |                               ^
error[E025]: cannot infer a concrete type for this expression (type Map[Unknown, Unknown])
  --> /tmp/dojo-word-count-0.almd:7:9
  in this expression with an unconstrained type
  here: map.set(m, w, count + 1),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
7 |         map.set(m, w, count + 1),
  |         ^^^^^^^^^^^^^^^^^^^^^^^^

8 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 7:33 (got Comma ',')
  parse error: this indented line is not part of `fn word_count`: a body without braces is a single expression
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.filter(words, (w) => string.to_codepoint(w) != none)
  list.fold(words, map.new(), (m, w) => {
    let count = map.get(m, w) ?? 0
    map.set(m, w, count + 1)
  })
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-word-count-1.almd
  test: word_count empty
  at:   /tmp/dojo-word-count-1.almd:10
  hint: item 0 differs
  diff: -expected +found
    - :
    + "": 1

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.filter(words, (w) => string.to_codepoint(w) != none)
  list.fold(words, map.new(), (m, w) => {
    let count = map.get(m, w) ?? 0
    map.set(m, w, count + 1)
  })
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-word-count-2.almd
  test: word_count empty
  at:   /tmp/dojo-word-count-2.almd:10
  hint: item 0 differs
  diff: -expected +found
    - :
    + "": 1

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.filter(words, (w) => string.to_codepoint(w) != none)
  list.fold(words, map.new(), (m, w) => {
    let count = map.get(m, w) ?? 0
    map.set(m, w, count + 1)
  })
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-word-count-3.almd
  test: word_count empty
  at:   /tmp/dojo-word-count-3.almd:10
  hint: item 0 differs
  diff: -expected +found
    - :
    + "": 1

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
