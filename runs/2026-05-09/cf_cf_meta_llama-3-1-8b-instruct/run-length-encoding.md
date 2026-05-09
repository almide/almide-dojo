# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
    let mut result = ""
    let mut count = 0
    let chars = string.chars(s)

    for c in chars {
        if chars.len() == 0 {
            return result
        }

        if c == chars.first().unwrap() {
            count += 1
        } else {
            if count > 0 {
                result += int.to_string(count)
                result += c
            } else {
                result += c
            }
            count = 1
        }
    }

    if count > 0 {
        result += int.to_string(count)
    }

    result
}

fn rle_decode(s: String) -> String {
    let mut result = ""
    let chars = string.chars(s)

    for i in chars {
        if i.is_digit() {
            let count = int.parse(i.to_string())
            if count.is_err() {
                return result
            }
            count = count.unwrap()
        } else {
            count = 1
        }

        for _ in 1..count {
            result += i
        }
    }

    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-run-length-encoding-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn rle_encode(...) -> Type = { ... }
  |
1 | fn rle_encode(s: String) -> String {
  |                                    ^
error: Missing '=' before function body at line 31:36
  --> /tmp/dojo-run-length-encoding-0.almd:31:36
  hint: Almide requires '=' before the body. Write: fn rle_decode(...) -> Type = { ... }
   |
31 | fn rle_decode(s: String) -> String {
   |                                    ^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
    let mut result = ""
    let mut count = 0
    let chars = string.chars(s)

    for c in chars {
        if chars.len() == 0 {
            return result
        }

        if c == chars.first().unwrap() {
            count += 1
        } else {
            if count > 0 {
                result += int.to_string(count)
                result += c
            } else {
                result += c
            }
            count = 1
        }
    }

    if count > 0 {
        result += int.to_string(count)
    }

    result
}

fn rle_decode(s: String) -> String = {
    let mut result = ""
    let chars = string.chars(s)

    for i in chars {
        if i.is_digit() {
            let count = int.parse(i.to_string())
            if count.is_err() {
                return result
            }
            count = count.unwrap()
        } else {
            count = 1
        }

        for _ in 1..count {
            result += i
        }
    }

    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let mut' is not valid in Almide at line 2:9
  --> /tmp/dojo-run-length-encoding-1.almd:2:9
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
2 |     let mut result = ""
  |         ^
error: 'let mut' is not valid in Almide at line 3:9
  --> /tmp/dojo-run-length-encoding-1.almd:3:9
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |     let mut count = 0
  |         ^
error: Expected Then at line 7:29 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:7:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if chars.len() == 0 {
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got If 'if')
  --> /tmp/dojo-run-length-encoding-1.almd:11:9
   |
11 |         if c == chars.first().unwrap() {
   |         ^
error: 'let mut' is not valid in Almide at line 32:9
  --> /tmp/dojo-run-length-encoding-1.almd:32:9
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
32 |     let mut result = ""
   |         ^
error: Expected Then at line 36:25 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:36:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
36 |         if i.is_digit() {
   |                         ^
error: Expected Then at line 38:31 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:38:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
38 |             if count.is_err() {
   |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 41:13 (got Ident 'count')
  --> /tmp/dojo-run-length-encoding-1.almd:41:13
   |
41 |             count = count.unwrap()
   |             ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-run-length-encoding-1.almd:8:13
  in variable result
  hint: Check the variable name
  |
8 |             result
  |             ^^^^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-1.almd:37:35
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
37 |             let count = int.parse(i.to_string())
   |                                   ^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-run-length-encoding-1.almd:39:17
  in variable result
  hint: Check the variable name
   |
39 |                 result
   |                 ^^^^^^

11 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
    var result = ""
    var count = 0
    let chars = string.chars(s)

    for c in chars {
        if chars.len() == 0 {
            return result
        }

        if c == chars.first().unwrap() {
            count += 1
        } else {
            if count > 0 {
                result += int.to_string(count)
                result += c
            } else {
                result += c
            }
            count = 1
        }
    }

    if count > 0 {
        result += int.to_string(count)
    }

    result
}

fn rle_decode(s: String) -> String = {
    var result = ""
    let chars = string.chars(s)

    for i in chars {
        if i.is_digit() {
            let count = int.parse(i.to_string())
            if count.is_err() {
                return result
            }
            count = count.unwrap()
        } else {
            count = 1
        }

        for _ in 1..count {
            result += i
        }
    }

    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected Then at line 7:29 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:7:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if chars.len() == 0 {
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got If 'if')
  --> /tmp/dojo-run-length-encoding-2.almd:11:9
   |
11 |         if c == chars.first().unwrap() {
   |         ^
error: Expected Then at line 36:25 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:36:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
36 |         if i.is_digit() {
   |                         ^
error: Expected Then at line 38:31 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:38:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
38 |             if count.is_err() {
   |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 41:13 (got Ident 'count')
  --> /tmp/dojo-run-length-encoding-2.almd:41:13
   |
41 |             count = count.unwrap()
   |             ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-run-length-encoding-2.almd:37:35
  in variable i
  hint: Did you mean `s`?
  try:
      // i  →  s
      s
   |
37 |             let count = int.parse(i.to_string())
   |                                   ^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
    var result = ""
    var count = 0
    let chars = string.chars(s)

    for c in chars {
        if chars.len() == 0 {
            return result
        }

        if c == chars.first().unwrap() {
            count += 1
        } else {
            if count > 0 {
                result += int.to_string(count)
                result += c
            } else {
                result += c
            }
            count = 1
        }
    }

    if count > 0 {
        result += int.to_string(count)
    }

    result
}

fn rle_decode(s: String) -> String = {
    var result = ""
    let chars = string.chars(s)

    for c in chars {
        if c.is_digit() {
            let count = int.parse(c.to_string())
            if count.is_err() {
                return result
            }
            count = count.unwrap()
        } else {
            count = 1
        }

        for _ in 1..count {
            result += c
        }
    }

    result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: Expected Then at line 7:29 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:7:29
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if chars.len() == 0 {
  |                             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got If 'if')
  --> /tmp/dojo-run-length-encoding-3.almd:11:9
   |
11 |         if c == chars.first().unwrap() {
   |         ^
error: Expected Then at line 36:25 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:36:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
36 |         if c.is_digit() {
   |                         ^
error: Expected Then at line 38:31 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:38:31
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
38 |             if count.is_err() {
   |                               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 41:13 (got Ident 'count')
  --> /tmp/dojo-run-length-encoding-3.almd:41:13
   |
41 |             count = count.unwrap()
   |             ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-run-length-encoding-3.almd:37:35
  in variable c
  hint: Did you mean `s`?
  try:
      // c  →  s
      s
   |
37 |             let count = int.parse(c.to_string())
   |                                   ^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
