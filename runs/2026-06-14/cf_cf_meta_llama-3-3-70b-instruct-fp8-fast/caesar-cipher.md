# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  let
    shifted_codepoint = (codepoint: Int) => 
      if codepoint >= 97 and codepoint <= 122 then
        ((codepoint - 97 + shift) mod 26) + 97
      else
        codepoint
  in
  string.join(
    list.map(
      string.chars(text),
      (char: String) => 
        string.from_codepoint(
          shifted_codepoint(
            option.unwrap_or(
              string.codepoint(char),
              0
            )
          )
        )
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, 26 - (shift mod 26))
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected ')' to close parenthesized expression opened at line 5:9
  --> /tmp/dojo-caesar-cipher-0.almd:5:35
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |         ((codepoint - 97 + shift) mod 26) + 97
  |         --------------- '(' opened here
  |
5 |         ((codepoint - 97 + shift) mod 26) + 97
  |                                   ^^^
error: Expected expression at line 8:3 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:8:3
  |
8 |   in
  |   ^
error: Expected ')' to close parenthesized expression opened at line 26:22
  --> /tmp/dojo-caesar-cipher-0.almd:26:29
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
26 |   encrypt(text, 26 - (shift mod 26))
   |                      --------------- '(' opened here
   |
26 |   encrypt(text, 26 - (shift mod 26))
   |                             ^^^
error: Expected Fn at line 26:33 (got Int '26')
  --> /tmp/dojo-caesar-cipher-0.almd:26:33
   |
26 |   encrypt(text, 26 - (shift mod 26))
   |                                 ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:7:9
  in variable codepoint
  hint: Check the variable name
  |
7 |         codepoint
  |         ^^^^^^^^^
error[E002]: undefined function 'shifted_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:17:15
  in call to shifted_codepoint()
  hint: Did you mean `string.codepoint`?
  try:
      // shifted_codepoint(...)  →  string.codepoint(...)
      string.codepoint(...)
   |
17 |               0
   |               ^

7 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (char: String) => 
        string.from_codepoint(
          if option.unwrap_or(string.codepoint(char), 0) >= 97 and option.unwrap_or(string.codepoint(char), 0) <= 122 then
            ((option.unwrap_or(string.codepoint(char), 0) - 97 + shift) mod 26) + 97
          else
            option.unwrap_or(string.codepoint(char), 0)
        )
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, 26 - (shift % 26))
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected ')' to close parenthesized expression opened at line 8:13
  --> /tmp/dojo-caesar-cipher-1.almd:8:73
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
8 |             ((option.unwrap_or(string.codepoint(char), 0) - 97 + shift) mod 26) + 97
  |             --------------- '(' opened here
  |
8 |             ((option.unwrap_or(string.codepoint(char), 0) - 97 + shift) mod 26) + 97
  |                                                                         ^^^
error: Expected Fn at line 8:77 (got Int '26')
  --> /tmp/dojo-caesar-cipher-1.almd:8:77
  |
8 |             ((option.unwrap_or(string.codepoint(char), 0) - 97 + shift) mod 26) + 97
  |                                                                             ^

2 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String = 
  string.join(
    list.map(
      string.chars(text),
      (char: String) => 
        string.from_codepoint(
          if option.unwrap_or(string.codepoint(char), 0) >= 97 and option.unwrap_or(string.codepoint(char), 0) <= 122 then
            (((option.unwrap_or(string.codepoint(char), 0) - 97 + shift) % 26) + 97)
          else
            option.unwrap_or(string.codepoint(char), 0)
        )
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String = 
  encrypt(text, 26 - (shift % 26))
```
