# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                (codepoint - 97 + shift) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                (codepoint - 97 - shift + 26) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
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
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint < 122 {
                (codepoint - 97 + shift) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint < 122 {
                (codepoint - 97 - shift + 26) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:3:9
  |
3 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-1.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint < 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:7:15
  |
7 |             } else {
  |               ^
error: Expected expression at line 18:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-1.almd:18:9
   |
18 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 20:32
  --> /tmp/dojo-caesar-cipher-1.almd:20:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |             if codepoint >= 97 && codepoint < 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:22:15
   |
22 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:19:46
  in variable c
  hint: Check the variable name
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:4:46
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-1.almd:19:46
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                (codepoint - 97 + shift) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint <= 122 {
                (codepoint - 97 - shift + 26) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:3:9
  |
3 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-2.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint <= 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:7:15
  |
7 |             } else {
  |               ^
error: Expected expression at line 18:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-2.almd:18:9
   |
18 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 20:32
  --> /tmp/dojo-caesar-cipher-2.almd:20:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |             if codepoint >= 97 && codepoint <= 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-2.almd:22:15
   |
22 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-2.almd:19:46
  in variable c
  hint: Check the variable name
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:4:46
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:19:46
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint < 122 {
                (codepoint - 97 + shift) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
    result
}

fn decrypt(text: String, shift: Int) -> String = {
    let result = string.chars(text)
        .map(|c| {
            let codepoint = string.codepoint(c);
            if codepoint >= 97 && codepoint < 122 {
                (codepoint - 97 - shift + 26) % 26 + 97
            } else {
                codepoint
            }
        })
        .map(string.from_codepoint)
        .join("");
    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:3:9
  |
3 |         .map(|c| {
  |         ^
error: '&&' is not valid in Almide at line 5:32
  --> /tmp/dojo-caesar-cipher-3.almd:5:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |             if codepoint >= 97 && codepoint < 122 {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:7:15
  |
7 |             } else {
  |               ^
error: Expected expression at line 18:9 (got Dot '.')
  --> /tmp/dojo-caesar-cipher-3.almd:18:9
   |
18 |         .map(|c| {
   |         ^
error: '&&' is not valid in Almide at line 20:32
  --> /tmp/dojo-caesar-cipher-3.almd:20:32
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |             if codepoint >= 97 && codepoint < 122 {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:15 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-3.almd:22:15
   |
22 |             } else {
   |               ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:4:46
  in variable c
  hint: Check the variable name
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-3.almd:19:46
  in variable c
  hint: Check the variable name
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:4:46
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |             let codepoint = string.codepoint(c);
  |                                              ^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:19:46
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |             let codepoint = string.codepoint(c);
   |                                              ^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
