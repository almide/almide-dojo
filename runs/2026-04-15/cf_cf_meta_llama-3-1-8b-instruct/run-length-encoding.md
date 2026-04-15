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
  let encoded = string.chars(s).fold("", (acc, c) => {
    if string.chars(acc).isEmpty() then
      acc + "1" + c
    else {
      let last = string.chars(acc).last();
      if last == Some(c) then
        acc + string.int_to_string(string.int_parse(acc.last().unwrap()).unwrap() + 1)
      else
        acc + "1" + c
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    if string.chars(c).is_empty() then
      acc
    else {
      let count = string.int_parse(string.chars(c).first().unwrap());
      match count {
        ok(n) => acc + string.chars(c).skip(1).take(n).fold("", (acc, _) => acc + _),
        err(_) => acc
      }
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-0.almd
error[E002]: undefined method 'isEmpty' on list
  --> /tmp/dojo-run-length-encoding-0.almd:3:21
  in method call .isEmpty()
  hint: Almide doesn't use method-call syntax. Write `list.is_empty(x)` (or `x |> list.is_empty`). Method syntax `x.isEmpty()` is not supported.
  |
3 |     if string.chars(acc).isEmpty() then
  |                     ^^^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-0.almd:8:53
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
  |
8 |         acc + string.int_to_string(string.int_parse(acc.last().unwrap()).unwrap() + 1)
  |                                                     ^^^
error[E002]: undefined function 'string.int_parse'
  --> /tmp/dojo-run-length-encoding-0.almd:8:53
  in call to string.int_parse()
  hint: No function 'int_parse' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
8 |         acc + string.int_to_string(string.int_parse(acc.last().unwrap()).unwrap() + 1)
  |                                                     ^^^
error[E002]: undefined function 'string.int_to_string'
  --> /tmp/dojo-run-length-encoding-0.almd:8:85
  in call to string.int_to_string()
  hint: No function 'int_to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
8 |         acc + string.int_to_string(string.int_parse(acc.last().unwrap()).unwrap() + 1)
  |                                                                                     ^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-0.almd:21:49
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
21 |       let count = string.int_parse(string.chars(c).first().unwrap());
   |                                                 ^
error[E002]: undefined function 'string.int_parse'
  --> /tmp/dojo-run-length-encoding-0.almd:21:49
  in call to string.int_parse()
  hint: No function 'int_parse' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
21 |       let count = string.int_parse(string.chars(c).first().unwrap());
   |                                                 ^
error[E002]: undefined method 'skip' on list
  --> /tmp/dojo-run-length-encoding-0.almd:23:37
  in method call .skip()
  hint: Almide doesn't use method-call syntax. Write `list.swap(x)` (or `x |> list.swap`). Method syntax `x.skip()` is not supported.
   |
23 |         ok(n) => acc + string.chars(c).skip(1).take(n).fold("", (acc, _) => acc + _),
   |                                     ^

7 error(s) found
Compile error for /tmp/dojo-run-length-encoding-0.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold("", (acc, c) => {
    if list.is_empty(acc) then
      acc + "1" + c
    else {
      let last = list.last(acc);
      if last == Some(c) then
        acc + int.to_string(int.parse(acc.last().unwrap()) + 1)
      else
        acc + "1" + c
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    if list.is_empty(c) then
      acc
    else {
      let count = int.parse(string.chars(c).first());
      match count {
        ok(n) => acc + list.take(string.chars(c).skip(1), n).fold("", (acc, _) => acc + _),
        err(_) => acc
      }
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-1.almd
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-run-length-encoding-1.almd:8:39
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
  |
8 |         acc + int.to_string(int.parse(acc.last().unwrap()) + 1)
  |                                       ^^^
error: operator '+' requires numeric, String, or List types but got Result[Int, String] and Int
  --> /tmp/dojo-run-length-encoding-1.almd:8:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
8 |         acc + int.to_string(int.parse(acc.last().unwrap()) + 1)
  |                                                              ^
error[E005]: argument 'n' expects Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-1.almd:8:62
  in call to int.to_string()
  hint: Fix the argument type
  |
8 |         acc + int.to_string(int.parse(acc.last().unwrap()) + 1)
  |                                                              ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(List[A], ?3) -> List[A]
  --> /tmp/dojo-run-length-encoding-1.almd:2:30
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   let encoded = string.chars(s).fold("", (acc, c) => {
  |                              ^
error[E005]: argument 's' expects String but got List[A]
  --> /tmp/dojo-run-length-encoding-1.almd:21:42
  in call to string.chars()
  hint: Fix the argument type
   |
21 |       let count = int.parse(string.chars(c).first());
   |                                          ^
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:21:42
  in call to int.parse()
  hint: Fix the argument type
   |
21 |       let count = int.parse(string.chars(c).first());
   |                                          ^
error[E002]: undefined method 'skip' on list
  --> /tmp/dojo-run-length-encoding-1.almd:23:47
  in method call .skip()
  hint: Almide doesn't use method-call syntax. Write `list.swap(x)` (or `x |> list.swap`). Method syntax `x.skip()` is not supported.
   |
23 |         ok(n) => acc + list.take(string.chars(c).skip(1), n).fold("", (acc, _) => acc + _),
   |                                               ^
error[E001]: type mismatch in call to int.to_string(): expected Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-1.almd:8:62
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
  |
8 |         acc + int.to_string(int.parse(acc.last().unwrap()) + 1)
  |                                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(List[A], ?3) -> List[A]
  --> /tmp/dojo-run-length-encoding-1.almd:2:30
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   let encoded = string.chars(s).fold("", (acc, c) => {
  |                              ^
error[E001]: type mismatch in call to int.parse(): expected String but got Option[String]
  --> /tmp/dojo-run-length-encoding-1.almd:21:42
  in call to int.parse()
  hint: Fix the expression type or change the expected type
   |
21 |       let count = int.parse(string.chars(c).first());
   |                                          ^

10 error(s) found
Compile error for /tmp/dojo-run-length-encoding-1.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold("", (acc, c) => {
    if list.is_empty(acc) then
      acc + "1" + c
    else {
      let last = list.last(acc);
      if last == Some(c) then
        match acc {
          some(x) => x + int.to_string(int.parse(x.last().unwrap()) + 1),
          none => acc
        }
      else
        acc + "1" + c
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    if list.is_empty(c) then
      acc
    else {
      let count = match list.take(string.chars(c).skip(1), 1) {
        some(x) => x,
        none => ""
      };
      match int.parse(count) {
        ok(n) => acc + list.take(string.chars(c).skip휴(1), n).fold("", (acc, _) => acc + _),
        err(_) => acc
      }
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-2.almd
error: Expected ')' to close function call opened at line 29:33
  --> /tmp/dojo-run-length-encoding-2.almd:29:54
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |         ok(n) => acc + list.take(string.chars(c).skip휴(1), n).fold("", (acc, _) => acc + _),
   |                                 --------------- '(' opened here
   |
29 |         ok(n) => acc + list.take(string.chars(c).skip휴(1), n).fold("", (acc, _) => acc + _),
   |                                                      ^
error: Expected ')' to close function call opened at line 29:33 at line 29:54
  --> /tmp/dojo-run-length-encoding-2.almd:29:33
   |
29 |         ok(n) => acc + list.take(string.chars(c).skip휴(1), n).fold("", (acc, _) => acc + _),
   |                                 ^
error: Expected '}' to close block opened at line 23:10
  --> /tmp/dojo-run-length-encoding-2.almd:29:54
  hint: Add '}' or check for a missing delimiter inside the block
   |
23 |     else {
   |          --------------- '{' opened here
...
29 |         ok(n) => acc + list.take(string.chars(c).skip휴(1), n).fold("", (acc, _) => acc + _),
   |                                                      ^
error: Expected '}' to close block opened at line 23:10 at line 29:54
  --> /tmp/dojo-run-length-encoding-2.almd:23:10
   |
23 |     else {
   |          ^
error: Expected '}' to close block opened at line 20:54
  --> /tmp/dojo-run-length-encoding-2.almd:29:54
  hint: Add '}' or check for a missing delimiter inside the block
   |
20 |   let decoded = string.chars(s).fold("", (acc, c) => {
   |                                                      --------------- '{' opened here
...
29 |         ok(n) => acc + list.take(string.chars(c).skip휴(1), n).fold("", (acc, _) => acc + _),
   |                                                      ^
error: Expected '}' to close block opened at line 20:54 at line 29:54
  --> /tmp/dojo-run-length-encoding-2.almd:20:54
   |
20 |   let decoded = string.chars(s).fold("", (acc, c) => {
   |                                                      ^
error: Expected '}' to close block opened at line 19:38
  --> /tmp/dojo-run-length-encoding-2.almd:29:54
  hint: Add '}' or check for a missing delimiter inside the block
   |
19 | fn rle_decode(s: String) -> String = {
   |                                      --------------- '{' opened here
...
29 |         ok(n) => acc + list.take(string.chars(c).skip휴(1), n).fold("", (acc, _) => acc + _),
   |                                                      ^
error: operator '+' requires numeric, String, or List types but got Result[Int, String] and Int
  --> /tmp/dojo-run-length-encoding-2.almd:9:71
  in operator +
  hint: Use + with numeric types, String, or List
  |
9 |           some(x) => x + int.to_string(int.parse(x.last().unwrap()) + 1),
  |                                                                       ^
error[E005]: argument 'n' expects Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:9:71
  in call to int.to_string()
  hint: Fix the argument type
  |
9 |           some(x) => x + int.to_string(int.parse(x.last().unwrap()) + 1),
  |                                                                       ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(String, ?3) -> List[A]
  --> /tmp/dojo-run-length-encoding-2.almd:2:30
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   let encoded = string.chars(s).fold("", (acc, c) => {
  |                              ^
error[E001]: type mismatch in call to int.to_string(): expected Int but got Result[Int, String]
  --> /tmp/dojo-run-length-encoding-2.almd:9:71
  in call to int.to_string()
  hint: Fix the expression type or change the expected type
  |
9 |           some(x) => x + int.to_string(int.parse(x.last().unwrap()) + 1),
  |                                                                       ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(Unknown, String) -> List[A]
  --> /tmp/dojo-run-length-encoding-2.almd:2:30
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   let encoded = string.chars(s).fold("", (acc, c) => {
  |                              ^

12 error(s) found
Compile error for /tmp/dojo-run-length-encoding-2.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn rle_encode(s: String) -> String = {
  let encoded = string.chars(s).fold("", (acc, c) => {
    if list.is_empty(acc) then
      acc + "1" + c
    else {
      let last = list.last(acc);
      if last == Some(c) then
        match acc {
          some(x) => x + int.to_string(int.parse(x.last().unwrap()).unwrap() + 1),
          none => acc
        }
      else
        acc + "1" + c
    }
  });
  encoded
}

fn rle_decode(s: String) -> String = {
  let decoded = string.chars(s).fold("", (acc, c) => {
    if list.is_empty(c) then
      acc
    else {
      let count = match list.take(string.chars(c).skip(1), 1) {
        some(x) => x,
        none => ""
      };
      match int.parse(count) {
        ok(n) => acc + list.take(string.chars(c).skip(1), n).fold("", (acc, _) => acc + _),
        err(_) => acc
      }
    }
  });
  decoded
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-run-length-encoding-3.almd
error[E002]: undefined method 'unwrap' on result
  --> /tmp/dojo-run-length-encoding-3.almd:9:50
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `result.<fn>(x)` (or `x |> result.<fn>`) — there is no method `unwrap` on `result`. Run `almide explain E002` for examples.
  |
9 |           some(x) => x + int.to_string(int.parse(x.last().unwrap()).unwrap() + 1),
  |                                                  ^
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(String, ?3) -> List[A]
  --> /tmp/dojo-run-length-encoding-3.almd:2:30
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   let encoded = string.chars(s).fold("", (acc, c) => {
  |                              ^
error[E005]: argument 's' expects String but got List[A]
  --> /tmp/dojo-run-length-encoding-3.almd:24:48
  in call to string.chars()
  hint: Fix the argument type
   |
24 |       let count = match list.take(string.chars(c).skip(1), 1) {
   |                                                ^
error[E002]: undefined method 'skip' on list
  --> /tmp/dojo-run-length-encoding-3.almd:24:48
  in method call .skip()
  hint: Almide doesn't use method-call syntax. Write `list.swap(x)` (or `x |> list.swap`). Method syntax `x.skip()` is not supported.
   |
24 |       let count = match list.take(string.chars(c).skip(1), 1) {
   |                                                ^
error[E002]: undefined method 'skip' on list
  --> /tmp/dojo-run-length-encoding-3.almd:29:47
  in method call .skip()
  hint: Almide doesn't use method-call syntax. Write `list.swap(x)` (or `x |> list.swap`). Method syntax `x.skip()` is not supported.
   |
29 |         ok(n) => acc + list.take(string.chars(c).skip(1), n).fold("", (acc, _) => acc + _),
   |                                               ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(Unknown, String) -> List[A]
  --> /tmp/dojo-run-length-encoding-3.almd:2:30
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   let encoded = string.chars(s).fold("", (acc, c) => {
  |                              ^

6 error(s) found
Compile error for /tmp/dojo-run-length-encoding-3.almd:
compile failed
FAILED: /tmp/dojo-run-length-encoding-3.almd

1/1 test file(s) failed

```
