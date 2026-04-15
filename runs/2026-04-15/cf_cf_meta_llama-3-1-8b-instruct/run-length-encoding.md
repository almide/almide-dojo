# run-length-encoding

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = list.fold(string.chars(s), "", (acc, c) => {
    if acc == "" then {
      int.to_string(1) + c
    } else {
      let last = string.last(acc);
      if last == c then {
        let count = int.parse(string.slice(0, acc.len() - 1));
        int.to_string(count + 1) + last
      } else {
        acc + int.to_string(1) + c
      }
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = list.fold(string.chars(s), "", (acc, c) => {
    if c.is_digit() then {
      let count = int.parse(string.slice(0, acc.len() + 1));
      acc + string.repeat(count)
    } else {
      acc + c
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-run-length-encoding-0.almd:8:59
  in call to string.slice()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error: operator '+' requires numeric, String, or List types but got Result[Int, String] and Int
  --> /tmp/dojo-run-length-encoding-0.almd:9:31
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E005]: argument 'n' expects Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-0.almd:9:31
  in call to int.to_string()
  hint: Fix the argument type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-0.almd:9:36
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                                    ^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-0.almd:11:34
  in operator +
  hint: Use + with numeric types, String, or List
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-0.almd:11:34
  in call to list.fold()
  hint: Fix the argument type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-run-length-encoding-0.almd:21:57
  in call to string.slice()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
   |
21 |       let count = int.parse(string.slice(0, acc.len() + 1));
   |                                                         ^
error[E004]: string.repeat() expects 2 argument(s) but got 1
  --> /tmp/dojo-run-length-encoding-0.almd:22:27
  in call to string.repeat()
  hint: Check the number of arguments
   |
22 |       acc + string.repeat(count)
   |                           ^^^^^
error[E005]: argument 's' expects String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-0.almd:22:27
  in call to string.repeat()
  hint: Fix the argument type
   |
22 |       acc + string.repeat(count)
   |                           ^^^^^
error: operator '+' requires numeric, String, or List types but got fn() -> Int and String
  --> /tmp/dojo-run-length-encoding-0.almd:22:27
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |       acc + string.repeat(count)
   |                           ^^^^^
error: operator '+' requires numeric, String, or List types but got fn() -> Int and fn() -> ?4
  --> /tmp/dojo-run-length-encoding-0.almd:24:13
  in operator +
  hint: Use + with numeric types, String, or List
   |
24 |       acc + c
   |             ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(fn() -> Int, fn() -> ?4) -> fn() -> Int
  --> /tmp/dojo-run-length-encoding-0.almd:24:13
  in call to list.fold()
  hint: Fix the argument type
   |
24 |       acc + c
   |             ^
error[E001]: type mismatch in call to string.slice(): expected String but got Int
  --> /tmp/dojo-run-length-encoding-0.almd:8:59
  in call to string.slice()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error[E001]: type mismatch in call to int.to_string(): expected Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-0.almd:9:31
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-0.almd:11:34
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E001]: type mismatch in call to string.slice(): expected String but got Int
  --> /tmp/dojo-run-length-encoding-0.almd:21:57
  in call to string.slice()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
21 |       let count = int.parse(string.slice(0, acc.len() + 1));
   |                                                         ^
error[E001]: type mismatch in call to string.repeat(): expected String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-0.almd:22:27
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
22 |       acc + string.repeat(count)
   |                           ^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(fn() -> Int, fn() -> ?4) -> fn() -> Int
  --> /tmp/dojo-run-length-encoding-0.almd:24:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
24 |       acc + c
   |             ^

18 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = list.fold(string.chars(s), "", (acc, c) => {
    if acc == "" then {
      int.to_string(1) + c
    } else {
      let last = string.last(acc);
      if last == c then {
        let count = int.parse(string.slice(0, acc.len() - 1));
        int.to_string(count + 1) + last
      } else {
        acc + int.to_string(1) + c
      }
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = list.fold(string.chars(s), "", (acc, c) => {
    if c.is_digit() then {
      let count = int.parse(string.slice(0, acc.len()));
      acc + string.repeat(count)
    } else {
     امی acc + c
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error: Expected '}' to close block opened at line 23:12
  --> /tmp/dojo-run-length-encoding-1.almd:24:6
  hint: Add '}' or check for a missing delimiter inside the block
   |
23 |     } else {
   |            --------------- '{' opened here
...
24 |      امی acc + c
   |      ^
error: Expected '}' to close block opened at line 23:12 at line 24:6
  --> /tmp/dojo-run-length-encoding-1.almd:23:12
   |
23 |     } else {
   |            ^
error: Expected '}' to close block opened at line 19:60
  --> /tmp/dojo-run-length-encoding-1.almd:24:6
  hint: Add '}' or check for a missing delimiter inside the block
   |
19 |   let decoded = list.fold(string.chars(s), "", (acc, c) => {
   |                                                            --------------- '{' opened here
...
24 |      امی acc + c
   |      ^
error: Expected '}' to close block opened at line 19:60 at line 24:6
  --> /tmp/dojo-run-length-encoding-1.almd:19:60
   |
19 |   let decoded = list.fold(string.chars(s), "", (acc, c) => {
   |                                                            ^
error: Expected '}' to close block opened at line 18:38
  --> /tmp/dojo-run-length-encoding-1.almd:24:6
  hint: Add '}' or check for a missing delimiter inside the block
   |
18 | fn rle_decode(s: String) -> String = {
   |                                      --------------- '{' opened here
...
24 |      امی acc + c
   |      ^
error: Expected '}' to close block opened at line 18:38 at line 24:6
  --> /tmp/dojo-run-length-encoding-1.almd:18:38
   |
18 | fn rle_decode(s: String) -> String = {
   |                                      ^
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-run-length-encoding-1.almd:8:59
  in call to string.slice()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error: operator '+' requires numeric, String, or List types but got Result[Int, String] and Int
  --> /tmp/dojo-run-length-encoding-1.almd:9:31
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E005]: argument 'n' expects Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-1.almd:9:31
  in call to int.to_string()
  hint: Fix the argument type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:9:36
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                                    ^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:11:34
  in operator +
  hint: Use + with numeric types, String, or List
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-1.almd:11:34
  in call to list.fold()
  hint: Fix the argument type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E001]: type mismatch in call to string.slice(): expected String but got Int
  --> /tmp/dojo-run-length-encoding-1.almd:8:59
  in call to string.slice()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error[E001]: type mismatch in call to int.to_string(): expected Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-1.almd:9:31
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-1.almd:11:34
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^

15 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = list.fold(string.chars(s), "", (acc, c) => {
    if acc == "" then {
      int.to_string(1) + c
    } else {
      let last = string.last(acc);
      if last == c then {
        let count = int.parse(string.slice(0, acc.len() - 1));
        int.to_string(count + 1) + last
      } else {
        acc + int.to_string(1) + c
      }
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = list.fold(string.chars(s), "", (acc, c) => {
    if c.is_digit() then {
      let count = int.parse(string.slice(0, acc.len()));
      let repeat = string.repeat(int.parse(count));
      acc + repeat
    } else {
      acc + c
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-run-length-encoding-2.almd:8:59
  in call to string.slice()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error: operator '+' requires numeric, String, or List types but got Result[Int, String] and Int
  --> /tmp/dojo-run-length-encoding-2.almd:9:31
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E005]: argument 'n' expects Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:9:31
  in call to int.to_string()
  hint: Fix the argument type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:9:36
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                                    ^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-2.almd:11:34
  in operator +
  hint: Use + with numeric types, String, or List
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-2.almd:11:34
  in call to list.fold()
  hint: Fix the argument type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-run-length-encoding-2.almd:21:45
  in call to string.slice()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
   |
21 |       let count = int.parse(string.slice(0, acc.len()));
   |                                             ^^^
error[E005]: argument 's' expects String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:22:44
  in call to int.parse()
  hint: Fix the argument type
   |
22 |       let repeat = string.repeat(int.parse(count));
   |                                            ^^^^^
error[E004]: string.repeat() expects 2 argument(s) but got 1
  --> /tmp/dojo-run-length-encoding-2.almd:22:44
  in call to string.repeat()
  hint: Check the number of arguments
   |
22 |       let repeat = string.repeat(int.parse(count));
   |                                            ^^^^^
error[E005]: argument 's' expects String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:22:44
  in call to string.repeat()
  hint: Fix the argument type
   |
22 |       let repeat = string.repeat(int.parse(count));
   |                                            ^^^^^
error: operator '+' requires numeric, String, or List types but got fn() -> Int and String
  --> /tmp/dojo-run-length-encoding-2.almd:23:13
  in operator +
  hint: Use + with numeric types, String, or List
   |
23 |       acc + repeat
   |             ^^^^^^
error: operator '+' requires numeric, String, or List types but got fn() -> Int and fn() -> ?4
  --> /tmp/dojo-run-length-encoding-2.almd:25:13
  in operator +
  hint: Use + with numeric types, String, or List
   |
25 |       acc + c
   |             ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(fn() -> Int, fn() -> ?4) -> fn() -> Int
  --> /tmp/dojo-run-length-encoding-2.almd:25:13
  in call to list.fold()
  hint: Fix the argument type
   |
25 |       acc + c
   |             ^
error[E001]: type mismatch in call to string.slice(): expected String but got Int
  --> /tmp/dojo-run-length-encoding-2.almd:8:59
  in call to string.slice()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error[E001]: type mismatch in call to int.to_string(): expected Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:9:31
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-2.almd:11:34
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E001]: type mismatch in call to string.slice(): expected String but got Int
  --> /tmp/dojo-run-length-encoding-2.almd:21:45
  in call to string.slice()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
21 |       let count = int.parse(string.slice(0, acc.len()));
   |                                             ^^^
error[E001]: type mismatch in call to int.parse(): expected String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:22:44
  in call to int.parse()
  hint: Fix the expression type or change the expected type
   |
22 |       let repeat = string.repeat(int.parse(count));
   |                                            ^^^^^
error[E001]: type mismatch in call to string.repeat(): expected String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:22:44
  in call to string.repeat()
  hint: Fix the expression type or change the expected type
   |
22 |       let repeat = string.repeat(int.parse(count));
   |                                            ^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(fn() -> Int, fn() -> ?4) -> fn() -> Int
  --> /tmp/dojo-run-length-encoding-2.almd:25:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
25 |       acc + c
   |             ^

20 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = list.fold(string.chars(s), "", (acc, c) => {
    if acc == "" then {
      int.to_string(1) + c
    } else {
      let last = string.last(acc);
      if last == c then {
        let count = int.parse(string.slice(0, acc.len() - 1));
        int.to_string(count + 1) + last
      } else {
        acc + int.to_string(1) + c
      }
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = list.fold(string.chars(s), "", (acc, c) => {
    if c.is_digit() then {
      let count = int.parse(string.slice(0, acc.len()));
      list.fold(list.range(0, int.parse(count)), "", (acc, _) => acc + c)
    } else {
      acc + c
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-run-length-encoding-3.almd:8:59
  in call to string.slice()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error: operator '+' requires numeric, String, or List types but got Result[Int, String] and Int
  --> /tmp/dojo-run-length-encoding-3.almd:9:31
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E005]: argument 'n' expects Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-3.almd:9:31
  in call to int.to_string()
  hint: Fix the argument type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:9:36
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |         int.to_string(count + 1) + last
  |                                    ^^^^
error: operator '+' requires numeric, String, or List types but got String and Option[String]
  --> /tmp/dojo-run-length-encoding-3.almd:11:34
  in operator +
  hint: Use + with numeric types, String, or List
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-3.almd:11:34
  in call to list.fold()
  hint: Fix the argument type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E005]: argument 's' expects String but got Int
  --> /tmp/dojo-run-length-encoding-3.almd:21:45
  in call to string.slice()
  hint: Fix the argument type. Or use `int.to_string(x)` to convert Int to String
   |
21 |       let count = int.parse(string.slice(0, acc.len()));
   |                                             ^^^
error[E005]: argument 's' expects String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-3.almd:22:41
  in call to int.parse()
  hint: Fix the argument type
   |
22 |       list.fold(list.range(0, int.parse(count)), "", (acc, _) => acc + c)
   |                                         ^^^^^
error[E005]: argument 'end' expects Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-3.almd:22:41
  in call to list.range()
  hint: Fix the argument type
   |
22 |       list.fold(list.range(0, int.parse(count)), "", (acc, _) => acc + c)
   |                                         ^^^^^
error: operator '+' requires numeric, String, or List types but got ?6 and fn() -> ?4
  --> /tmp/dojo-run-length-encoding-3.almd:22:72
  in operator +
  hint: Use + with numeric types, String, or List
   |
22 |       list.fold(list.range(0, int.parse(count)), "", (acc, _) => acc + c)
   |                                                                        ^
error: operator '+' requires numeric, String, or List types but got fn() -> Int and fn() -> ?4
  --> /tmp/dojo-run-length-encoding-3.almd:24:13
  in operator +
  hint: Use + with numeric types, String, or List
   |
24 |       acc + c
   |             ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(String, fn() -> ?4) -> String
  --> /tmp/dojo-run-length-encoding-3.almd:24:13
  in call to list.fold()
  hint: Fix the argument type
   |
24 |       acc + c
   |             ^
error[E001]: type mismatch in call to string.slice(): expected String but got Int
  --> /tmp/dojo-run-length-encoding-3.almd:8:59
  in call to string.slice()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
  |
8 |         let count = int.parse(string.slice(0, acc.len() - 1));
  |                                                           ^
error[E001]: type mismatch in call to int.to_string(): expected Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-3.almd:9:31
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
  |
9 |         int.to_string(count + 1) + last
  |                               ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(String, Option[String]) -> String
  --> /tmp/dojo-run-length-encoding-3.almd:11:34
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
11 |         acc + int.to_string(1) + c
   |                                  ^
error[E001]: type mismatch in call to string.slice(): expected String but got Int
  --> /tmp/dojo-run-length-encoding-3.almd:21:45
  in call to string.slice()
  hint: Fix the expression type or change the expected type. Or use `int.to_string(x)` to convert Int to String
   |
21 |       let count = int.parse(string.slice(0, acc.len()));
   |                                             ^^^
error[E001]: type mismatch in call to int.parse(): expected String but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-3.almd:22:41
  in call to int.parse()
  hint: Fix the expression type or change the expected type
   |
22 |       list.fold(list.range(0, int.parse(count)), "", (acc, _) => acc + c)
   |                                         ^^^^^
error[E001]: type mismatch in call to list.range(): expected Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-3.almd:22:41
  in call to list.range()
  hint: Fix the expression type or change the expected type
   |
22 |       list.fold(list.range(0, int.parse(count)), "", (acc, _) => acc + c)
   |                                         ^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(String, fn() -> ?4) -> String
  --> /tmp/dojo-run-length-encoding-3.almd:24:13
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
24 |       acc + c
   |             ^

19 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
