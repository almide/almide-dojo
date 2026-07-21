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
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 && cp <= 122 then 
            string.from_codepoint((cp - 97 + shift) % 26 + 97)
          else c
          end,
        none => c
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 && cp <= 122 then 
            string.from_codepoint((cp - 97 - shift + 26) % 26 + 97)
          else c
          end,
        none => c
      }
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 7:23
  --> /tmp/dojo-caesar-cipher-0.almd:7:23
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |           if cp >= 97 && cp <= 122 then
  |                       ^
error: '&&' is not valid in Almide at line 22:23
  --> /tmp/dojo-caesar-cipher-0.almd:22:23
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
22 |           if cp >= 97 && cp <= 122 then
   |                       ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 and cp <= 122 then 
            string.from_codepoint((cp - 97 + shift) % 26 + 97)
          else c
          end,
        none => c
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 and cp <= 122 then 
            string.from_codepoint((cp - 97 - shift + 26) % 26 + 97)
          else c
          end,
        none => c
      }
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected FatArrow at line 10:14 (got Comma ',')
  --> /tmp/dojo-caesar-cipher-1.almd:10:14
   |
10 |           end,
   |              ^
error: Expected FatArrow at line 25:14 (got Comma ',')
  --> /tmp/dojo-caesar-cipher-1.almd:25:14
   |
25 |           end,
   |              ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 and cp <= 122 then 
            string.from_codepoint((cp - 97 + shift) % 26 + 97)
          else c
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 and cp <= 122 then 
            string.from_codepoint((cp - 97 - shift + 26) % 26 + 97)
          else c
      }
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error[E010]: non-exhaustive match: missing none
  --> /tmp/dojo-caesar-cipher-2.almd:5:37
  in match
  hint: Add arms for none, or use '_'
  |
5 |       (c) => match string.codepoint(c) {
  |                                     ^
error[E005]: argument 'n' expects Int but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:9:16
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
9 |           else c
  |                ^
error[E010]: non-exhaustive match: missing none
  --> /tmp/dojo-caesar-cipher-2.almd:18:37
  in match
  hint: Add arms for none, or use '_'
   |
18 |       (c) => match string.codepoint(c) {
   |                                     ^
error[E005]: argument 'n' expects Int but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:22:16
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
22 |           else c
   |                ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:9:16
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
9 |           else c
  |                ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[String]
  --> /tmp/dojo-caesar-cipher-2.almd:22:16
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
22 |           else c
   |                ^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 and cp <= 122 then 
            string.from_codepoint((cp - 97 + shift) % 26 + 97)
          else c
      }
    )
  )

fn decrypt(text: String, shift: Int) -> String = 
  string.from_codepoint(
    list.map(
      string.chars(text),
      (c) => match string.codepoint(c) {
        some(cp) => 
          if cp >= 97 and cp <= 122 then 
            string.from_codepoint((cp - 97 - shift + 26) % 26 + 97)
          else c
      }
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error[E010]: non-exhaustive match: missing none
  --> /tmp/dojo-caesar-cipher-3.almd:5:37
  in match
  hint: Add arms for none, or use '_'
  |
5 |       (c) => match string.codepoint(c) {
  |                                     ^
error[E005]: argument 'n' expects Int but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:9:16
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
9 |           else c
  |                ^
error[E010]: non-exhaustive match: missing none
  --> /tmp/dojo-caesar-cipher-3.almd:18:37
  in match
  hint: Add arms for none, or use '_'
   |
18 |       (c) => match string.codepoint(c) {
   |                                     ^
error[E005]: argument 'n' expects Int but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:22:16
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
22 |           else c
   |                ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:9:16
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
9 |           else c
  |                ^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got List[String]
  --> /tmp/dojo-caesar-cipher-3.almd:22:16
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
22 |           else c
   |                ^

6 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
