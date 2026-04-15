# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |> map snd
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, fn x => jcount(x))
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
    _ =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> map snd
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> map snd
   |                                  ^
error: Expected expression at line 21:30 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:21:30
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                              ^
error: Expected LParen at line 21:35 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-0.almd:21:35
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                                   ^
error: Expected function name at line 22:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:22:33
   |
22 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 29:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:29:35
   |
29 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 29:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:29:38
   |
29 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                      ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
    _ => []
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
   |                                  ^
error: Expected expression at line 22:30 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:22:30
   |
22 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                              ^
error: Expected function name at line 22:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:22:33
   |
22 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 29:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:29:35
   |
29 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 29:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:29:38
   |
29 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                      ^

6 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, fn (k, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v))
    _ => []
  }

effect
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
   |                                  ^
error: Expected expression at line 22:30 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:22:30
   |
22 |     JObj(xs) => list.sum(xs, fn (k, v) => jcount(v))
   |                              ^
error: Expected function name at line 22:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:22:33
   |
22 |     JObj(xs) => list.sum(xs, fn (k, v) => jcount(v))
   |                                 ^
error: Expected expression at line 29:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:29:35
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 29:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:29:38
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v))
   |                                      ^
error: Expected Fn at line 33:7 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:33:7
   |
33 | effect
   |       ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
type JVal =
  | JNull
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, jcount)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, jflatten_strings)
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |? map snd
   |                                  ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:21:30
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E005]: argument 'xs' expects List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:30
  in call to list.sum()
  hint: Fix the argument type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:22:30
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
22 |     JObj(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E005]: argument 'xs' expects List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:30
  in call to list.sum()
  hint: Fix the argument type
   |
22 |     JObj(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-3.almd:29:35
  in call to list.flat_map()
  hint: Fix the argument type
   |
29 |     JObj(xs) => list.flat_map(xs, jflatten_strings)
   |                                   ^^^^^^^^^^^^^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:21:30
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
21 |     JArr(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:22:30
  in call to list.sum()
  hint: Fix the expression type or change the expected type
   |
22 |     JObj(xs) => list.sum(xs, jcount)
   |                              ^^^^^^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-3.almd:29:35
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
29 |     JObj(xs) => list.flat_map(xs, jflatten_strings)
   |                                   ^^^^^^^^^^^^^^^^

10 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
