# max-of-list

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] =
  if list.is_empty(xs) then none
  else
    let head = list.first(xs) |> option.unwrap_or(0)
    some(list.fold(list.drop(xs, 1), head, (acc, x) => if x > acc then x else acc))
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-0.almd:4:5
  in let-in
  here: let head = list.first(xs) |> option.unwrap_or(0)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let head = list.first(xs) |> option.unwrap_or(0)
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-max-of-list-0.almd:4:5
  here: let head = list.first(xs) |> option.unwrap_or(0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let head = list.first(xs) |> option.unwrap_or(0)
  |     ^

2 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] =
  if list.is_empty(xs) then none
  else
    list.fold(
      list.drop(xs, 1),
      list.first(xs) |> option.unwrap_or(0),
      (acc, x) => if x > acc then x else acc
    )
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-1.almd:2:90
  in if branches
  here: else list.fold(list.drop(xs, 1), list.first(xs) ?? 0, (acc, x) => if x > acc then x else acc)
  hint: Both branches of `if/then/else` must have the same type
  |
2 | else list.fold(list.drop(xs, 1), list.first(xs) ?? 0, (acc, x) => if x > acc then x else acc)
  |                                                                                          ^^^

1 error(s) found
FAILED: /tmp/dojo-max-of-list-1.almd
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] =
  list.reduce(xs, (a, b) => if a > b then a else b)
```
