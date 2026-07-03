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
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = (codepoint - 97 - shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted, "")
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
error: Missing '=' before function body at line 16:48
  --> /tmp/dojo-caesar-cipher-0.almd:16:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
16 | fn decrypt(text: String, shift: Int) -> String {
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
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 && codepoint <= 122 {
      let new_codepoint = (codepoint - 97 - shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '&&' is not valid in Almide at line 6:24
  --> /tmp/dojo-caesar-cipher-1.almd:6:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |     if codepoint >= 97 && codepoint <= 122 {
  |                        ^
error: Expected ')' to close function call opened at line 4:28
  --> /tmp/dojo-caesar-cipher-1.almd:9:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
4 |   let encrypted = chars.map((c) => {
  |                            --------------- '(' opened here
...
9 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:12:3
   |
12 |   });
   |   ^
error: '&&' is not valid in Almide at line 21:24
  --> /tmp/dojo-caesar-cipher-1.almd:21:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
21 |     if codepoint >= 97 && codepoint <= 122 {
   |                        ^
error: Expected ')' to close function call opened at line 19:28
  --> /tmp/dojo-caesar-cipher-1.almd:24:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   let decrypted = chars.map((c) => {
   |                            --------------- '(' opened here
...
24 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-1.almd:27:3
   |
27 |   });
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:10:7
  in variable c
  hint: Check the variable name
   |
10 |       c
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:25:7
  in variable c
  hint: Check the variable name
   |
25 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if codepoint >= 97 and codepoint <= 122 then {
      let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map((char) => {
    let codepoint = string.codepoint(char);
    if codepoint >= 97 and codepoint <= 122 then {
      let new_codepoint = (codepoint - 97 - shift) % 26 + 97;
      string.from_codepoint(new_codepoint)
    } else {
      char
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:40
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |       let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:45
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |       let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                             ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:54
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |       let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:59
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |       let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:8:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |       string.from_codepoint(new_codepoint)
  |                             ^^^^^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:22:40
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |       let new_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                        ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:22:45
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |       let new_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                             ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:22:54
  in operator %
  hint: Use numeric types (Int or Float)
   |
22 |       let new_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:22:59
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |       let new_codepoint = (codepoint - 97 - shift) % 26 + 97;
   |                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:23:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
23 |       string.from_codepoint(new_codepoint)
   |                             ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:8:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |       string.from_codepoint(new_codepoint)
  |                             ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:23:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
23 |       string.from_codepoint(new_codepoint)
   |                             ^^^^^^^^^^^^^

12 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift = shift % 26;
  let chars = string.chars(text);
  let encrypted = chars.map((c) => {
    let codepoint = string.codepoint(c);
    if string.is_lower(c) then {
      let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
      string.from_codepoint(new_codepoint)
    } else {
      c
    }
  });
  string.join(encrypted, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift = 26 - shift % 26;
  let chars = string.chars(text);
  let decrypted = chars.map((char) => {
    let codepoint = string.codepoint(char);
    if string.is_lower(char) then {
      let new_codepoint = ((codepoint - 97 - shift) % 26 + 97).to_int();
      string.from_codepoint(new_codepoint)
    } else {
      char
    }
  });
  string.join(decrypted, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:41
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |       let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                         ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:46
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |       let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                              ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:55
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |       let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |       let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                            ^^
error[E002]: undefined method 'to_int' on option
  --> /tmp/dojo-caesar-cipher-3.almd:7:60
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `option.to_list(x)` (or `x |> option.to_list`). Method syntax `x.to_int()` is not supported.
  try:
      // x.to_int()  →  option.to_list(x)
      option.to_list(x)
  |
7 |       let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                            ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:22:41
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |       let new_codepoint = ((codepoint - 97 - shift) % 26 + 97).to_int();
   |                                         ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:22:46
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |       let new_codepoint = ((codepoint - 97 - shift) % 26 + 97).to_int();
   |                                              ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:22:55
  in operator %
  hint: Use numeric types (Int or Float)
   |
22 |       let new_codepoint = ((codepoint - 97 - shift) % 26 + 97).to_int();
   |                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:22:60
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |       let new_codepoint = ((codepoint - 97 - shift) % 26 + 97).to_int();
   |                                                            ^^
error[E002]: undefined method 'to_int' on option
  --> /tmp/dojo-caesar-cipher-3.almd:22:60
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `option.to_list(x)` (or `x |> option.to_list`). Method syntax `x.to_int()` is not supported.
  try:
      // x.to_int()  →  option.to_list(x)
      option.to_list(x)
   |
22 |       let new_codepoint = ((codepoint - 97 - shift) % 26 + 97).to_int();
   |                                                            ^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
