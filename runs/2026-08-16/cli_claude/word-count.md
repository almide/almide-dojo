# word-count

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  string.split(s, " ")
    |> list.filter((w) => !string.is_empty(w))
    |> list.fold(map.new(), (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1))
```

**Diagnostic:**

```
error: '!' is not valid in Almide at line 3:27
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-word-count-0.almd:3:27
  here: |> list.filter((w) => !string.is_empty(w))
  hint: Use 'not' for boolean negation. Write: not x
  |
3 |     |> list.filter((w) => !string.is_empty(w))
  |                           ^
error[E018]: cannot infer the element type of empty map `[:]`
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-word-count-0.almd:6:53
  in empty map `[:]` with no element-type context
  here: test "word_count empty" { assert_eq(word_count(""), [:]) }
  hint: empty map `[:]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with explicit key/value types, e.g. `let m: Map[String, Int] = [:]`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let m: Map[String, Int] = [:]
  |
6 | test "word_count empty" { assert_eq(word_count(""), [:]) }
  |                                                     ^

2 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-word-count-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-word-count-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  string.split(s, " ")
    |> list.filter((w) => not string.is_empty(w))
    |> list.fold(map.new(), (acc, w) => map.set(acc, w, map.get_or(acc, w, 0) + 1))
```
