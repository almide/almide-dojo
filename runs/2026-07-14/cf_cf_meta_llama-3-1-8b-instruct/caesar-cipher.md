# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    if code >= 97 && code <= 122 then {
      let new_code = ((code - 97 + shift) % 26) + 97
      string.from_codepoint(new_code)
    } else {
      c
    }
  })
  string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    if code >= 97 && code <= 122 then {
      let new_code = ((code - 97 - shift + 26) % 26) + 97
      string.from_codepoint(new_code)
    } else {
      c
    }
  })
  string.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-0.almd
error: '&&' is not valid in Almide at line 5:19
  --> /tmp/dojo-caesar-cipher-0.almd:5:19
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     if code >= 97 && code <= 122 then {
  |                   ^
error: Expected ')' to close function call opened at line 3:24
  --> /tmp/dojo-caesar-cipher-0.almd:8:7
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   let result = list.map(chars, (c) => {
  |                        --------------- '(' opened here
...
8 |     } else {
  |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:11:3
   |
11 |   })
   |   ^
error: '&&' is not valid in Almide at line 19:19
  --> /tmp/dojo-caesar-cipher-0.almd:19:19
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
19 |     if code >= 97 && code <= 122 then {
   |                   ^
error: Expected ')' to close function call opened at line 17:24
  --> /tmp/dojo-caesar-cipher-0.almd:22:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   let result = list.map(chars, (c) => {
   |                        --------------- '(' opened here
...
22 |     } else {
   |       ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:3 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-0.almd:25:3
   |
25 |   })
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:9:7
  in variable c
  hint: Check the variable name
  |
9 |       c
  |       ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-0.almd:23:7
  in variable c
  hint: Check the variable name
   |
23 |       c
   |       ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-0.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    if code >= 97 and code <= 122 then {
      let new_code = ((code - 97 + shift) % 26) + 97
      string.from_codepoint(new_code)
    } else {
      c
    }
  })
  string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    if code >= 97 and code <= 122 then {
      let new_code = ((code - 97 - shift + 26) % 26) + 97
      string.from_codepoint(new_code)
    } else {
      c
    }
  })
  string.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:31
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |       let new_code = ((code - 97 + shift) % 26) + 97
  |                               ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:36
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let new_code = ((code - 97 + shift) % 26) + 97
  |                                    ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:45
  in operator %
  hint: Use numeric types (Int or Float)
  |
6 |       let new_code = ((code - 97 + shift) % 26) + 97
  |                                             ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:51
  in operator +
  hint: Use + with numeric types, String, or List
  |
6 |       let new_code = ((code - 97 + shift) % 26) + 97
  |                                                   ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the argument type
  |
7 |       string.from_codepoint(new_code)
  |                             ^^^^^^^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:31
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let new_code = ((code - 97 - shift + 26) % 26) + 97
   |                               ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:36
  in operator -
  hint: Use numeric types (Int or Float)
   |
20 |       let new_code = ((code - 97 - shift + 26) % 26) + 97
   |                                    ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:44
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let new_code = ((code - 97 - shift + 26) % 26) + 97
   |                                            ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:50
  in operator %
  hint: Use numeric types (Int or Float)
   |
20 |       let new_code = ((code - 97 - shift + 26) % 26) + 97
   |                                                  ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:20:56
  in operator +
  hint: Use + with numeric types, String, or List
   |
20 |       let new_code = ((code - 97 - shift + 26) % 26) + 97
   |                                                        ^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the argument type
   |
21 |       string.from_codepoint(new_code)
   |                             ^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:7:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
  |
7 |       string.from_codepoint(new_code)
  |                             ^^^^^^^^
error[E001]: type mismatch in call to string.from_codepoint(): expected Int but got Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:21:29
  in call to string.from_codepoint()
  hint: Fix the expression type or change the expected type
   |
21 |       string.from_codepoint(new_code)
   |                             ^^^^^^^^

