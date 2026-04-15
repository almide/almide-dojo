# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
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
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected Then at line 4:34 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:4:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     (c) => if string.is_lower(c) {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:8:7
  |
8 |     } else {
  |       ^
error: Expected Then at line 18:34 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-1.almd:18:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |     (c) => if string.is_lower(c) {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:22:7
   |
22 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:5:40
  in variable c
  hint: Check the variable name
  |
5 |       let codepoint = string.codepoint(c);
  |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:44
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:49
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                 ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:58
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:63
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                               ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:19:40
  in variable c
  hint: Check the variable name
   |
19 |       let codepoint = string.codepoint(c);
   |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:44
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                            ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:49
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                 ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:57
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                         ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:63
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:68
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                    ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^

19 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected Then at line 4:34 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:4:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     (c) => if string.is_lower(c) {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:8:7
  |
8 |     } else {
  |       ^
error: Expected Then at line 18:34 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:18:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |     (c) => if string.is_lower(c) {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:22:7
   |
22 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:5:40
  in variable c
  hint: Check the variable name
  |
5 |       let codepoint = string.codepoint(c);
  |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:44
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:49
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                 ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:58
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:63
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                                               ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:19:40
  in variable c
  hint: Check the variable name
   |
19 |       let codepoint = string.codepoint(c);
   |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:44
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                            ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:49
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                 ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:57
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                         ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:63
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                               ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:68
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                                    ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^

19 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = ((codepoint - 97 + shift) % 26) + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => if string.is_lower(c) {
      let codepoint = string.codepoint(c);
      let shifted_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
      string.from_codepoint(shifted_codepoint)
    } else {
      c
    }
  ).join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 4:34 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:4:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |     (c) => if string.is_lower(c) {
  |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:8:7
  |
8 |     } else {
  |       ^
error: Expected Then at line 18:34 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:18:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
18 |     (c) => if string.is_lower(c) {
   |                                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:7 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:22:7
   |
22 |     } else {
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:5:40
  in variable c
  hint: Check the variable name
  |
5 |       let codepoint = string.codepoint(c);
  |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:45
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted_codepoint = ((codepoint - 97 + shift) % 26) + 97;
  |                                             ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:50
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted_codepoint = ((codepoint - 97 + shift) % 26) + 97;
  |                                                  ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:59
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |       let shifted_codepoint = ((codepoint - 97 + shift) % 26) + 97;
  |                                                           ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let shifted_codepoint = ((codepoint - 97 + shift) % 26) + 97;
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:19:40
  in variable c
  hint: Check the variable name
   |
19 |       let codepoint = string.codepoint(c);
   |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:45
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
   |                                             ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:50
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
   |                                                  ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:58
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
   |                                                          ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:64
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |       let shifted_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
   |                                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:70
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let shifted_codepoint = ((codepoint - 97 - shift + 26) % 26) + 97;
   |                                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(shifted_codepoint)
  |                             ^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |       string.from_codepoint(shifted_codepoint)
   |                             ^^^^^^^^^^^^^^^^^

19 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
