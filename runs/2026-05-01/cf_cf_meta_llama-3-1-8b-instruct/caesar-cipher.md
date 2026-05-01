# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        fn(c) => if string.is_lower(c) then
          (string.codepoint(c) - 97 + shift) % 26 + 97
        else
          string.codepoint(c)
      )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        fn(c) => if string.is_lower(c) then
          (string.codepoint(c) - 97 - shift + 26) % 26 + 97
        else
          string.codepoint(c)
      )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected expression at line 5:9 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-0.almd:5:9
  |
5 |         fn(c) => if string.is_lower(c) then
  |         ^
error: Expected function name at line 5:11 (got LParen '(')
  --> /tmp/dojo-caesar-cipher-0.almd:5:11
  |
5 |         fn(c) => if string.is_lower(c) then
  |           ^
error: Expected expression at line 16:9 (got Fn 'fn')
  --> /tmp/dojo-caesar-cipher-0.almd:16:9
   |
16 |         fn(c) => if string.is_lower(c) then
   |         ^
error: Expected function name at line 16:11 (got LParen '(')
  --> /tmp/dojo-caesar-cipher-0.almd:16:11
   |
16 |         fn(c) => if string.is_lower(c) then
   |           ^

4 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        (c) => if string.is_lower(c) then
          (string.codepoint(c) - 97 + shift) % 26 + 97
        else
          string.codepoint(c)
      )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        (c) => if string.is_lower(c) then
          (string.codepoint(c) - 97 - shift + 26) % 26 + 97
        else
          string.codepoint(c)
      )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:34
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:39
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                       ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:48
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |           (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^
error[E005]: argument 'n' expects Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-1.almd:8:28
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
8 |           string.codepoint(c)
  |                            ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:34
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                  ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:39
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                       ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:47
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                               ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:53
  in operator %
  hint: Use numeric types (Int or Float)
   |
17 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                     ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:17:58
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |           (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                          ^^
error[E005]: argument 'n' expects Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-1.almd:19:28
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
19 |           string.codepoint(c)
   |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-1.almd:8:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
8 |           string.codepoint(c)
  |                            ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-1.almd:19:28
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
19 |           string.codepoint(c)
   |                            ^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        (c) => match string.is_lower(c) {
          some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
          none => string.codepoint(c)
        }
      )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        (c) => match string.is_lower(c) {
          some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
          none => string.codepoint(c)
        }
      )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error[E010]: non-exhaustive match: missing true, false
  --> /tmp/dojo-caesar-cipher-2.almd:5:38
  in match
  hint: Add arms for true, false, or use '_'
  |
5 |         (c) => match string.is_lower(c) {
  |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:48
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:62
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:6:67
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                                   ^^
error[E005]: argument 'n' expects Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-2.almd:7:36
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |           none => string.codepoint(c)
  |                                    ^
error[E010]: non-exhaustive match: missing true, false
  --> /tmp/dojo-caesar-cipher-2.almd:16:38
  in match
  hint: Add arms for true, false, or use '_'
   |
16 |         (c) => match string.is_lower(c) {
   |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:48
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:53
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                     ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:61
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                             ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:67
  in operator %
  hint: Use numeric types (Int or Float)
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-2.almd:17:72
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                        ^^
error[E005]: argument 'n' expects Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-2.almd:18:36
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
18 |           none => string.codepoint(c)
   |                                    ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-2.almd:7:36
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |           none => string.codepoint(c)
  |                                    ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[Option[Int]]
  --> /tmp/dojo-caesar-cipher-2.almd:18:36
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
18 |           none => string.codepoint(c)
   |                                    ^

15 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        (c) => match string.is_lower(c) {
          some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
          none => c
        }
      )
  )

fn decrypt(text: String, shift: Int) -> String =
  string.from_codepoint(
    string.chars(text)
      |> list.map(
        (c) => match string.is_lower(c) {
          some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
          none => c
        }
      )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error[E010]: non-exhaustive match: missing true, false
  --> /tmp/dojo-caesar-cipher-3.almd:5:38
  in match
  hint: Add arms for true, false, or use '_'
  |
5 |         (c) => match string.is_lower(c) {
  |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:48
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:53
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                     ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:62
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                              ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:6:67
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |           some(true) => (string.codepoint(c) - 97 + shift) % 26 + 97
  |                                                                   ^^
error[E005]: argument 'f' expects fn(String) -> B but got fn(Option[Int]) -> Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:19
  in call to list.map()
  hint: Fix the argument type
  |
7 |           none => c
  |                   ^
error[E005]: argument 'n' expects Int but got List[?1]
  --> /tmp/dojo-caesar-cipher-3.almd:7:19
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |           none => c
  |                   ^
error[E010]: non-exhaustive match: missing true, false
  --> /tmp/dojo-caesar-cipher-3.almd:16:38
  in match
  hint: Add arms for true, false, or use '_'
   |
16 |         (c) => match string.is_lower(c) {
   |                                      ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:17:48
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:17:53
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                     ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:17:61
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                             ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:17:67
  in operator %
  hint: Use numeric types (Int or Float)
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                   ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-3.almd:17:72
  in operator +
  hint: Use + with numeric types, String, or List
   |
17 |           some(true) => (string.codepoint(c) - 97 - shift + 26) % 26 + 97
   |                                                                        ^^
error[E005]: argument 'f' expects fn(String) -> B but got fn(Option[Int]) -> Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:18:19
  in call to list.map()
  hint: Fix the argument type
   |
18 |           none => c
   |                   ^
error[E005]: argument 'n' expects Int but got List[?3]
  --> /tmp/dojo-caesar-cipher-3.almd:18:19
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
18 |           none => c
   |                   ^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(Option[Int]) -> Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:7:19
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
7 |           none => c
  |                   ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[?1]
  --> /tmp/dojo-caesar-cipher-3.almd:7:19
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |           none => c
  |                   ^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(Option[Int]) -> Option[Int]
  --> /tmp/dojo-caesar-cipher-3.almd:18:19
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
18 |           none => c
   |                   ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[?3]
  --> /tmp/dojo-caesar-cipher-3.almd:18:19
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
18 |           none => c
   |                   ^

19 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
