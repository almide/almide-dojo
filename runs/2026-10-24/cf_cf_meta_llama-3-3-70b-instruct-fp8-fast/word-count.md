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
    non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
    initial_map = map.new()
  in
  list.fold(non_empty_words, initial_map, (acc, word) =>
    map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
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
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:6:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |   in
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
  here: non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
  hint: Check the variable name
  |
4 |     non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
  |                                   ^^^^^
error[E003]: cannot assign to undefined binding 'non_empty_words'
  --> /tmp/dojo-word-count-0.almd:4:69
  in non_empty_words = ...
  here: non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
  hint: No `let`/`var` named 'non_empty_words' is in scope to assign to. Declare it first: `var non_empty_words = ...`
  |
4 |     non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
  |                                                                     ^
error[E003]: cannot assign to undefined binding 'initial_map'
  --> /tmp/dojo-word-count-0.almd:5:19
  in initial_map = ...
  here: initial_map = map.new()
  hint: No `let`/`var` named 'initial_map' is in scope to assign to. Declare it first: `var initial_map = ...`
  |
5 |     initial_map = map.new()
  |                   ^^^^^^^^^
error[E003]: undefined variable 'non_empty_words'
  --> /tmp/dojo-word-count-0.almd:7:13
  in variable non_empty_words
  here: list.fold(non_empty_words, initial_map, (acc, word) =>
  hint: Check the variable name
  |
7 |   list.fold(non_empty_words, initial_map, (acc, word) =>
  |             ^^^^^^^^^^^^^^^
error[E003]: undefined variable 'initial_map'
  --> /tmp/dojo-word-count-0.almd:7:30
  in variable initial_map
  here: list.fold(non_empty_words, initial_map, (acc, word) =>
  hint: Check the variable name
  |
7 |   list.fold(non_empty_words, initial_map, (acc, word) =>
  |                              ^^^^^^^^^^^
error[E018]: cannot infer the element type of empty map `[:]`
  --> /tmp/dojo-word-count-0.almd:5:19
  in empty map `[:]` with no element-type context
  here: initial_map = map.new()
  hint: empty map `[:]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with explicit key/value types, e.g. `let m: Map[String, Int] = [:]`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let m: Map[String, Int] = [:]
  |
5 |     initial_map = map.new()
  |                   ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[?3, ?4])
  --> /tmp/dojo-word-count-0.almd:5:19
  in this expression with an unconstrained type
  here: initial_map = map.new()
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |     initial_map = map.new()
  |                   ^^^^^^^^^

10 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
Compile error for /tmp/dojo-word-count-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let non_empty_words = list.filter(words, (x) => not(string.is_empty(x)))
  let initial_map: Map[String, Int] = map.new()
  in
  list.fold(non_empty_words, initial_map, (acc, word) =>
    map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
```
