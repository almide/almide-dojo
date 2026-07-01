# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
          ((code - 97 + shift) % 26 + 97)
        } else {
          code
        }
      })
      .to_list()
  )
}

fn decrypt(text: String, shift: Int) -> String {
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
          ((code - 97 - shift + 26) % 26 + 97)
        } else {
          code
        }
      })
      .to_list()
  )
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
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
          ((code - 97 + shift) % 26 + 97)
        } else {
          code
        }
      })
      .to_list()
  )
}

fn decrypt(text: String, shift: Int) -> String = {
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
          ((code - 97 - shift + 26) % 26 + 97)
        } else {
          code
        }
      })
      .to_list()
  )
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected ')' to close function call opened at line 2:25
  --> /tmp/dojo-caesar-cipher-1.almd:4:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.from_codepoints(
  |                         --------------- '(' opened here
...
4 |       .map(|c| {
  |       ^
error: '&&' is not valid in Almide at line 6:24
  --> /tmp/dojo-caesar-cipher-1.almd:6:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |         if (code >= 97 && code <= 122) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:8:11
  |
8 |         } else {
  |           ^
error: Expected ')' to close function call opened at line 17:25
  --> /tmp/dojo-caesar-cipher-1.almd:19:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   string.from_codepoints(
   |                         --------------- '(' opened here
...
19 |       .map(|c| {
   |       ^
error: '&&' is not valid in Almide at line 21:24
  --> /tmp/dojo-caesar-cipher-1.almd:21:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
21 |         if (code >= 97 && code <= 122) {
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:23:11
   |
23 |         } else {
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:5:37
  in variable c
  hint: Check the variable name
  |
5 |         let code = string.codepoint(c);
  |                                     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:20:37
  in variable c
  hint: Check the variable name
   |
20 |         let code = string.codepoint(c);
   |                                     ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:5:37
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
5 |         let code = string.codepoint(c);
  |                                     ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:20:37
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |         let code = string.codepoint(c);
   |                                     ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
          ((code - 97 + shift) % 26 + 97)
        } else {
          code
        }
      })
      .to_list()
  )
}

fn decrypt(text: String, shift: Int) -> String = {
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 && code <= 122) {
          ((code - 97 - shift + 26) % 26 + 97)
        } else {
          code
        }
      })
      .to_list()
  )
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected ')' to close function call opened at line 2:25
  --> /tmp/dojo-caesar-cipher-2.almd:4:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.from_codepoints(
  |                         --------------- '(' opened here
...
4 |       .map(|c| {
  |       ^
error: '&&' is not valid in Almide at line 6:24
  --> /tmp/dojo-caesar-cipher-2.almd:6:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
6 |         if (code >= 97 && code <= 122) {
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:8:11
  |
8 |         } else {
  |           ^
error: Expected ')' to close function call opened at line 17:25
  --> /tmp/dojo-caesar-cipher-2.almd:19:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   string.from_codepoints(
   |                         --------------- '(' opened here
...
19 |       .map(|c| {
   |       ^
error: '&&' is not valid in Almide at line 21:24
  --> /tmp/dojo-caesar-cipher-2.almd:21:24
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
21 |         if (code >= 97 && code <= 122) {
   |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:23:11
   |
23 |         } else {
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:5:37
  in variable c
  hint: Check the variable name
  |
5 |         let code = string.codepoint(c);
  |                                     ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:20:37
  in variable c
  hint: Check the variable name
   |
20 |         let code = string.codepoint(c);
   |                                     ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:5:37
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
5 |         let code = string.codepoint(c);
  |                                     ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:20:37
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |         let code = string.codepoint(c);
   |                                     ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 and code <= 122) {
          let new_code = ((code - 97 + shift) % 26 + 97);
          string.from_codepoint(new_code)
        } else {
          c
        }
      })
      .to_list()
  )
}

fn decrypt(text: String, shift: Int) -> String = {
  string.from_codepoints(
    string.chars(text)
      .map(|c| {
        let code = string.codepoint(c);
        if (code >= 97 and code <= 122) {
          let new_code = ((code - 97 - shift + 26) % 26 + 97);
          string.from_codepoint(new_code)
        } else {
          c
        }
      })
      .to_list()
  )
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected ')' to close function call opened at line 2:25
  --> /tmp/dojo-caesar-cipher-3.almd:4:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
2 |   string.from_codepoints(
  |                         --------------- '(' opened here
...
4 |       .map(|c| {
  |       ^
error: Expected Then at line 6:41 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:6:41
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |         if (code >= 97 and code <= 122) {
  |                                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:9:11
  |
9 |         } else {
  |           ^
error: Expected ')' to close function call opened at line 18:25
  --> /tmp/dojo-caesar-cipher-3.almd:20:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |   string.from_codepoints(
   |                         --------------- '(' opened here
...
20 |       .map(|c| {
   |       ^
error: Expected Then at line 22:41 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:22:41
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |         if (code >= 97 and code <= 122) {
   |                                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:25:11
   |
25 |         } else {
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:5:37
  in variable c
  hint: Check the variable name
  |
5 |         let code = string.codepoint(c);
  |                                     ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:35
  in operator -
  hint: Use numeric types (Int or Float)
  |
7 |           let new_code = ((code - 97 + shift) % 26 + 97);
  |                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:40
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           let new_code = ((code - 97 + shift) % 26 + 97);
  |                                        ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:49
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |           let new_code = ((code - 97 + shift) % 26 + 97);
  |                                                 ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:7:54
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |           let new_code = ((code - 97 + shift) % 26 + 97);
  |                                                      ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:8:33
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |           string.from_codepoint(new_code)
  |                                 ^^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:21:37
  in variable c
  hint: Check the variable name
   |
21 |         let code = string.codepoint(c);
   |                                     ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:35
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |           let new_code = ((code - 97 - shift + 26) % 26 + 97);
   |                                   ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:40
  in operator -
  hint: Use numeric types (Int or Float)
   |
23 |           let new_code = ((code - 97 - shift + 26) % 26 + 97);
   |                                        ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:48
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |           let new_code = ((code - 97 - shift + 26) % 26 + 97);
   |                                                ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:54
  in operator %
  hint: Use numeric types (Int or Float)
   |
23 |           let new_code = ((code - 97 - shift + 26) % 26 + 97);
   |                                                      ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:23:59
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |           let new_code = ((code - 97 - shift + 26) % 26 + 97);
   |                                                           ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:24:33
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
24 |           string.from_codepoint(new_code)
   |                                 ^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:8:33
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |           string.from_codepoint(new_code)
  |                                 ^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:24:33
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
24 |           string.from_codepoint(new_code)
   |                                 ^^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
