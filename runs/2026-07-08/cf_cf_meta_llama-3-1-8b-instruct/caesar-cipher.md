# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let codepoints = string.chars(text).map(string.codepoint);
    let shifted = codepoints.map(|cp| {
        if cp >= 97 && cp <= 122 {
            (cp - 97 + shift) % 26 + 97
        } else {
            cp
        }
    });
    string.from_codepoints(shifted)
}

fn decrypt(text: String, shift: Int) -> String {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Missing '=' before function body at line 1:48
  --> /tmp/dojo-caesar-cipher-0.almd:1:48
  hint: Almide requires '=' before the body. Write: fn encrypt(...) -> Type = { ... }
  |
1 | fn encrypt(text: String, shift: Int) -> String {
  |                                                ^
error: Missing '=' before function body at line 13:48
  --> /tmp/dojo-caesar-cipher-0.almd:13:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
13 | fn decrypt(text: String, shift: Int) -> String {
   |                                                ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let codepoints = string.chars(text).map(string.codepoint);
    let shifted = codepoints.map(|cp| {
        if cp >= 97 && cp <= 122 {
            (cp - 97 + shift) % 26 + 97
        } else {
            cp
        }
    });
    string.from_codepoints(shifted)
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '|x|' closure syntax is not valid in Almide at line 3:34
  --> /tmp/dojo-caesar-cipher-1.almd:3:34
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     let shifted = codepoints.map(|cp| {
  |                                  ^
error: '&&' is not valid in Almide at line 4:21
  --> /tmp/dojo-caesar-cipher-1.almd:4:21
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |         if cp >= 97 && cp <= 122 {
  |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:6:11
  |
6 |         } else {
  |           ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:2:35
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |     let codepoints = string.chars(text).map(string.codepoint);
  |                                   ^^^^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let codepoints = string.chars(text).map(string.codepoint);
    let shifted = codepoints.map((cp) => {
        if cp >= 97 and cp <= 122 then
            (cp - 97 + shift) % 26 + 97
        else
            cp
    });
    string.from_codepoints(shifted)
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error[E005]: argument 'f' expects fn(Option[Int]) -> B but got fn(Int) -> Int
  --> /tmp/dojo-caesar-cipher-2.almd:3:19
  in call to list.map()
  hint: Fix the argument type
  |
3 |     let shifted = codepoints.map((cp) => {
  |                   ^^^^^^^^^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-2.almd:9:28
  in call to string.from_codepoints()
  hint: Did you mean `string.from_codepoint`?
  try:
      // string.from_codepoints(...)  →  string.from_codepoint(...)
      string.from_codepoint(...)
  |
9 |     string.from_codepoints(shifted)
  |                            ^^^^^^^
error[E001]: type mismatch in call to list.map(): expected fn(Option[Int]) -> B but got fn(Int) -> Int
  --> /tmp/dojo-caesar-cipher-2.almd:3:19
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     let shifted = codepoints.map((cp) => {
  |                   ^^^^^^^^^^

3 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let codepoints = string.chars(text).map(string.codepoint);
    let shifted = codepoints.map((cp) => {
        if cp >= 97 and cp <= 122 then
            ((cp - 97 + shift) % 26 + 97).to_int()
        else
            cp
    });
    string.from_codepoints(shifted)
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error[E002]: undefined method 'to_int' on int
  --> /tmp/dojo-caesar-cipher-3.almd:5:39
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `to_int` on `int`. Run `almide explain E002` for examples.
  |
5 |             ((cp - 97 + shift) % 26 + 97).to_int()
  |                                       ^^
error[E002]: undefined function 'string.from_codepoints'
  --> /tmp/dojo-caesar-cipher-3.almd:9:28
  in call to string.from_codepoints()
  hint: Did you mean `string.from_codepoint`?
  try:
      // string.from_codepoints(...)  →  string.from_codepoint(...)
      string.from_codepoint(...)
  |
9 |     string.from_codepoints(shifted)
  |                            ^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
