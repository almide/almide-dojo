# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift_mod = shift % 26
  let encrypted_chars = string.chars(text) |> list.map(
    (c) => {
      let codepoint = string.codepoint(c)
      if (codepoint >= 97 && codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift_mod = 26 - (shift % 26)
  let decrypted_chars = string.chars(text) |> list.map(
    (c) => {
      let codepoint = string.codepoint(c)
      if (codepoint >= 97 && codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    }
  )
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 6:27
  --> /tmp/dojo-caesar-cipher-0.almd:6:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |       if (codepoint >= 97 && codepoint <= 122) then {
  |                           ^
error: Expected ')' to close function call opened at line 3:55
  --> /tmp/dojo-caesar-cipher-0.almd:9:9
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let encrypted_chars = string.chars(text) |> list.map(
  |                                                       --------------- '(' opened here
...
9 |       } else {
  |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:12:5
   |
12 |     }
   |     ^
error: '&&' is not valid in Almide at line 22:27
  --> /tmp/dojo-caesar-cipher-0.almd:22:27
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
22 |       if (codepoint >= 97 && codepoint <= 122) then {
   |                           ^
error: Expected ')' to close function call opened at line 19:55
  --> /tmp/dojo-caesar-cipher-0.almd:25:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   let decrypted_chars = string.chars(text) |> list.map(
   |                                                       --------------- '(' opened here
...
25 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 28:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:28:5
   |
28 |     }
   |     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:10:9
  in variable c
  hint: Check the variable name
   |
10 |         c
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:26:9
  in variable c
  hint: Check the variable name
   |
26 |         c
   |         ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift_mod = shift % 26
  let encrypted_chars = string.chars(text) |> list.map(
    (c) => {
      let codepoint = string.codepoint(c)
      if (codepoint >= 97 and codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        string.from_codepoint(new_codepoint)
      } else {
        c
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift_mod = 26 - (shift % 26)
  let decrypted_chars = string.chars(text) |> list.map(
    (char) => {
      let codepoint = string.codepoint(char)
      if (codepoint >= 97 and codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        string.from_codepoint(new_codepoint)
      } else {
        char
      }
    }
  )
  string.join(decrypted_chars, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:42
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:47
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                               ^^^^^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:60
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:8:31
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |         string.from_codepoint(new_codepoint)
  |                               ^^^^^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:42
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                               ^^^^^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:60
  in operator %
  hint: Use numeric types (Int or Float)
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:23:65
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:24:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
24 |         string.from_codepoint(new_codepoint)
   |                               ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:8:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |         string.from_codepoint(new_codepoint)
  |                               ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:24:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
24 |         string.from_codepoint(new_codepoint)
   |                               ^^^^^^^^^^^^^

12 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift_mod = shift % 26
  let encrypted_chars = string.chars(text) |> list.map(
    (c) => {
      let codepoint = string.codepoint(c)
      if (codepoint >= 97 and codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        string.from_codepoint(new_codepoint)
      } else {
        string.from_codepoint(codepoint)
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift_mod = 26 - (shift % 26)
  let decrypted_chars = string.chars(text) |> list.map(
    (char) => {
      let codepoint = string.codepoint(char)
      if (codepoint >= 97 and codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        string.from_codepoint(new_codepoint)
      } else {
        char
      }
    }
  )
  string.join(decrypted_chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-caesar-cipher-2.almd:32:1
   |
32 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   | ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:42
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:47
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                               ^^^^^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:60
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:7:65
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
  |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:8:31
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |         string.from_codepoint(new_codepoint)
  |                               ^^^^^^^^^^^^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:10:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
10 |         string.from_codepoint(codepoint)
   |                               ^^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:42
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                          ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                               ^^^^^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:60
  in operator %
  hint: Use numeric types (Int or Float)
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                                            ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:23:65
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |         let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
   |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:24:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
24 |         string.from_codepoint(new_codepoint)
   |                               ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:8:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |         string.from_codepoint(new_codepoint)
  |                               ^^^^^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:10:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
10 |         string.from_codepoint(codepoint)
   |                               ^^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:24:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
24 |         string.from_codepoint(new_codepoint)
   |                               ^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:30:32
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
30 |   string.join(decrypted_chars, "")
   |                                ^^

16 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let shift_mod = shift % 26
  let encrypted_chars = string.chars(text) |> list.map(
    (c) => {
      let codepoint = string.codepoint(c)
      if (codepoint >= 97 and codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        match new_codepoint {
          | Some(n) => string.from_codepoint(n)
          | None => string.from_codepoint(codepoint)
        }
      } else {
        string.from_codepoint(codepoint)
      }
    }
  )
  string.join(encrypted_chars, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let shift_mod = 26 - (shift % 26)
  let decrypted_chars = string.chars(text) |> list.map(
    (c) => {
      let codepoint = string.codepoint(c)
      if (codepoint >= 97 and codepoint <= 122) then {
        let new_codepoint = (codepoint - 97 + shift_mod) % 26 + 97
        match new_codepoint {
          |
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected pattern at line 9:11 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-3.almd:9:11
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |           | Some(n) => string.from_codepoint(n)
  |           ^
error: Expected ')' to close function call opened at line 3:55
  --> /tmp/dojo-caesar-cipher-3.almd:12:9
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 3 |   let encrypted_chars = string.chars(text) |> list.map(
   |                                                       --------------- '(' opened here
...
12 |       } else {
   |         ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:15:5
   |
15 |     }
   |     ^
error: Expected pattern at line 28:11 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-3.almd:28:11
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |           |
   |           ^
error: Expected expression at line 30:1 (got Test 'test')
  --> /tmp/dojo-caesar-cipher-3.almd:30:1
   |
30 | test "encrypt abc by 1" { assert_eq(encrypt("abc", 1), "bcd") }
   | ^
error: Expected expression at line 31:1 (got Test 'test')
  --> /tmp/dojo-caesar-cipher-3.almd:31:1
   |
31 | test "encrypt xyz by 3" { assert_eq(encrypt("xyz", 3), "abc") }
   | ^
error: Expected ')' to close function call opened at line 22:55
  --> /tmp/dojo-caesar-cipher-3.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
22 |   let decrypted_chars = string.chars(text) |> list.map(
   |                                                       --------------- '(' opened here
...
32 | test "encrypt hello by 13" { assert_eq(encrypt("hello", 13), "uryyb") }
   | ^^^^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-3.almd:13:31
  in variable codepoint
  hint: Check the variable name
   |
13 |         string.from_codepoint(codepoint)
   |                               ^^^^^^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:21:33
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
21 |   let shift_mod = 26 - (shift % 26)
   |                                 ^^

9 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
