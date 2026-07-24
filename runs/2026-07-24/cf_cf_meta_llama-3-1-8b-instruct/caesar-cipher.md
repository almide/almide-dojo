# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    string.chars(text)
        .map((c) => {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("")
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
error: Missing '=' before function body at line 15:48
  --> /tmp/dojo-caesar-cipher-0.almd:15:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
15 | fn decrypt(text: String, shift: Int) -> String {
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
    string.chars(text)
        .map((c) => {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:3:9
  |
3 |         .map((c) => {
  |         ^
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-1.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint <= 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:8:15
  |
8 |             } else {
  |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:50
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:64
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                                     ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:39
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |                 string.from_codepoint(new_codepoint)
  |                                       ^^^^^^^^^^^^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.chars(text)
        .map((c) => {
            let codepoint = string.codepoint(c);
            if (codepoint >= 97) and (codepoint <= 122) {
                let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
                string.from_codepoint(new_codepoint)
            } else {
                c
            }
        })
        .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:3:9
  |
3 |         .map((c) => {
  |         ^
error: Expected Then at line 5:57 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:57
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |             if (codepoint >= 97) and (codepoint <= 122) {
  |                                                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:8:15
  |
8 |             } else {
  |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:51
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:56
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                        ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:65
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |                 let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:70
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |                 let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                                      ^^
error[E002]: undefined method 'to_int' on option
  --> /tmp/dojo-caesar-cipher-2.almd:6:70
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `option.to_list(x)` (or `x |> option.to_list`). Method syntax `x.to_int()` is not supported.
  try:
      // x.to_int()  →  option.to_list(x)
      option.to_list(x)
  |
6 |                 let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                                      ^^

9 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    string.chars(text)
        .map((c) => {
            let codepoint = string.codepoint(c);
            if (option.is_some(codepoint)) {
                if (codepoint >= 97) and (codepoint <= 122) {
                    let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
                    string.from_codepoint(new_codepoint)
                } else {
                    c
                }
            } else {
                c
            }
        })
        .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
    encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:9
  |
3 |         .map((c) => {
  |         ^
error: Expected Then at line 5:44 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:44
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |             if (option.is_some(codepoint)) {
  |                                            ^
error: Expected Then at line 6:61 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:6:61
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |                 if (codepoint >= 97) and (codepoint <= 122) {
  |                                                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:19 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:9:19
  |
9 |                 } else {
  |                   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:55
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |                     let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                     let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                            ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:69
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |                     let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:74
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |                     let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                                          ^^
error[E002]: undefined method 'to_int' on option
  --> /tmp/dojo-caesar-cipher-3.almd:7:74
  in method call .to_int()
  hint: Almide doesn't use method-call syntax. Write `option.to_list(x)` (or `x |> option.to_list`). Method syntax `x.to_int()` is not supported.
  try:
      // x.to_int()  →  option.to_list(x)
      option.to_list(x)
  |
7 |                     let new_codepoint = ((codepoint - 97 + shift) % 26 + 97).to_int();
  |                                                                          ^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
