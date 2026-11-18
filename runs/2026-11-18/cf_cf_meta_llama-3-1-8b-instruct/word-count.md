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
    let words = string.split(s, " ").filter(|w| !w.is_empty());
    let mut m = map.new();
    list.fold(words, m, |m, w| {
        let count = map.get(m, w) ?? 0;
        map.set(m, w, count + 1);
        m
    });
    m
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
  --> /tmp/dojo-word-count-0.almd:12:53
  in empty map `[:]` with no element-type context
  here: test "word_count empty" { assert_eq(word_count(""), [:]) }
  hint: empty map `[:]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with explicit key/value types, e.g. `let m: Map[String, Int] = [:]`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let m: Map[String, Int] = [:]
   |
12 | test "word_count empty" { assert_eq(word_count(""), [:]) }
   |                                                     ^

2 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
  parse error: Missing '=' before function body at line 1:46
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|w| !w.is_empty());
    let mut m: Map[String, Int] = [:];
    list.fold(words, m, |m, w| {
        let count = map.get(m, w) ?? 0;
        map.set(m, w, count + 1);
        m
    });
    m
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-word-count-1.almd:2:45
  in lambda
  here: let words = string.split(s, " ").filter(|w| !w.is_empty());
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |     let words = string.split(s, " ").filter(|w| !w.is_empty());
  |                                             ^
error: '!' is not valid in Almide
  --> /tmp/dojo-word-count-1.almd:2:49
  in operator
  here: let words = string.split(s, " ").filter(|w| !w.is_empty());
  hint: Use 'not' for boolean negation. Write: not x
  try:
      a not b
  |
2 |     let words = string.split(s, " ").filter(|w| !w.is_empty());
  |                                                 ^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-word-count-1.almd:3:9
  in let mut
  here: let mut m: Map[String, Int] = [:];
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
3 |     let mut m: Map[String, Int] = [:];
  |         ^^^
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-word-count-1.almd:4:25
  in lambda
  here: list.fold(words, m, |m, w| {
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
4 |     list.fold(words, m, |m, w| {
  |                         ^
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?4) -> Bool
  --> /tmp/dojo-word-count-1.almd:2:33
  in call to list.filter()
  here: let words = string.split(s, " ").filter(|w| !w.is_empty());
  hint: Fix the argument type
  |
2 |     let words = string.split(s, " ").filter(|w| !w.is_empty());
  |                                 ^^^
error[E025]: cannot infer a concrete type for this expression (type ?4)
  --> /tmp/dojo-word-count-1.almd:2:50
  in this expression with an unconstrained type
  here: let words = string.split(s, " ").filter(|w| !w.is_empty());
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let words = string.split(s, " ").filter(|w| !w.is_empty());
  |                                                  ^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-word-count-1.almd
  parse error: '|x|' closure syntax is not valid in Almide
  parse error: '!' is not valid in Almide
  parse error: 'let mut' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|w| not w.is_empty());
    var m: Map[String, Int] = map.new();
    list.fold(words, m, (m, w) => {
        let count = map.get(m, w) ?? 0;
        map.set(m, w, count + 1);
        m
    });
    m
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-word-count-2.almd:2:45
  in lambda
  here: let words = string.split(s, " ").filter(|w| not w.is_empty());
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |     let words = string.split(s, " ").filter(|w| not w.is_empty());
  |                                             ^
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?4) -> Bool
  --> /tmp/dojo-word-count-2.almd:2:33
  in call to list.filter()
  here: let words = string.split(s, " ").filter(|w| not w.is_empty());
  hint: Fix the argument type
  |
2 |     let words = string.split(s, " ").filter(|w| not w.is_empty());
  |                                 ^^^
error[E025]: cannot infer a concrete type for this expression (type ?4)
  --> /tmp/dojo-word-count-2.almd:2:53
  in this expression with an unconstrained type
  here: let words = string.split(s, " ").filter(|w| not w.is_empty());
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let words = string.split(s, " ").filter(|w| not w.is_empty());
  |                                                     ^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-word-count-2.almd
  parse error: '|x|' closure syntax is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|w| not w.is_empty());
    var m: Map[String, Int] = map.new();
    list.fold(words, m, (m, w) => {
        let count = map.get(m, w) ?? 0;
        map.set(m, w, count + 1);
        m
    });
    m
}
```

**Diagnostic:**

```
error: '|x|' closure syntax is not valid in Almide
  --> /tmp/dojo-word-count-3.almd:2:45
  in lambda
  here: let words = string.split(s, " ").filter(|w| not w.is_empty());
  hint: Write a lambda as `(x) => expr`: list.map(xs, (x) => x + 1).
  try:
      (x) => x + 1
  |
2 |     let words = string.split(s, " ").filter(|w| not w.is_empty());
  |                                             ^
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?4) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.filter()
  here: let words = string.split(s, " ").filter(|w| not w.is_empty());
  hint: Fix the argument type
  |
2 |     let words = string.split(s, " ").filter(|w| not w.is_empty());
  |                                 ^^^
error[E025]: cannot infer a concrete type for this expression (type ?4)
  --> /tmp/dojo-word-count-3.almd:2:53
  in this expression with an unconstrained type
  here: let words = string.split(s, " ").filter(|w| not w.is_empty());
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Int = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |     let words = string.split(s, " ").filter(|w| not w.is_empty());
  |                                                     ^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-word-count-3.almd
  parse error: '|x|' closure syntax is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-word-count-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
