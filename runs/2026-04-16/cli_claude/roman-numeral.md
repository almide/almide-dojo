# roman-numeral

- **model**: `cli:claude`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0308`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String =
  let pairs = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  let result = list.fold(pairs, (n, ""), (acc, pair) =>
    let remaining = acc.0
    let output = acc.1
    let value = pair.0
    let symbol = pair.1
    let count = remaining / value
    let new_remaining = remaining - count * value
    let new_output = output + string.repeat(symbol, count)
    (new_remaining, new_output)
  )
  result.1
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:18:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
18 |     let remaining = acc.0
   |     ^^^
error: Expected expression at line 26:3 (got RParen ')')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:26:3
   |
26 |   )
   |   ^
error[E003]: undefined variable 'acc'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:19:18
  in variable acc
  hint: Check the variable name
   |
19 |     let output = acc.1
   |                  ^^^
error[E003]: undefined variable 'pair'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:20:17
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
   |
20 |     let value = pair.0
   |                 ^^^^
error[E003]: undefined variable 'pair'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:21:18
  in variable pair
  hint: Did you mean `pairs`?
  try:
      // pair  →  pairs
      pairs
   |
21 |     let symbol = pair.1
   |                  ^^^^
error[E003]: undefined variable 'remaining'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:22:17
  in variable remaining
  hint: Check the variable name
   |
22 |     let count = remaining / value
   |                 ^^^^^^^^^
error[E003]: undefined variable 'remaining'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:23:25
  in variable remaining
  hint: Check the variable name
   |
23 |     let new_remaining = remaining - count * value
   |                         ^^^^^^^^^
error[E003]: undefined variable 'result'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:27:3
  in variable result
  hint: Check the variable name
   |
27 |   result.1
   |   ^^^^^^

8 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String =
  let pairs = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  let final = list.fold(pairs, (n, ""), (acc, pair) => {
    let remaining = acc.0
    let output = acc.1
    let v = pair.0
    let symbol = pair.1
    let count = remaining / v
    let new_remaining = remaining - count * v
    let new_output = output + string.repeat(symbol, count)
    (new_remaining, new_output)
  })
  final.1
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-1.almd
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-1.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:344:77
    |
344 |         let new_output: _ = format!("{}{}", output, almide_rt_string_repeat(symbol, count));
    |                                                     ----------------------- ^^^^^^ expected `&str`, found `String`
    |                                                     |
    |                                                     arguments to this function are incorrect
    |
note: function defined here
   --> <generated.rs>:242:8
    |
242 | pub fn almide_rt_string_repeat(s: &str, n: i64) -> String { s.repeat(n as usize) }
    |        ^^^^^^^^^^^^^^^^^^^^^^^ -------
help: consider borrowing here
    |
344 |         let new_output: _ = format!("{}{}", output, almide_rt_string_repeat(&symbol, count));
    |                                                                             +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman_helper(n: Int, pairs: List[(Int, String)], acc: String) -> String =
  match pairs {
    [] => acc,
    [pair, ..rest] => {
      let v = pair.0
      let symbol = pair.1
      let count = n / v
      let new_remaining = n - count * v
      let new_output = acc + string.repeat(symbol, count)
      to_roman_helper(new_remaining, rest, new_output)
    }
  }

fn to_roman(n: Int) -> String =
  let pairs = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  to_roman_helper(n, pairs, "")
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-2.almd
error: Expected pattern at line 4:12 (got DotDot '..')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-2.almd:4:12
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     [pair, ..rest] => {
  |            ^

1 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-2.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String =
  let pairs = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ]
  let result = list.fold(pairs, (n, ""), (acc, pair) => {
    let remaining = acc.0
    let output = acc.1
    let v = pair.0
    let symbol = pair.1
    let count = remaining / v
    let new_remaining = remaining - count * v
    let new_output = output + string.repeat(symbol, count)
    (new_remaining, new_output)
  })
  result.1
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
   --> <generated.rs>:344:77
    |
344 |         let new_output: _ = format!("{}{}", output, almide_rt_string_repeat(symbol, count));
    |                                                     ----------------------- ^^^^^^ expected `&str`, found `String`
    |                                                     |
    |                                                     arguments to this function are incorrect
    |
note: function defined here
   --> <generated.rs>:242:8
    |
242 | pub fn almide_rt_string_repeat(s: &str, n: i64) -> String { s.repeat(n as usize) }
    |        ^^^^^^^^^^^^^^^^^^^^^^^ -------
help: consider borrowing here
    |
344 |         let new_output: _ = format!("{}{}", output, almide_rt_string_repeat(&symbol, count));
    |                                                                             +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
