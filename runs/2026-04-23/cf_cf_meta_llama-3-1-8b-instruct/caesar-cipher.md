# caesar-cipher

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String {
    let chars = string.chars(text);
    let result = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let base = codepoint - 97;
            let shifted = (base + shift) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            c
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String {
    let chars = string.chars(text);
    let result = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint <= 122 {
            let base = codepoint - 97;
            let shifted = (base - shift + 26) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            c
        }
    });
    string.join(result, "")
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
    let chars = string.chars(text);
    let result = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint < 122 {
            let base = codepoint - 97;
            let shifted = (base + shift) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            c
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map(|c| {
        let codepoint = string.codepoint(c);
        if codepoint >= 97 && codepoint < 122 {
            let base = codepoint - 97;
            let shifted = (base - shift + 26) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            c
        }
    });
    string.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-1.almd
error: '|x|' closure syntax is not valid in Almide at line 3:28
  --> /tmp/dojo-caesar-cipher-1.almd:3:28
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     let result = chars.map(|c| {
  |                            ^
error: '&&' is not valid in Almide at line 5:28
  --> /tmp/dojo-caesar-cipher-1.almd:5:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |         if codepoint >= 97 && codepoint < 122 {
  |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:9:11
  |
9 |         } else {
  |           ^
error: '|x|' closure syntax is not valid in Almide at line 18:28
  --> /tmp/dojo-caesar-cipher-1.almd:18:28
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
18 |     let result = chars.map(|c| {
   |                            ^
error: '&&' is not valid in Almide at line 20:28
  --> /tmp/dojo-caesar-cipher-1.almd:20:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |         if codepoint >= 97 && codepoint < 122 {
   |                            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:11 (got Else 'else')
  --> /tmp/dojo-caesar-cipher-1.almd:24:11
   |
24 |         } else {
   |           ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:4:42
  in variable c
  hint: Check the variable name
  |
4 |         let codepoint = string.codepoint(c);
  |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:6:36
  in operator -
  hint: Use numeric types (Int or Float)
  |
6 |             let base = codepoint - 97;
  |                                    ^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:35
  in operator +
  hint: Use + with numeric types, String, or List
  |
7 |             let shifted = (base + shift) % 26;
  |                                   ^^^^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:7:44
  in operator %
  hint: Use numeric types (Int or Float)
  |
7 |             let shifted = (base + shift) % 26;
  |                                            ^^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:8:40
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |             string.from_codepoint(97 + shifted)
  |                                        ^^^^^^^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-caesar-cipher-1.almd:19:42
  in variable c
  hint: Check the variable name
   |
19 |         let codepoint = string.codepoint(c);
   |                                          ^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:21:36
  in operator -
  hint: Use numeric types (Int or Float)
   |
21 |             let base = codepoint - 97;
   |                                    ^^
error: operator '-' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:22:35
  in operator -
  hint: Use numeric types (Int or Float)
   |
22 |             let shifted = (base - shift + 26) % 26;
   |                                   ^^^^^
error: operator '+' requires numeric, String, or List types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:22:43
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |             let shifted = (base - shift + 26) % 26;
   |                                           ^^
error: operator '%' requires numeric types but got Option[Int] and Int
  --> /tmp/dojo-caesar-cipher-1.almd:22:49
  in operator %
  hint: Use numeric types (Int or Float)
   |
22 |             let shifted = (base - shift + 26) % 26;
   |                                                 ^^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-caesar-cipher-1.almd:23:40
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |             string.from_codepoint(97 + shifted)
   |                                        ^^^^^^^

17 error(s) found
Compile error for /tmp/dojo-caesar-cipher-1.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 && codepoint < 122 {
            let base = codepoint - 97;
            let shifted = (base + shift) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            x
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 && codepoint < 122 {
            let base = codepoint - 97;
            let shifted = (base - shift + 26) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            x
        }
    });
    string.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-2.almd
error: '&&' is not valid in Almide at line 5:28
  --> /tmp/dojo-caesar-cipher-2.almd:5:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |         if codepoint >= 97 && codepoint < 122 {
  |                            ^
error: Expected ')' to close function call opened at line 3:27
  --> /tmp/dojo-caesar-cipher-2.almd:9:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let result = chars.map((x) => {
  |                           --------------- '(' opened here
...
9 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:12:5
   |
12 |     });
   |     ^
error: '&&' is not valid in Almide at line 20:28
  --> /tmp/dojo-caesar-cipher-2.almd:20:28
  hint: Use 'and' for logical AND. Example: if a and b then ...
   |
20 |         if codepoint >= 97 && codepoint < 122 {
   |                            ^
error: Expected ')' to close function call opened at line 18:27
  --> /tmp/dojo-caesar-cipher-2.almd:24:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |     let result = chars.map((x) => {
   |                           --------------- '(' opened here
...
24 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-2.almd:27:5
   |
27 |     });
   |     ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-2.almd:10:13
  in variable x
  hint: Check the variable name
   |
10 |             x
   |             ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-2.almd:25:13
  in variable x
  hint: Check the variable name
   |
25 |             x
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-2.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn encrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 and codepoint < 122 {
            let base = codepoint - 97;
            let shifted = (base + shift) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            x
        }
    });
    string.join(result, "")
}

fn decrypt(text: String, shift: Int) -> String = {
    let chars = string.chars(text);
    let result = chars.map((x) => {
        let codepoint = string.codepoint(x);
        if codepoint >= 97 and codepoint < 122 {
            let base = codepoint - 97;
            let shifted = (base - shift + 26) % 26;
            string.from_codepoint(97 + shifted)
        } else {
            x
        }
    });
    string.join(result, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-caesar-cipher-3.almd
error: Expected Then at line 5:48 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:5:48
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
5 |         if codepoint >= 97 and codepoint < 122 {
  |                                                ^
error: Expected ')' to close function call opened at line 3:27
  --> /tmp/dojo-caesar-cipher-3.almd:9:11
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |     let result = chars.map((x) => {
  |                           --------------- '(' opened here
...
9 |         } else {
  |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:12:5
   |
12 |     });
   |     ^
error: Expected Then at line 20:48 (got LBrace '{')
  --> /tmp/dojo-caesar-cipher-3.almd:20:48
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
20 |         if codepoint >= 97 and codepoint < 122 {
   |                                                ^
error: Expected ')' to close function call opened at line 18:27
  --> /tmp/dojo-caesar-cipher-3.almd:24:11
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |     let result = chars.map((x) => {
   |                           --------------- '(' opened here
...
24 |         } else {
   |           ^^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:5 (got RBrace '}')
  --> /tmp/dojo-caesar-cipher-3.almd:27:5
   |
27 |     });
   |     ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-3.almd:10:13
  in variable x
  hint: Check the variable name
   |
10 |             x
   |             ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-caesar-cipher-3.almd:25:13
  in variable x
  hint: Check the variable name
   |
25 |             x
   |             ^

8 error(s) found
Compile error for /tmp/dojo-caesar-cipher-3.almd:
compile failed
FAILED: /tmp/dojo-caesar-cipher-3.almd

1/1 test file(s) failed

```
