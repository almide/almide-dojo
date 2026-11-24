# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let
    words = list.filter(string.split(s, " "), (w) => w != "")
    freq_map = list.fold(words, map.new(), (m, w) =>
      map.set(m, w, (map.get(m, w) ?? 0) + 1)
    )
  in
    freq_map
```

**Diagnostic:**

```
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-word-count-0.almd:2:6
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |      ^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:7:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   in
  |   ^
error[E003]: cannot assign to undefined binding 'words'
  --> /tmp/dojo-word-count-0.almd:3:59
  in words = ...
  here: words = list.filter(string.split(s, " "), (w) => w != "")
  hint: No `let`/`var` named 'words' is in scope to assign to. Declare it first: `var words = ...`
  |
3 |     words = list.filter(string.split(s, " "), (w) => w != "")
  |                                                           ^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:26
  in variable words
  here: freq_map = list.fold(words, map.new(), (m, w) =>
  hint: Check the variable name
  |
4 |     freq_map = list.fold(words, map.new(), (m, w) =>
  |                          ^^^^^
error[E003]: cannot assign to undefined binding 'freq_map'
  --> /tmp/dojo-word-count-0.almd:5:44
  in freq_map = ...
  here: map.set(m, w, (map.get(m, w) ?? 0) + 1)
  hint: No `let`/`var` named 'freq_map' is in scope to assign to. Declare it first: `var freq_map = ...`
  |
5 |       map.set(m, w, (map.get(m, w) ?? 0) + 1)
  |                                            ^
error[E003]: undefined variable 'freq_map'
  --> /tmp/dojo-word-count-0.almd:8:5
  in variable freq_map
  here: freq_map
  hint: Check the variable name
  |
8 |     freq_map
  |     ^^^^^^^^
error[E018]: cannot infer the element type of empty map `[:]`
  --> /tmp/dojo-word-count-0.almd:4:33
  in empty map `[:]` with no element-type context
  here: freq_map = list.fold(words, map.new(), (m, w) =>
  hint: empty map `[:]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with explicit key/value types, e.g. `let m: Map[String, Int] = [:]`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let m: Map[String, Int] = [:]
  |
4 |     freq_map = list.fold(words, map.new(), (m, w) =>
  |                                 ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[?2, Int])
  --> /tmp/dojo-word-count-0.almd:4:33
  in this expression with an unconstrained type
  here: freq_map = list.fold(words, map.new(), (m, w) =>
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     freq_map = list.fold(words, map.new(), (m, w) =>
  |                                 ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[?2, Int])
  --> /tmp/dojo-word-count-0.almd:5:7
  in this expression with an unconstrained type
  here: map.set(m, w, (map.get(m, w) ?? 0) + 1)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |       map.set(m, w, (map.get(m, w) ?? 0) + 1)
  |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[?2, Int])
  --> /tmp/dojo-word-count-0.almd:4:25
  in this expression with an unconstrained type
  here: freq_map = list.fold(words, map.new(), (m, w) =>
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
4 |     freq_map = list.fold(words, map.new(), (m, w) =>
  |                         ^

10 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
  parse error: Expected identifier at line 2:6 (got Newline '')
  parse error: Expected expression at line 7:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  list.fold(
    list.filter(string.split(s, " "), (w) => w != ""),
    map.new(),
    (m, w) => map.set(m, w, (map.get(m, w) ?? 0) + 1)
  )
```
