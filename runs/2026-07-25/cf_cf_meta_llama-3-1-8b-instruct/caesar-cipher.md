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
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint <= 122 {
        let shifted = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String {
  string.chars(text)
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint <= 122 {
        let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
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
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint <= 122 {
        let shifted = (codepoint - 97 + shift) % 26 + 97;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  string.chars(text)
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 && codepoint <= 122 {
        let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected expression at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:3:5
  |
3 |     .map(|c| {
  |     ^
error: '&&' is not valid in Almide at line 5:26
  --> /tmp/dojo-caesar-cipher-1.almd:5:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |       if codepoint >= 97 && codepoint <= 122 {
  |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:8:9
  |
8 |       } else {
  |         ^
error: Expected expression at line 17:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:17:5
   |
17 |     .map(|c| {
   |     ^
error: '&&' is not valid in Almide at line 19:26
  --> /tmp/dojo-caesar-cipher-1.almd:19:26
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |       if codepoint >= 97 && codepoint <= 122 {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:22:9
   |
22 |       } else {
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:40
  in variable c
  hint: Check the variable name
  |
4 |       let codepoint = string.codepoint(c);
  |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:36
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                    ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:41
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                         ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:50
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:55
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted = (codepoint - 97 + shift) % 26 + 97;
  |                                                       ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |         string.from_codepoint(shifted)
  |                               ^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:18:40
  in variable c
  hint: Check the variable name
   |
18 |       let codepoint = string.codepoint(c);
   |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:36
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                    ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:41
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                         ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:49
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |         let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                 ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:55
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                       ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:60
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |         let shifted = (codepoint - 97 - shift + 26) % 26 + 97;
   |                                                            ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |         string.from_codepoint(shifted)
   |                               ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |         string.from_codepoint(shifted)
  |                               ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |         string.from_codepoint(shifted)
   |                               ^^^^^^^

21 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.chars(text)
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint <= 122 {
        let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  string.chars(text)
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint <= 122 {
        let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:3:5
  |
3 |     .map(|c| {
  |     ^
error: Expected Then at line 5:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:5:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |       if codepoint >= 97 and codepoint <= 122 {
  |                                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:8:9
  |
8 |       } else {
  |         ^
error: Expected expression at line 17:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:17:5
   |
17 |     .map(|c| {
   |     ^
error: Expected Then at line 19:47 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-2.almd:19:47
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
19 |       if codepoint >= 97 and codepoint <= 122 {
   |                                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:22:9
   |
22 |       } else {
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:4:40
  in variable c
  hint: Check the variable name
  |
4 |       let codepoint = string.codepoint(c);
  |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:37
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:42
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                          ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:51
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:56
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                                        ^^
error[E003]: undefined variable 'as'
  --> /tmp/dojo-caesar-cipher-2.almd:6:60
  in variable as
  hint: Check the variable name
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                                            ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |         string.from_codepoint(shifted)
  |                               ^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:18:40
  in variable c
  hint: Check the variable name
   |
18 |       let codepoint = string.codepoint(c);
   |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:37
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                     ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:42
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                          ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:50
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                  ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:56
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:20:61
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                             ^^
error[E003]: undefined variable 'as'
  --> /tmp/dojo-caesar-cipher-2.almd:20:65
  in variable as
  hint: Check the variable name
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:21:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |         string.from_codepoint(shifted)
   |                               ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |         string.from_codepoint(shifted)
  |                               ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-2.almd:21:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |         string.from_codepoint(shifted)
   |                               ^^^^^^^

23 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.chars(text)
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint <= 122 then {
        let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  string.chars(text)
    .map(|c| {
      let codepoint = string.codepoint(c);
      if codepoint >= 97 and codepoint <= 122 then {
        let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
        string.from_codepoint(shifted)
      } else {
        c
      }
    })
    .join("")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:5
  |
3 |     .map(|c| {
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-3.almd:11:6
   |
11 |     })
   |      ^
error: Expected expression at line 17:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:17:5
   |
17 |     .map(|c| {
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:6 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-3.almd:25:6
   |
25 |     })
   |      ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:4:40
  in variable c
  hint: Check the variable name
  |
4 |       let codepoint = string.codepoint(c);
  |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:37
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:42
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                          ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:51
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:56
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                                        ^^
error[E003]: undefined variable 'as'
  --> /tmp/dojo-caesar-cipher-3.almd:6:60
  in variable as
  hint: Check the variable name
  |
6 |         let shifted = ((codepoint - 97 + shift) % 26 + 97) as Int;
  |                                                            ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |         string.from_codepoint(shifted)
  |                               ^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:9:9
  in variable c
  hint: Check the variable name
  |
9 |         c
  |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:18:40
  in variable c
  hint: Check the variable name
   |
18 |       let codepoint = string.codepoint(c);
   |                                        ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:37
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                     ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:42
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                          ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:50
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                  ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:56
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                        ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:20:61
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                             ^^
error[E003]: undefined variable 'as'
  --> /tmp/dojo-caesar-cipher-3.almd:20:65
  in variable as
  hint: Check the variable name
   |
20 |         let shifted = ((codepoint - 97 - shift + 26) % 26 + 97) as Int;
   |                                                                 ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:21:31
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |         string.from_codepoint(shifted)
   |                               ^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:23:9
  in variable c
  hint: Check the variable name
   |
23 |         c
   |         ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |         string.from_codepoint(shifted)
  |                               ^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:21:31
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |         string.from_codepoint(shifted)
   |                               ^^^^^^^

23 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
