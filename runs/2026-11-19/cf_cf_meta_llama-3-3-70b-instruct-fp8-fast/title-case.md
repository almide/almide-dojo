# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String =
  let
    words = string.split(s, " ")
    capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  in
  list.join(capitalized_words, " ")
```

**Diagnostic:**

```
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-title-case-0.almd:2:6
  here: let
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-title-case-0.almd:5:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |   in
  |   ^
error[E003]: cannot assign to undefined binding 'words'
  --> /tmp/dojo-title-case-0.almd:3:29
  in words = ...
  here: words = string.split(s, " ")
  hint: No `let`/`var` named 'words' is in scope to assign to. Declare it first: `var words = ...`
  |
3 |     words = string.split(s, " ")
  |                             ^^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-title-case-0.almd:4:34
  in variable words
  here: capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  hint: Check the variable name
  |
4 |     capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  |                                  ^^^^^
error[E003]: cannot assign to undefined binding 'capitalized_words'
  --> /tmp/dojo-title-case-0.almd:4:85
  in capitalized_words = ...
  here: capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  hint: No `let`/`var` named 'capitalized_words' is in scope to assign to. Declare it first: `var capitalized_words = ...`
  |
4 |     capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  |                                                                                     ^^^^
error[E003]: undefined variable 'capitalized_words'
  --> /tmp/dojo-title-case-0.almd:6:13
  in variable capitalized_words
  here: list.join(capitalized_words, " ")
  hint: Check the variable name
  |
6 |   list.join(capitalized_words, " ")
  |             ^^^^^^^^^^^^^^^^^

6 error(s) found
FAILED: /tmp/dojo-title-case-0.almd
  parse error: Expected identifier at line 2:6 (got Newline '')
  parse error: Expected expression at line 5:3 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-title-case-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn title_case(s: String) -> String =
  string.split(s, " ") 
  |> list.map((word) => string.capitalize(string.to_lower(word)))
  |> list.join(" ")
```
