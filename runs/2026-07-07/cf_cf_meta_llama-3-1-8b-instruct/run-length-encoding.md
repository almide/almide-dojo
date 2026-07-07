# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => int.to_string(1) + c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        if string.last(acc) == c {
          acc.drop_end(1) + int.to_string(count + 1) + c
        } else {
          acc + int.to_string(1) + c
        }
      }
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        acc.drop_end(1) + string.repeat(c, count)
      }
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error: Expected Then at line 7:34 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-0.almd:7:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if string.last(acc) == c {
  |                                  ^
error: Expected ')' to close function call opened at line 2:37
  --> /tmp/dojo-run-length-encoding-0.almd:12:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 2 |   let encoded = string.chars(s).fold("", (acc, c) => {
   |                                     --------------- '(' opened here
...
12 |       }
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:5 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-0.almd:13:5
   |
13 |     }
   |     ^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-run-length-encoding-0.almd:24:44
  in call to string.repeat()
  hint: Fix the argument type
   |
24 |         acc.drop_end(1) + string.repeat(c, count)
   |                                            ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-0.almd:1:38
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn rle_encode(s: String) -> String = {
  |                                      ^
error[E001]: type mismatch in call to string.repeat(): expected Int but got Option[Int]
  --> /tmp/dojo-run-length-encoding-0.almd:24:44
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
24 |         acc.drop_end(1) + string.repeat(c, count)
   |                                            ^^^^^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => int.to_string(1) + c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        if string.last(acc) == c {
          acc.drop_end(1) + int.to_string(count + 1) + c
        } else {
          acc + int.to_string(1) + c
        }
      }
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        match count {
          0 => acc
          _ => acc.drop_end(1) + string.repeat(c, count)
        }
      }
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: Expected Then at line 7:34 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-1.almd:7:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if string.last(acc) == c {
  |                                  ^
error: Expected ')' to close function call opened at line 2:37
  --> /tmp/dojo-run-length-encoding-1.almd:12:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 2 |   let encoded = string.chars(s).fold("", (acc, c) => {
   |                                     --------------- '(' opened here
...
12 |       }
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:5 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-1.almd:13:5
   |
13 |     }
   |     ^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-run-length-encoding-1.almd:26:51
  in call to string.repeat()
  hint: Fix the argument type
   |
26 |           _ => acc.drop_end(1) + string.repeat(c, count)
   |                                                   ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-1.almd:1:38
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn rle_encode(s: String) -> String = {
  |                                      ^
error[E001]: type mismatch in call to string.repeat(): expected Int but got Option[Int]
  --> /tmp/dojo-run-length-encoding-1.almd:26:51
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
26 |           _ => acc.drop_end(1) + string.repeat(c, count)
   |                                                   ^^^^^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => int.to_string(1) + c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        if string.last(acc) == c {
          acc.drop_end(1) + int.to_string(count + 1) + c
        } else {
          acc + int.to_string(1) + c
        }
      }
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        match count {
          0 => acc
          _ => acc.drop_end(1) + string.repeat(string.first(c), count)
        }
      }
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected Then at line 7:34 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-2.almd:7:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if string.last(acc) == c {
  |                                  ^
error: Expected ')' to close function call opened at line 2:37
  --> /tmp/dojo-run-length-encoding-2.almd:12:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 2 |   let encoded = string.chars(s).fold("", (acc, c) => {
   |                                     --------------- '(' opened here
...
12 |       }
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:5 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-2.almd:13:5
   |
13 |     }
   |     ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:26:65
  in call to string.repeat()
  hint: Fix the argument type
   |
26 |           _ => acc.drop_end(1) + string.repeat(string.first(c), count)
   |                                                                 ^^^^^
error[E005]: argument 'n' expects Int but got Option[Int]
  --> /tmp/dojo-run-length-encoding-2.almd:26:65
  in call to string.repeat()
  hint: Fix the argument type
   |
26 |           _ => acc.drop_end(1) + string.repeat(string.first(c), count)
   |                                                                 ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-2.almd:1:38
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn rle_encode(s: String) -> String = {
  |                                      ^
error[E001]: type mismatch in call to string.repeat(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:26:65
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
26 |           _ => acc.drop_end(1) + string.repeat(string.first(c), count)
   |                                                                 ^^^^^
error[E001]: type mismatch in call to string.repeat(): expected Int but got Option[Int]
  --> /tmp/dojo-run-length-encoding-2.almd:26:65
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
26 |           _ => acc.drop_end(1) + string.repeat(string.first(c), count)
   |                                                                 ^^^^^

8 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => int.to_string(1) + c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        if string.last(acc) == c {
          acc.drop_end(1) + int.to_string(count + 1) + c
        } else {
          acc + int.to_string(1) + c
        }
      }
    }
  });
  if encoded == "" then encoded else encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    match acc {
      "" => c
      _ => {
        let count = int.parse(string.take_end(acc, 1))?;
        match count {
          0 => acc
          _ => acc.drop_end(1) + string.repeat(string.first(c), count.unwrap())
        }
      }
    }
  });
  if decoded == "" then decoded else decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error: Expected Then at line 7:34 (got LBrace '{')
  --> /tmp/dojo-run-length-encoding-3.almd:7:34
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
7 |         if string.last(acc) == c {
  |                                  ^
error: Expected ')' to close function call opened at line 2:37
  --> /tmp/dojo-run-length-encoding-3.almd:12:7
  hint: Add ')' or check for a missing delimiter inside the function call
   |
 2 |   let encoded = string.chars(s).fold("", (acc, c) => {
   |                                     --------------- '(' opened here
...
12 |       }
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:5 (got RBrace '}')
  --> /tmp/dojo-run-length-encoding-3.almd:13:5
   |
13 |     }
   |     ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-3.almd:26:65
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
26 |           _ => acc.drop_end(1) + string.repeat(string.first(c), count.unwrap())
   |                                                                 ^^^^^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:26:65
  in call to string.repeat()
  hint: Fix the argument type
   |
26 |           _ => acc.drop_end(1) + string.repeat(string.first(c), count.unwrap())
   |                                                                 ^^^^^
error[E001]: type mismatch in fn 'rle_encode': expected String but got Unit
  --> /tmp/dojo-run-length-encoding-3.almd:1:38
  in fn 'rle_encode'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn rle_encode(s: String) -> String = {
  |                                      ^
error[E001]: type mismatch in call to string.repeat(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:26:65
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
26 |           _ => acc.drop_end(1) + string.repeat(string.first(c), count.unwrap())
   |                                                                 ^^^^^

7 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
