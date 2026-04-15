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
    (c) => if string.is_lower(c) then {
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
    (c) => if string.is_lower(c) then {
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
    (c) => if string.is_lower(c) then {
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
    (c) => if string.is_lower(c) then {
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

13 error(s) found
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
    (c) => match string.codepoint(c) {
      Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
      _ => c
    }
  ).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => match string.codepoint(c) {
      Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
      _ => c
    }
  ).join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 5:45
  --> /tmp/dojo-caesar-cipher-2.almd:5:45
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
  |                                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:8:9
  |
8 |       } else {
  |         ^
error: '&&' is not valid in Almide at line 21:45
  --> /tmp/dojo-caesar-cipher-2.almd:21:45
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
21 |       Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
   |                                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:24:9
   |
24 |       } else {
   |         ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-2.almd:6:34
  in variable codepoint
  hint: Check the variable name
  |
6 |         let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                  ^^^^^^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-2.almd:22:34
  in variable codepoint
  hint: Check the variable name
   |
22 |         let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                  ^^^^^^^^^

6 error(s) found
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
    (c) => match string.codepoint(c) {
      Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
        let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  ).join("");
  result
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text);
  let result = chars.map(
    (c) => match string.codepoint(c) {
      Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
        let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted_codepoint)
      } else {
        c
      }
    }
  ).join("");
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: '&&' is not valid in Almide at line 5:45
  --> /tmp/dojo-caesar-cipher-3.almd:5:45
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
  |                                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:8:9
  |
8 |       } else {
  |         ^
error: '&&' is not valid in Almide at line 20:45
  --> /tmp/dojo-caesar-cipher-3.almd:20:45
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |       Some(codepoint) => if 97 <= codepoint && codepoint <= 122 then {
   |                                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:23:9
   |
23 |       } else {
   |         ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:6:34
  in variable codepoint
  hint: Check the variable name
  |
6 |         let shifted_codepoint = (codepoint - 97 + shift) % 26 + 97;
  |                                  ^^^^^^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:21:34
  in variable codepoint
  hint: Check the variable name
   |
21 |         let shifted_codepoint = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                  ^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
