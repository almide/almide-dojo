# bounded-total

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  let sum = fn (xs: List[Int]) -> Int =
    let rec (xs: List[Int], acc: Int) -> Int =
      match xs {
        [] => acc
        x :: xs => rec (xs, acc + x)
      }
    rec (xs, 0)
  in
  fan.bounded (compute.ms(100)) { sum (xs) } ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 2:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-0.almd:2:13
  here: let sum = fn (xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let sum = fn (xs: List[Int]) -> Int =
  |             ^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-bounded-total-0.almd:3:9
  in let rec
  here: let rec (xs: List[Int], acc: Int) -> Int =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
3 |     let rec (xs: List[Int], acc: Int) -> Int =
  |         ^^^
error: Expected FatArrow at line 6:11 (got Colon ':')
  --> /tmp/dojo-bounded-total-0.almd:6:11
  here: x :: xs => rec (xs, acc + x)
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
6 |         x :: xs => rec (xs, acc + x)
  |           ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:7 (got RBrace '}')
  --> /tmp/dojo-bounded-total-0.almd:7:7
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |       }
  |       ^

4 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  let sum = fn (xs: List[Int]) -> Int =
    fn rec (xs: List[Int], acc: Int) -> Int =
      match xs {
        [] => acc
        _ => match list.first(xs) {
          some(x) => rec (list.drop(xs, 1), acc + x)
          none => acc
        }
      }
    rec (xs, 0)
  in
  fan.bounded (compute.ms(100)) { sum (xs) } ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 2:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-1.almd:2:13
  here: let sum = fn (xs: List[Int]) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let sum = fn (xs: List[Int]) -> Int =
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:5 (got Ident 'rec')
  --> /tmp/dojo-bounded-total-1.almd:11:5
  here: rec (xs, 0)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     rec (xs, 0)
   |     ^

2 error(s) found
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  let sum = fn (xs: List[Int], acc: Int) -> Int =
    match xs {
      [] => acc
      _ => match list.first(xs) {
        some(x) => sum (list.drop(xs, 1), acc + x)
        none => acc
      }
    }
  in
  fan.bounded (compute.ms(100)) { sum (xs, 0) } ?? -1
```

**Diagnostic:**

```
error: Expected expression at line 2:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-2.almd:2:13
  here: let sum = fn (xs: List[Int], acc: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let sum = fn (xs: List[Int], acc: Int) -> Int =
  |             ^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-bounded-total-2.almd:10:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   in
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-2.almd:4:13
  in variable acc
  here: [] => acc
  hint: Check the variable name
  |
4 |       [] => acc
  |             ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-2.almd:6:43
  in variable acc
  here: some(x) => sum (list.drop(xs, 1), acc + x)
  hint: Check the variable name
  |
6 |         some(x) => sum (list.drop(xs, 1), acc + x)
  |                                           ^^^
error[E002]: undefined function 'sum'
  --> /tmp/dojo-bounded-total-2.almd:6:49
  in call to sum()
  here: some(x) => sum (list.drop(xs, 1), acc + x)
  hint: Check the function name
  |
6 |         some(x) => sum (list.drop(xs, 1), acc + x)
  |                                                 ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-2.almd:7:17
  in variable acc
  here: none => acc
  hint: Check the variable name
  |
7 |         none => acc
  |                 ^^^

6 error(s) found
FAILED: /tmp/dojo-bounded-total-2.almd
Compile error for /tmp/dojo-bounded-total-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int =
  let sum = fn (xs: List[Int], acc: Int) -> Int =
    match xs {
      [] => acc
      _ => match list.first(xs) {
        some(x) => sum (list.drop(xs, 1), acc + x)
        none => acc
      }
    }
  in
  fan.bounded (compute.ms(100)) { sum (xs, 0) } ?? (-1)
```

**Diagnostic:**

```
error: Expected expression at line 2:13 (got Fn 'fn')
  --> /tmp/dojo-bounded-total-3.almd:2:13
  here: let sum = fn (xs: List[Int], acc: Int) -> Int =
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let sum = fn (xs: List[Int], acc: Int) -> Int =
  |             ^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-bounded-total-3.almd:10:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |   in
   |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-3.almd:4:13
  in variable acc
  here: [] => acc
  hint: Check the variable name
  |
4 |       [] => acc
  |             ^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-3.almd:6:43
  in variable acc
  here: some(x) => sum (list.drop(xs, 1), acc + x)
  hint: Check the variable name
  |
6 |         some(x) => sum (list.drop(xs, 1), acc + x)
  |                                           ^^^
error[E002]: undefined function 'sum'
  --> /tmp/dojo-bounded-total-3.almd:6:49
  in call to sum()
  here: some(x) => sum (list.drop(xs, 1), acc + x)
  hint: Check the function name
  |
6 |         some(x) => sum (list.drop(xs, 1), acc + x)
  |                                                 ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-bounded-total-3.almd:7:17
  in variable acc
  here: none => acc
  hint: Check the variable name
  |
7 |         none => acc
  |                 ^^^

6 error(s) found
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
