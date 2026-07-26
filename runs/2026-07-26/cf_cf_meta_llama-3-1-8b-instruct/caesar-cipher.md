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
      if let Some(codepoint) = string.codepoint(c) {
        if codepoint >= 97 && codepoint <= 122 {
          ((codepoint - 97 + shift) % 26 + 97).to_string()
        } else {
          c
        }
      } else {
        c
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String {
  encrypt(text, -shift)
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
error: Missing '=' before function body at line 17:48
  --> /tmp/dojo-caesar-cipher-0.almd:17:48
  hint: Almide requires '=' before the body. Write: fn decrypt(...) -> Type = { ... }
   |
17 | fn decrypt(text: String, shift: Int) -> String {
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
      if let Some(codepoint) = string.codepoint(c) {
        if codepoint >= 97 && codepoint <= 122 {
          ((codepoint - 97 + shift) % 26 + 97).to_string()
        } else {
          c
        }
      } else {
        c
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  encrypt(text, -shift)
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-caesar-cipher-1.almd:4:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |       if let Some(codepoint) = string.codepoint(c) {
  |          ^^^
error: '&&' is not valid in Almide at line 5:28
  --> /tmp/dojo-caesar-cipher-1.almd:5:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |         if codepoint >= 97 && codepoint <= 122 {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:7:11
  |
7 |         } else {
  |           ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:2:16
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   string.chars(text)
  |                ^^^^

5 error(s) found
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
      match codepoint {
        Some(cp) => {
          if cp >= 97 && cp <= 122 {
            ((cp - 97 + shift) % 26 + 97).to_string()
          } else {
            c
          }
        },
        none => c
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  encrypt(text, -shift)
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
error: '&&' is not valid in Almide at line 7:23
  --> /tmp/dojo-caesar-cipher-2.almd:7:23
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |           if cp >= 97 && cp <= 122 {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:9
   |
12 |         },
   |         ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:4:40
  in variable c
  hint: Check the variable name
  |
4 |       let codepoint = string.codepoint(c);
  |                                        ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:10:13
  in variable c
  hint: Check the variable name
   |
10 |             c
   |             ^

5 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  string.chars(text)
    .map(|char| {
      let codepoint = string.codepoint(char);
      match codepoint {
        some(cp) => {
          if cp >= 97 and cp <= 122 {
            ((cp - 97 + shift) % 26 + 97).to_string()
          } else {
            char
          }
        },
        none => char
      }
    })
    .join("")
}

fn decrypt(text: String, shift: Int) -> String = {
  encrypt(text, -shift)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 3:5 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:5
  |
3 |     .map(|char| {
  |     ^
error: Expected Then at line 7:37 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:7:37
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |           if cp >= 97 and cp <= 122 {
  |                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:9 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:9
   |
12 |         },
   |         ^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-3.almd:4:40
  in variable char
  hint: Check the variable name
  |
4 |       let codepoint = string.codepoint(char);
  |                                        ^^^^
error[E003]: undefined variable 'char'
  --> /tmp/dojo-caesar-cipher-3.almd:10:13
  in variable char
  hint: Check the variable name
   |
10 |             char
   |             ^^^^

5 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
