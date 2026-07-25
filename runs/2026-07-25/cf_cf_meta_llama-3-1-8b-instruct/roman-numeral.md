# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = symbols.fold(
    "",
    (acc, (value, symbol)) => {
      let count = (n / value).min(3);
      let rest = n - count * value;
      acc + (symbol * count) + to_roman(rest)
    }
  );
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }
  |
1 | fn to_roman(n: Int) -> String {
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = symbols.fold(
    "",
    (acc, (value, symbol)) => {
      let count = (n / value).min(3);
      let rest = n - count * value;
      acc + (symbol * count) + to_roman(rest)
    }
  );
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-1.almd:6:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
  |
6 |       let count = (n / value).min(3);
  |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:8:14
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       acc + (symbol * count) + to_roman(rest)
  |              ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = symbols.fold(
    "",
    (acc, (value, symbol)) => {
      let count = (n / value).to_int().max(0);
      let rest = n - count * value;
      acc + (symbol * count) + to_roman(rest)
    }
  );
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E002]: undefined method 'to_int' on int
  --> /tmp/dojo-roman-numeral-2.almd:6:24
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `to_int` on `int`. Run `almide explain E002` for examples.
  |
6 |       let count = (n / value).to_int().max(0);
  |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:8:14
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       acc + (symbol * count) + to_roman(rest)
  |              ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = symbols.fold(
    "",
    (acc, (value, symbol)) => {
      let count = (n / value).to_int().max(0);
      let rest = n - count * value;
      acc + (symbol * count) + to_roman(rest)
    }
  );
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E002]: undefined method 'to_int' on int
  --> /tmp/dojo-roman-numeral-3.almd:6:24
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `to_int` on `int`. Run `almide explain E002` for examples.
  |
6 |       let count = (n / value).to_int().max(0);
  |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:8:14
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
  |
8 |       acc + (symbol * count) + to_roman(rest)
  |              ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
