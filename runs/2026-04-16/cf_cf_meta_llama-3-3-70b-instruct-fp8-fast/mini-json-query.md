# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
    JObj(pairs) =>
      list.find(pairs, (x) => x.0 == key)
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount), 0)
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)), 0)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:23:48
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
23 |     JArr(xs) => list.sum(list.map(xs, jcount), 0)
   |                                                ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:24:66
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
24 |     JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)), 0)
   |                                                                  ^

3 error(s) found
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
    JObj(pairs) =>
      list.find(pairs, (x) => x.0 == key)
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 31:33
  --> /tmp/dojo-mini-json-query-1.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |     JObj(pairs) => list.flat_map(pairs, (x)
   |                                 --------------- '(' opened here
...
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

1 error(s) found
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
    JObj(pairs) =>
      list.find(pairs, (x) => x.0 == key)
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close function call opened at line 31:33
  --> /tmp/dojo-mini-json-query-2.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |     JObj(pairs) => list.flat_map(pairs, (x)
   |                                 --------------- '(' opened here
...
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

1 error(s) found
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
    JObj(pairs) =>
      list.find(pairs, (x) => x.0 == key)
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 31:33
  --> /tmp/dojo-mini-json-query-3.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
31 |     JObj(pairs) => list.flat_map(pairs, (x)
   |                                 --------------- '(' opened here
...
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
