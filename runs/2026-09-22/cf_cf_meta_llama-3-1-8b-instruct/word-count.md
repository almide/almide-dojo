# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
    let words = string.split(s, " ").filter(|x| !x.is_empty());
    let mut map = map.new();
    list.fold(words, map, |map, word| {
        map.set(word, map.get_or(word, 0) + 1);
        map
    })
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:46
  --> /tmp/dojo-word-count-0.almd:1:46
  here: fn word_count(s: String) -> Map[String, Int] {
  hint: Almide requires '=' before the body. Write: fn word_count(...) -> Type = { ... }
  |
1 | fn word_count(s: String) -> Map[String, Int] {
  |                                              ^
error[E018]: cannot infer the element type of empty map `[:]`
  --> /tmp/dojo-word-count-0.almd:10:53
  in empty map `[:]` with no element-type context
  here: test "word_count empty" { assert_eq(word_count(""), [:]) }
  hint: empty map `[:]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with explicit key/value types, e.g. `let m: Map[String, Int] = [:]`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let m: Map[String, Int] = [:]
   |
10 | test "word_count empty" { assert_eq(word_count(""), [:]) }
   |                                                     ^

2 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
Compile error for /tmp/dojo-word-count-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|x| !x.is_empty());
    let mut map: Map[String, Int] = map.new();
    list.fold(words, map, |map, word| {
        map.set(word, map.get_or(word, 0) + 1);
        map
    })
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide at line 2:45
  --> /tmp/dojo-word-count-1.almd:2:45
  here: let words = string.split(s, " ").filter(|x| !x.is_empty());
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = string.split(s, " ").filter(|x| !x.is_empty());
  |                                             ^
error: 'let mut' is not valid in Almide at line 3:9
  --> /tmp/dojo-word-count-1.almd:3:9
  here: let mut map: Map[String, Int] = map.new();
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |     let mut map: Map[String, Int] = map.new();
  |         ^
error: '|x|' closure syntax is not valid in Almide at line 4:27
  --> /tmp/dojo-word-count-1.almd:4:27
  here: list.fold(words, map, |map, word| {
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |     list.fold(words, map, |map, word| {
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:7:6
  here: })
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |     })
  |      ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:17
  in variable word
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Check the variable name
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |                 ^^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:34
  in variable word
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Check the variable name
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |                                  ^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:40
  in call to map.get_or()
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |                                        ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:45
  in call to map.set()
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |                                             ^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-1.almd:6:9
  in variable map
  here: map
  hint: Check the variable name
  |
6 |         map
  |         ^^^
error[E025]: cannot infer a concrete type for this expression (type ?0)
  --> /tmp/dojo-word-count-1.almd:5:23
  in this expression with an unconstrained type
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |                       ^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Map[?0, ?1])
  --> /tmp/dojo-word-count-1.almd:5:9
  in this expression with an unconstrained type
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Map[Int, Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

11 error(s) found
FAILED: /tmp/dojo-word-count-1.almd
Compile error for /tmp/dojo-word-count-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|x| !x.is_empty());
    let map: Map[String, Int] = map.new();
    list.fold(words, map, (map, word) => {
        map.set(word, map.get_or(word, 0) + 1);
        map
    })
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide at line 2:45
  --> /tmp/dojo-word-count-2.almd:2:45
  here: let words = string.split(s, " ").filter(|x| !x.is_empty());
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = string.split(s, " ").filter(|x| !x.is_empty());
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:15
  in variable words
  here: list.fold(words, map, (map, word) => {
  hint: Check the variable name
  |
4 |     list.fold(words, map, (map, word) => {
  |               ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:40
  in call to map.get_or()
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |                                        ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:45
  in call to map.set()
  here: map.set(word, map.get_or(word, 0) + 1);
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |         map.set(word, map.get_or(word, 0) + 1);
  |                                             ^

4 error(s) found
FAILED: /tmp/dojo-word-count-2.almd
Compile error for /tmp/dojo-word-count-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => !x.is_empty());
    let map: Map[String, Int] = map.new();
    list.fold(words, map, (map, word) => {
        map.set(map, word, map.get_or(map, word, 0) + 1);
        map
    })
}
```

**Diagnostic:**

```
error: '!' is not valid in Almide at line 2:52
  --> /tmp/dojo-word-count-3.almd:2:52
  here: let words = string.split(s, " ").filter((x) => !x.is_empty());
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |     let words = string.split(s, " ").filter((x) => !x.is_empty());
  |                                                    ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:15
  in variable words
  here: list.fold(words, map, (map, word) => {
  hint: Check the variable name
  |
4 |     list.fold(words, map, (map, word) => {
  |               ^^^^^

2 error(s) found
FAILED: /tmp/dojo-word-count-3.almd
Compile error for /tmp/dojo-word-count-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
