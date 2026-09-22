# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String =
  let
    shifted_chars =
      string.chars(text)
      |> list.map((c) =>
        if string.is_lower(c) then
          let
            codepoint = string.codepoint(c) |> option.unwrap_or(0)
            new_codepoint = (codepoint - 97 + shift) % 26 + 97
          in
            string.from_codepoint(new_codepoint) |> option.unwrap_or("")
        else
          c
      )
  in
    string.join(shifted_chars, "")

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```

**Diagnostic:**

```
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-caesar-cipher-0.almd:2:6
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |      ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-0.almd:7:11
  in let-in
  here: let
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |           let
  |           ^^^
error: Expected expression at line 10:11 (got In 'in')
  --> /tmp/dojo-caesar-cipher-0.almd:10:11
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |           in
   |           ^
error: Expected expression at line 12:9 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-0.almd:12:9
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |         else
   |         ^
error: Expected expression at line 14:7 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-0.almd:14:7
  here: )
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |       )
   |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:8:42
  in variable c
  here: codepoint = string.codepoint(c) |> option.unwrap_or(0)
  hint: Check the variable name
  |
8 |             codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                          ^
error[E003]: cannot assign to undefined binding 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:8:65
  in codepoint = ...
  here: codepoint = string.codepoint(c) |> option.unwrap_or(0)
  hint: No `let`/`var` named 'codepoint' is in scope to assign to. Declare it first: `var codepoint = ...`
  |
8 |             codepoint = string.codepoint(c) |> option.unwrap_or(0)
  |                                                                 ^
error[E003]: undefined variable 'codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:9:30
  in variable codepoint
  here: new_codepoint = (codepoint - 97 + shift) % 26 + 97
  hint: Check the variable name
  |
9 |             new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                              ^^^^^^^^^
error[E003]: cannot assign to undefined binding 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:9:61
  in new_codepoint = ...
  here: new_codepoint = (codepoint - 97 + shift) % 26 + 97
  hint: No `let`/`var` named 'new_codepoint' is in scope to assign to. Declare it first: `var new_codepoint = ...`
  |
9 |             new_codepoint = (codepoint - 97 + shift) % 26 + 97
  |                                                             ^^
error[E003]: undefined variable 'new_codepoint'
  --> /tmp/dojo-caesar-cipher-0.almd:11:35
  in variable new_codepoint
  here: string.from_codepoint(new_codepoint) |> option.unwrap_or("")
  hint: Check the variable name
   |
11 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                   ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got String
  --> /tmp/dojo-caesar-cipher-0.almd:11:70
  in call to option.unwrap_or()
  here: string.from_codepoint(new_codepoint) |> option.unwrap_or("")
  hint: nothing to unwrap — the value is already String. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
...
11 |             string.from_codepoint(new_codepoint) |> option.unwrap_or("")
   |                                                                      ^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:13:11
  in variable c
  here: c
  hint: Check the variable name
   |
13 |           c
   |           ^
error[E003]: undefined variable 'shifted_chars'
  --> /tmp/dojo-caesar-cipher-0.almd:16:17
  in variable shifted_chars
  here: string.join(shifted_chars, "")
  hint: Check the variable name
   |
16 |     string.join(shifted_chars, "")
   |                 ^^^^^^^^^^^^^

13 error(s) found
FAILED: /tmp/dojo-caesar-cipher-0.almd
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn encrypt(text: String, shift: Int) -> String =
  string.join(
    list.map(string.chars(text), (c) =>
      if string.is_lower(c) then
        string.from_codepoint((string.codepoint(c) |> option.unwrap_or(0) - 97 + shift) % 26 + 97)
      else
        c
    ),
    ""
  )

fn decrypt(text: String, shift: Int) -> String =
  encrypt(text, 26 - shift)
```
