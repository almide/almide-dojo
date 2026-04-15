# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
    JObj(x) =>
      list.find(x, (x) => x.0 == key).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(arr) => list.sum(arr.map(jcount), 0)
    JObj(obj) =>
      list.sum(
        list.map(obj, (x) => jcount(x.1)),
        0
      )
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(arr) => list.flat_map(arr.map(jflatten_strings), (x) => x)
    JObj
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 34:9 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:34:9
   |
34 |     JObj
   |         ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:22:44
  in call to list.sum()
  hint: Check the number of arguments
   |
22 |     JArr(arr) => list.sum(arr.map(jcount), 0)
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:26:9
  in call to list.sum()
  hint: Check the number of arguments
   |
26 |         0
   |         ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:46:68
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:47:68
  in call to jflatten_strings()
  hint: Check the function name
   |
47 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:48:95
  in call to jflatten_strings()
  hint: Check the function name
   |
48 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:49:116
  in call to jflatten_strings()
  hint: Check the function name
   |
49 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:50:65
  in call to jflatten_strings()
  hint: Check the function name
   |
50 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

8 error(s) found
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
    JObj(x) =>
      list.find(x, (x) => x.0 == key).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(arr) => list.sum(list.map(arr, jcount))
    JObj(obj) =>
      list.sum(
        list.map(obj, (x) => jcount(x.1))
      )
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(arr) => list.flat_map(list.map(arr, jflatten_strings), (x) => x)
    JObj(obj) => list.flat_map(list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 33:31
  --> /tmp/dojo-mini-json-query-1.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
33 |     JObj(obj) => list.flat_map(list
   |                               --------------- '(' opened here
...
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error: Expected ')' to close function call opened at line 33:31 at line 35:1
  --> /tmp/dojo-mini-json-query-1.almd:33:31
   |
33 |     JObj(obj) => list.flat_map(list
   |                               ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:45:68
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:46:68
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:47:95
  in call to jflatten_strings()
  hint: Check the function name
   |
47 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:48:116
  in call to jflatten_strings()
  hint: Check the function name
   |
48 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:49:65
  in call to jflatten_strings()
  hint: Check the function name
   |
49 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

7 error(s) found
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
    JObj(x) =>
      list.find(x, (x) => x.0 == key).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(arr) => list.sum(list.map(arr, jcount))
    JObj(obj) =>
      list.sum(
        list.map(obj, (x) => jcount(x.1))
      )
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(arr) => list.flat_map(arr, jflatten_strings)
    JObj(obj) => list.flat_map(list.map(obj, (x) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close function call opened at line 33:40
  --> /tmp/dojo-mini-json-query-2.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
33 |     JObj(obj) => list.flat_map(list.map(obj, (x) => j
   |                                        --------------- '(' opened here
...
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error: Expected ')' to close function call opened at line 33:40 at line 35:1
  --> /tmp/dojo-mini-json-query-2.almd:33:40
   |
33 |     JObj(obj) => list.flat_map(list.map(obj, (x) => j
   |                                        ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:45:68
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:46:68
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:47:95
  in call to jflatten_strings()
  hint: Check the function name
   |
47 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:48:116
  in call to jflatten_strings()
  hint: Check the function name
   |
48 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:49:65
  in call to jflatten_strings()
  hint: Check the function name
   |
49 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

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
    JObj(x) =>
      list.find(x, (x) => x.0 == key).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(arr) => list.sum(list.map(arr, jcount))
    JObj(obj) =>
      list.sum(
        list.map(obj, (x) => jcount(x.1))
      )
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(arr) => list.flat_map(arr, jflatten_strings)
    JObj(obj) => list.flat_map(list.map(obj, (x) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close function call opened at line 33:40
  --> /tmp/dojo-mini-json-query-3.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
33 |     JObj(obj) => list.flat_map(list.map(obj, (x) => j
   |                                        --------------- '(' opened here
...
35 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error: Expected ')' to close function call opened at line 33:40 at line 35:1
  --> /tmp/dojo-mini-json-query-3.almd:33:40
   |
33 |     JObj(obj) => list.flat_map(list.map(obj, (x) => j
   |                                        ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:45:68
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:46:68
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:47:95
  in call to jflatten_strings()
  hint: Check the function name
   |
47 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:48:116
  in call to jflatten_strings()
  hint: Check the function name
   |
48 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:49:65
  in call to jflatten_strings()
  hint: Check the function name
   |
49 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
