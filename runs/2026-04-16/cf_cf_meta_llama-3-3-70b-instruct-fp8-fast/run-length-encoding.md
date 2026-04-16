# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String =
  let chars = string.chars(s)
  in string.join(
    list.map(
      string.run_length_encode(s),
      (x) => int.to_string(x.1) + x.0
    ),
    ""
  )

fn rle_decode(s: String) -> String =
  let parts = string.split(s, "")
  in string.join(
    list.flat_map(
      list.zip(
        list.map(
          list.filter_map(
            list.enumerate(parts),
            (x) =>
              if x.0 % 2 == 0 then
                int.parse(x.1)
              else none
          ),
          (x) => x
        ),
        list.drop(parts, 1)
      ),
      (x) => list.repeat(x.1, x.0)
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error[E005]: argument 'f' expects fn((Int, String)) -> Option[B] but got fn(?1) -> Result[Int, String]
  --> /tmp/dojo-run-length-encoding-0.almd:22:20
  in call to list.filter_map()
  hint: Fix the argument type
   |
22 |               else none
   |                    ^^^^
error[E001]: type mismatch in if branches: expected Result[Int, String] but got Option[?2]
  --> /tmp/dojo-run-length-encoding-0.almd:22:20
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
22 |               else none
   |                    ^^^^
error[E001]: type mismatch in call to list.filter_map(): expected fn((Int, String)) -> Option[B] but got fn((Int, String)) -> Result[Int, String]
  --> /tmp/dojo-run-length-encoding-0.almd:22:20
  in call to list.filter_map()
  hint: Fix the expression type or change the expected type
   |
22 |               else none
   |                    ^^^^

3 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String =
  let chars = string.run_length_encode(s)
  in string.join(
    list.map(
      chars,
      (x) => int.to_string(x.1) + x.0
    ),
    ""
  )

fn rle_decode(s: String) -> String =
  let parts = string.split(s, "")
  in string.join(
    list.flat_map(
      list.zip(
        list.map(
          list.filter_map(
            list.enumerate(parts),
            (x) =>
              if x.0 % 2 == 0 then
                match int.parse(x.1) {
                  ok(n) => some(n)
                  err(_) => none
                }
              else none
          ),
          (x) => x
        ),
        list.drop(parts, 1)
      ),
      (x) => list.repeat(x.1, x.0)
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String =
  let chars = string.run_length_encode(s)
  in string.join(
    list.map(
      chars,
      (x) => int.to_string(x.1) + x.0
    ),
    ""
  )

fn rle_decode(s: String) -> String =
  let parts = string.split(s, "")
  in string.join(
    list.flat_map(
      list.zip(
        list.map(
          list.filter_map(
            list.enumerate(parts),
            (x) =>
              if x.0 % 2 == 0 then
                match int.parse(x.1) {
                  ok(n) => some(n)
                  err(_) => none
                }
              else none
          ),
          (x) => x
        ),
        list.drop(parts, 1)
      ),
      (x) => list.repeat(x.1, x.0)
    ),
    ""
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String =
  let chars = string.run_length_encode(s)
  in string.join(
    list.map(
      chars,
      (x) => int.to_string(x.1) + x.0
    ),
    ""
  )

fn rle_decode(s: String) -> String =
  let parts = string.split(s, "")
  in string.join(
    list.flat_map(
      list.zip(
        list.map(
          list.filter_map(
            list.enumerate(parts),
            (x) =>
              if x.0 % 2 == 0 then
                match int.parse(x.1) {
                  ok(n) => some(n)
                  err(_) => none
                }
              else none
          ),
          (x) => x
        ),
        list.map(
          list.filter_map(
            list.enumerate(parts),
            (x) =>
              if x.0 % 2 == 1 then
                match string.get(x.1, 0) {
                  some(c) => some(c)
                  none => none
                }
              else none
          ),
          (x) => x
        )
      ),
      (x) => list.repeat(x.1, x.0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: Expected ')' to close function call opened at line 14:18
  --> /tmp/dojo-run-length-encoding-3.almd:45:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |     list.flat_map(
   |                  --------------- '(' opened here
...
45 | test "rle_encode empty" { assert_eq(rle_encode(""), "") }
   | ^^^^
error[E001]: type mismatch in fn 'rle_decode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:12:31
  in fn 'rle_decode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
12 |   let parts = string.split(s, "")
   |                               ^^

2 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
