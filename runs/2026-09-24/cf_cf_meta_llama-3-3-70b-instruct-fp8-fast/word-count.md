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
    words = string.split(s, " ")
    non_empty_words = list.filter(words, (x) => x != "")
    freq_map = list.fold(
      non_empty_words,
      map.new(),
      (acc, word) =>
        map.set(
          acc,
          word,
          map.get_or(acc, word, 0) + 1
        )
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
error: Expected expression at line 15:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:15:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   in
   |   ^
error[E003]: cannot assign to undefined binding 'words'
  --> /tmp/dojo-word-count-0.almd:3:29
  in words = ...
  here: words = string.split(s, " ")
  hint: No `let`/`var` named 'words' is in scope to assign to. Declare it first: `var words = ...`
  |
3 |     words = string.split(s, " ")
  |                             ^^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:35
  in variable words
  here: non_empty_words = list.filter(words, (x) => x != "")
  hint: Check the variable name
  |
4 |     non_empty_words = list.filter(words, (x) => x != "")
  |                                   ^^^^^
error[E003]: cannot assign to undefined binding 'non_empty_words'
  --> /tmp/dojo-word-count-0.almd:4:54
  in non_empty_words = ...
  here: non_empty_words = list.filter(words, (x) => x != "")
  hint: No `let`/`var` named 'non_empty_words' is in scope to assign to. Declare it first: `var non_empty_words = ...`
  |
4 |     non_empty_words = list.filter(words, (x) => x != "")
  |                                                      ^^
error[E003]: undefined variable 'non_empty_words'
  --> /tmp/dojo-word-count-0.almd:6:7
  in variable non_empty_words
  here: non_empty_words,
  hint: Check the variable name
  |
6 |       non_empty_words,
  |       ^^^^^^^^^^^^^^^
error[E003]: cannot assign to undefined binding 'freq_map'
  --> /tmp/dojo-word-count-0.almd:12:38
  in freq_map = ...
  here: map.get_or(acc, word, 0) + 1
  hint: No `let`/`var` named 'freq_map' is in scope to assign to. Declare it first: `var freq_map = ...`
   |
12 |           map.get_or(acc, word, 0) + 1
   |                                      ^
error[E003]: undefined variable 'freq_map'
  --> /tmp/dojo-word-count-0.almd:16:5
  in variable freq_map
  here: freq_map
  hint: Check the variable name
   |
16 |     freq_map
   |     ^^^^^^^^
error[E018]: cannot infer the element type of empty map `[:]`
  --> /tmp/dojo-word-count-0.almd:7:7
  in empty map `[:]` with no element-type context
  here: map.new(),
  hint: empty map `[:]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with explicit key/value types, e.g. `let m: Map[String, Int] = [:]`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let m: Map[String, Int] = [:]
  |
7 |       map.new(),
  |       ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[?2, Int])
  --> /tmp/dojo-word-count-0.almd:7:7
  in this expression with an unconstrained type
  here: map.new(),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
7 |       map.new(),
  |       ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[?2, Int])
  --> /tmp/dojo-word-count-0.almd:9:16
  in this expression with an unconstrained type
  here: map.set(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
9 |         map.set(
  |                ^
error[E025]: cannot infer a concrete type for this expression (type Map[?2, Int])
  --> /tmp/dojo-word-count-0.almd:5:25
  in this expression with an unconstrained type
  here: freq_map = list.fold(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     freq_map = list.fold(
  |                         ^

12 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
Compile error for /tmp/dojo-word-count-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let non_empty_words = list.filter(words, (x) => x != "")
  let freq_map = list.fold(
    non_empty_words,
    map.new(),
    (acc, word) =>
      map.set(
        acc,
        word,
        map.get_or(acc, word, 0) + 1
      )
  )
  in freq_map
```
