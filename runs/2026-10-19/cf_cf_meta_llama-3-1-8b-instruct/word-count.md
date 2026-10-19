# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
    let words = string.split(s, " ").filter(|x| !x.is_empty());
    let mut freq_map = map.new();
    words.fold((), |_, word| {
        let count = map.get_or(&freq_map, word, 0);
        map.set(&freq_map, word, count + 1);
        ()
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
  --> /tmp/dojo-word-count-0.almd:11:53
  in empty map `[:]` with no element-type context
  here: test "word_count empty" { assert_eq(word_count(""), [:]) }
  hint: empty map `[:]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with explicit key/value types, e.g. `let m: Map[String, Int] = [:]`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let m: Map[String, Int] = [:]
   |
11 | test "word_count empty" { assert_eq(word_count(""), [:]) }
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
    let mut freq_map: Map[String, Int] = map.new();
    words.fold((), |_, word| {
        let count = map.get_or(&freq_map, word, 0);
        map.set(&freq_map, word, count + 1);
        ()
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
  here: let mut freq_map: Map[String, Int] = map.new();
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |     let mut freq_map: Map[String, Int] = map.new();
  |         ^
error: '|x|' closure syntax is not valid in Almide at line 4:20
  --> /tmp/dojo-word-count-1.almd:4:20
  here: words.fold((), |_, word| {
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |     words.fold((), |_, word| {
  |                    ^
error: Unexpected character '&' (U+0026)
  --> /tmp/dojo-word-count-1.almd:5:32
  in unknown-char
  here: let count = map.get_or(&freq_map, word, 0);
  hint: This character is not Almide syntax. Full-width or invisible Unicode characters often sneak in from copy-paste — delete it, or move it into a string or comment.
  |
5 |         let count = map.get_or(&freq_map, word, 0);
  |                                ^
error: Unexpected character '&' (U+0026)
  --> /tmp/dojo-word-count-1.almd:6:17
  in unknown-char
  here: map.set(&freq_map, word, count + 1);
  hint: This character is not Almide syntax. Full-width or invisible Unicode characters often sneak in from copy-paste — delete it, or move it into a string or comment.
  |
6 |         map.set(&freq_map, word, count + 1);
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 8:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:8:6
  here: })
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |     })
  |      ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:1:48
  in fn 'word_count'
  here: fn word_count(s: String) -> Map[String, Int] = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
1 | fn word_count(s: String) -> Map[String, Int] = {
  |                                                ^

7 error(s) found
FAILED: /tmp/dojo-word-count-1.almd
Compile error for /tmp/dojo-word-count-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => !x.is_empty());
    let freq_map: Map[String, Int] = map.new();
    words.fold(freq_map, (map, word) => {
        let count = map.get_or(word, 0);
        map.set(word, count + 1);
        map
    })
}
```

**Diagnostic:**

```
error: '!' is not valid in Almide at line 2:52
  --> /tmp/dojo-word-count-2.almd:2:52
  here: let words = string.split(s, " ").filter((x) => !x.is_empty());
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |     let words = string.split(s, " ").filter((x) => !x.is_empty());
  |                                                    ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:5
  in variable words
  here: words.fold(freq_map, (map, word) => {
  hint: Check the variable name
  |
4 |     words.fold(freq_map, (map, word) => {
  |     ^^^^^

2 error(s) found
FAILED: /tmp/dojo-word-count-2.almd
Compile error for /tmp/dojo-word-count-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => not x.is_empty());
    let freq_map: Map[String, Int] = map.new();
    words.fold(freq_map, (map, word) => {
        let count = map.get_or(word, 0);
        map.set(word, count + 1);
        map
    })
}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?4) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.filter()
  here: let words = string.split(s, " ").filter((x) => not x.is_empty());
  hint: Fix the argument type
...
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty());
  |                                 ^^^
error[E005]: argument 'f' expects fn(Map[String, Int], String) -> Map[String, Int] but got fn(fn(?10, Int) -> Int, ?10) -> fn(?10, Int) -> Int
  --> /tmp/dojo-word-count-3.almd:4:5
  in call to list.fold()
  here: words.fold(freq_map, (map, word) => {
  hint: Fix the argument type
...
4 |     words.fold(freq_map, (map, word) => {
  |     ^^^^^
error[E025]: cannot infer a concrete type for this expression (type ?4)
  --> /tmp/dojo-word-count-3.almd:2:56
  in this expression with an unconstrained type
  here: let words = string.split(s, " ").filter((x) => not x.is_empty());
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty());
  |                                                        ^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-word-count-3.almd
Compile error for /tmp/dojo-word-count-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
