# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String {
  let mut encoded = String::new();
  let mut count = 0;
  let mut prev = None;
  for c in string.chars(s) {
    match prev {
      Some(x) if x == c => count += 1,
      Some(_) => {
        if count > 0 {
          encoded += &int.to_string(count);
        }
        count = 1;
      },
      None => count = 1,
    }
    prev = Some(c);
  }
  if count > 0 {
    encoded += &int.to_string(count);
  }
  encoded
}

fn rle_decode(s: String) -> String {
  let mut decoded = String::new();
  let mut count = None;
  let mut c = None;
  for c in string.chars(s) {
    match c {
      '0'..='9' => {
        if count.is_some() {
          decoded += &c.to_string().repeat(count.unwrap());
        }
        count = Some(c.to_digit(10).unwrap());
      },
      _ => {
        if count.is_some() {
          decoded += &c.to_string().repeat(count.unwrap());
          count = None;
        } else
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-run-length-encoding-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn rle_encode(...) -> Type = { ... }

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let mut encoded = String::new();
  let mut count = 0;
  let mut prev = None;
  for c in string.chars(s) {
    match prev {
      Some(x) if x == c => count += 1,
      Some(_) => {
        if count > 0 {
          encoded += &int.to_string(count);
        }
        count = 1;
      },
      None => count = 1,
    }
    prev = Some(c);
  }
  if count > 0 {
    encoded += &int.to_string(count);
  }
  encoded
}

fn rle_decode(s: String) -> String = {
  let mut decoded = String::new();
  let mut count = None;
  let mut c = None;
  for ch in string.chars(s) {
    match ch {
      '0'..='9' => {
        if count.is_some() {
          decoded += &c.to_string().repeat(count.unwrap());
        }
        count = Some(ch.to_digit(10).unwrap());
        c = None;
      },
      _ => {
        if count.is_some() {
          decoded += &c.to_string().repeat(count.unwrap());
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: 'let mut' is not valid in Almide at line 2:7
  --> /tmp/dojo-run-length-encoding-1.almd:2:7
  hint: Use 'var' for mutable variables. Example: var x = 0
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-run-length-encoding-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
error: 'let mut' is not valid in Almide at line 4:7
  --> /tmp/dojo-run-length-encoding-1.almd:4:7
  hint: Use 'var' for mutable variables. Example: var x = 0
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:7:35
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
error: Expected Then at line 9:22 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:9:22
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-run-length-encoding-1.almd:10:20
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
error: Expected '}' to close block opened at line 1:38
  --> /tmp/dojo-run-length-encoding-1.almd:10:22
  hint: Add '}' or check for a missing delimiter inside the block

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.run_length_encode(s);
  let result = string.join(encoded, "");
  result
}

fn rle_decode(s: String) -> String = {
  let parts = string.split(s, "");
  let decoded = string.join(parts, "");
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error[E005]: argument 'list' expects List[String] but got List[(String, Int)]
  --> /tmp/dojo-run-length-encoding-2.almd:3:37
  in call to string.join()
  hint: Fix the argument type
  |
3 |   let result = string.join(encoded, "");
  |                                     ^^
error[E001]: type mismatch in call to string.join(): expected List[String] but got List[(String, Int)]
  --> /tmp/dojo-run-length-encoding-2.almd:3:37
  in call to string.join()
  hint: Fix the expression type or change the expected type
  |
3 |   let result = string.join(encoded, "");
  |                                     ^^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.run_length_encode(s);
  let result = string.join(list.map(encoded, (x) => x.0 + int.to_string(x.1)), "");
  result
}

fn rle_decode(s: String) -> String = {
  let parts = string.split(s, "");
  let decoded = string.join(list.map(parts, (x) => {
    let count = int.parse(x.0);
    match count {
      ok(n) => list.repeat(x.1, n),
      err(_) => ""
    }
  }), "");
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error[E005]: argument 'list' expects List[String] but got List[List[?3]]
  --> /tmp/dojo-run-length-encoding-3.almd:15:7
  in call to string.join()
  hint: Fix the argument type
   |
15 |   }), "");
   |       ^^
error[E001]: type mismatch in match arm: expected List[?3] but got String
  --> /tmp/dojo-run-length-encoding-3.almd:13:17
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
13 |       err(_) => ""
   |                 ^^
error[E001]: type mismatch in call to string.join(): expected List[String] but got List[List[?3]]
  --> /tmp/dojo-run-length-encoding-3.almd:15:7
  in call to string.join()
  hint: Fix the expression type or change the expected type
   |
15 |   }), "");
   |       ^^

3 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
