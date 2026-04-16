# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int =
  let
    chars = string.chars(s)
    vowels = list.filter(chars, (x) => list.contains(["a", "e", "i", "o", "u"], x))
  in
    list.len(vowels)
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-count-vowels-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-count-vowels-0.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'chars'
  --> /tmp/dojo-count-vowels-0.almd:4:26
  in variable chars
  hint: Check the variable name
  |
4 |     vowels = list.filter(chars, (x) => list.contains(["a", "e", "i", "o", "u"], x))
  |                          ^^^^^
error[E003]: undefined variable 'vowels'
  --> /tmp/dojo-count-vowels-0.almd:6:14
  in variable vowels
  hint: Check the variable name
  |
6 |     list.len(vowels)
  |              ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  let vowels = list.filter(chars, (x) => list.contains(["a", "e", "i", "o", "u"], x))
  in list.len(vowels)
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-count-vowels-1.almd:4:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
4 |   in list.len(vowels)
  |   ^^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-1.almd:3:83
  in fn 'count_vowels'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let vowels = ...` (a statement, returns Unit).
      // Add `vowels` as the trailing expression so the fn returns Int:
      //
      //   let vowels = <computation>
      //   vowels                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
3 |   let vowels = list.filter(chars, (x) => list.contains(["a", "e", "i", "o", "u"], x))
  |                                                                                   ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int =
  let chars = string.chars(s)
  let vowels = list.filter(chars, (x) => list.contains(["a", "e", "i", "o", "u"], x))
  list.len(vowels)
```
