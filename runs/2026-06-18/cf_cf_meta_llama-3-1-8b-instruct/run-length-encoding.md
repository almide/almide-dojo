# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold(
    "",
    (acc, c) => {
      let last = string.chars(acc).last().unwrap_or("");
      if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
      else acc + string.to_string(string.len(last)) + last
    }
  )
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold(
    "",
    (acc, c) => {
      let count = int.parse(string.take(c, string.len(c) - 1));
      if count.is_ok() then acc + string.repeat(string.first(c), count.unwrap())
      else acc
    }
  )
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-0.almd:6:155
  in call to string.len()
  hint: Fix the argument type
  |
6 |       if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
  |                                                                                                                                                           ^^^^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-run-length-encoding-0.almd:7:46
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |       else acc + string.to_string(string.len(last)) + last
  |                                              ^^^^
error[E002]: undefined method 'unwrap' on result
  --> /tmp/dojo-run-length-encoding-0.almd:18:66
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `result.<fn>(x)` (or `x |> result.<fn>`) — there is no method `unwrap` on `result`. Run `almide explain E002` for examples.
   |
18 |       if count.is_ok() then acc + string.repeat(string.first(c), count.unwrap())
   |                                                                  ^^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-0.almd:18:66
  in call to string.repeat()
  hint: Fix the argument type
   |
18 |       if count.is_ok() then acc + string.repeat(string.first(c), count.unwrap())
   |                                                                  ^^^^^
error[E001]: type mismatch in call to string.len(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-0.almd:6:155
  in call to string.len()
  hint: Fix the expression type or change the expected type
  |
6 |       if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
  |                                                                                                                                                           ^^^^
error[E001]: type mismatch in call to string.repeat(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-0.almd:18:66
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
18 |       if count.is_ok() then acc + string.repeat(string.first(c), count.unwrap())
   |                                                                  ^^^^^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold(
    "",
    (acc, c) => {
      match string.chars(acc).last() {
        some(last) => if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
        else acc + string.to_string(string.len(last)) + last
        none => acc + "1" + c
      }
    }
  )
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold(
    "",
    (acc, c) => {
      match int.parse(string.take(c, string.len(c) - 1)) {
        ok(count) => acc + string.repeat(string.first(c), count)
        err(_) => acc
      }
    }
  )
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:6:171
  in call to string.len()
  hint: Fix the argument type
  |
6 |         some(last) => if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
  |                                                                                                                                                                           ^^^^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-run-length-encoding-1.almd:7:48
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |         else acc + string.to_string(string.len(last)) + last
  |                                                ^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:20:59
  in call to string.repeat()
  hint: Fix the argument type
   |
20 |         ok(count) => acc + string.repeat(string.first(c), count)
   |                                                           ^^^^^
error[E001]: type mismatch in call to string.len(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:6:171
  in call to string.len()
  hint: Fix the expression type or change the expected type
  |
6 |         some(last) => if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
  |                                                                                                                                                                           ^^^^
error[E001]: type mismatch in call to string.repeat(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:20:59
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
20 |         ok(count) => acc + string.repeat(string.first(c), count)
   |                                                           ^^^^^

5 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold(
    "",
    (acc, c) => {
      match string.chars(acc).last() {
        some(last) => if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
        else acc + string.to_string(string.len(last)) + last
        none => acc + "1" + c
      }
    }
  )
  match encoded {
    some(e) => e
    none => ""
  }
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold(
    "",
    (acc, c) => {
      match int.parse(string.take(c, string.len(c) - 1)) {
        ok(count) => acc + string.repeat(string.first(c), count)
        err(_) => acc
      }
    }
  )
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:6:171
  in call to string.len()
  hint: Fix the argument type
  |
6 |         some(last) => if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
  |                                                                                                                                                                           ^^^^
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-run-length-encoding-2.almd:7:48
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |         else acc + string.to_string(string.len(last)) + last
  |                                                ^^^^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-run-length-encoding-2.almd:12:9
  in match
  hint: match on String requires a catch-all '_' pattern
   |
12 |   match encoded {
   |         ^^^^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:23:59
  in call to string.repeat()
  hint: Fix the argument type
   |
23 |         ok(count) => acc + string.repeat(string.first(c), count)
   |                                                           ^^^^^
error[E001]: type mismatch in call to string.len(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:6:171
  in call to string.len()
  hint: Fix the expression type or change the expected type
  |
6 |         some(last) => if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + string.drop_end(last, string.len(last) - string.len(string.first(last))) + "1"
  |                                                                                                                                                                           ^^^^
error[E001]: type mismatch in call to string.repeat(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:23:59
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
23 |         ok(count) => acc + string.repeat(string.first(c), count)
   |                                                           ^^^^^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold(
    "",
    (acc, c) => {
      match string.chars(acc).last() {
        some(last) => if last == c then acc + string.drop_end(acc, string.len(acc) - string.len(last)) + "1" + c
        else acc + string.to_string(string.len(last)) + last
        none => acc + "1" + c
      }
    }
  )
  match encoded {
    some(e) => e
    none => ""
  }
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold(
    "",
    (acc, c) => {
      let count = int.parse(string.take(c, string.len(c) - 1))
      match count {
        ok(count) => acc + string.repeat(string.first(c), count)
        err(_) => acc
      }
    }
  )
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-run-length-encoding-3.almd:7:48
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
7 |         else acc + string.to_string(string.len(last)) + last
  |                                                ^^^^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-run-length-encoding-3.almd:12:9
  in match
  hint: match on String requires a catch-all '_' pattern
   |
12 |   match encoded {
   |         ^^^^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:24:59
  in call to string.repeat()
  hint: Fix the argument type
   |
24 |         ok(count) => acc + string.repeat(string.first(c), count)
   |                                                           ^^^^^
error[E001]: type mismatch in call to string.repeat(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:24:59
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
24 |         ok(count) => acc + string.repeat(string.first(c), count)
   |                                                           ^^^^^

4 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