13 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    match code {
      | some(c) =>
        if c >= 97 and c <= 122 then {
          let new_code = ((c - 97 + shift) % 26) + 97
          string.from_codepoint(new_code)
        } else {
          c
        }
      | none => c
    }
  })
  string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    match code {
      | some(c) =>
        if c >= 97 and c <= 122 then {
          let new_code = ((c - 97 - shift + 26) % 26) + 97
          string.from_codepoint(new_code)
        } else {
          c
        }
      | none => c
    }
  })
  string.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: Expected pattern at line 6:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-2.almd:6:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |       | some(c) =>
  |       ^
error: Expected expression at line 13:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-2.almd:13:7
   |
13 |       | none => c
   |       ^
error: Expected ')' to close function call opened at line 3:24
  --> /tmp/dojo-caesar-cipher-2.almd:15:3
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 3 |   let result = list.map(chars, (c) => {
   |                        --------------- '(' opened here
...
15 |   })
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:4 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-2.almd:15:4
   |
15 |   })
   |    ^
error: Expected pattern at line 24:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-2.almd:24:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 |       | some(c) =>
   |       ^
error: Expected expression at line 31:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-2.almd:31:7
   |
31 |       | none => c
   |       ^
error: Expected ')' to close function call opened at line 21:24
  --> /tmp/dojo-caesar-cipher-2.almd:33:3
  hint: Add ')' or check for a missing delimiter inside the function call
   |
21 |   let result = list.map(chars, (c) => {
   |                        --------------- '(' opened here
...
33 |   })
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 33:4 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-2.almd:33:4
   |
33 |   })
   |    ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:2:28
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let chars = string.chars(text)
  |                            ^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-2.almd:20:28
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |   let chars = string.chars(text)
   |                            ^^^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    match code {
      | some(c) =>
        if c >= 97 and c <= 122 then {
          let new_code = ((c - 97 + shift) % 26) + 97
          string.from_codepoint(new_code)
        } else {
          c
        }
      | none => c
    }
  })
  string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
  let chars = string.chars(text)
  let result = list.map(chars, (c) => {
    let code = string.codepoint(c)
    match code {
      | some(c) =>
        if c >= 97 and c <= 122 then {
          let new_code = ((c - 97 - shift + 26) % 26) + 97
          string.from_codepoint(new_code)
        } else {
          c
        }
      | none => c
    }
  })
  string.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected pattern at line 6:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-3.almd:6:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
6 |       | some(c) =>
  |       ^
error: Expected expression at line 13:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-3.almd:13:7
   |
13 |       | none => c
   |       ^
error: Expected ')' to close function call opened at line 3:24
  --> /tmp/dojo-caesar-cipher-3.almd:15:3
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 3 |   let result = list.map(chars, (c) => {
   |                        --------------- '(' opened here
...
15 |   })
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:4 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-3.almd:15:4
   |
15 |   })
   |    ^
error: Expected pattern at line 24:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-3.almd:24:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
24 |       | some(c) =>
   |       ^
error: Expected expression at line 31:7 (got Pipe '|')
  --> /tmp/dojo-caesar-cipher-3.almd:31:7
   |
31 |       | none => c
   |       ^
error: Expected ')' to close function call opened at line 21:24
  --> /tmp/dojo-caesar-cipher-3.almd:33:3
  hint: Add ')' or check for a missing delimiter inside the function call
   |
21 |   let result = list.map(chars, (c) => {
   |                        --------------- '(' opened here
...
33 |   })
   |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 33:4 (got RParen ')')
  --> /tmp/dojo-caesar-cipher-3.almd:33:4
   |
33 |   })
   |    ^
error[E001]: type mismatch in fn 'encrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:2:28
  in fn 'encrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let chars = string.chars(text)
  |                            ^^^^
error[E001]: type mismatch in fn 'decrypt': expected String but got Unit
  --> /tmp/dojo-caesar-cipher-3.almd:20:28
  in fn 'decrypt'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |   let chars = string.chars(text)
   |                            ^^^^

10 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
