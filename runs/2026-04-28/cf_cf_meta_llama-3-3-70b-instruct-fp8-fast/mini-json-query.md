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
    JObj(kvs) =>
      list.find(kvs, (k, v) => k == key) |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(vals) => list.sum(list.map(vals, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(vals) => list.flat_map(vals, jflatten_strings)
    JObj(kvs) => list.flat_map(kvs, (_, v) => jflatten_strings(v))
    _ => []
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 30:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:30:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
30 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to list.find()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key) |> option.map((k, v) => v)
   |                                     ^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:12:66
  in call to option.map()
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key) |> option.map((k, v) => v)
   |                                                                  ^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:37
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key) |> option.map((k, v) => v)
   |                                     ^^^
error[E001]: type mismatch in call to option.map(): expected fn((String, JVal)) -> B but got fn(?2, ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:12:66
  in call to option.map()
  hint: Fix the expression type or change the expected type
   |
12 |       list.find(kvs, (k, v) => k == key) |> option.map((k, v) => v)
   |                                                                  ^

6 error(s) found
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
    JObj(kvs) =>
      list.find(kvs, (kv) => kv.0 == key) |> option.map((kv) => kv.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vals) => list.sum(list.map(vals, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(vals) => list.flat_map(vals, jflatten_strings)
    JObj(kvs) => list.flat_map(kvs, (_, v) => jflatten
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close function call opened at line 30:31
  --> /tmp/dojo-mini-json-query-1.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     JObj(kvs) => list.flat_map(kvs, (_, v) => jflatten
   |                               --------------- '(' opened here
...
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:23:58
  in call to list.map()
  hint: Fix the argument type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-1.almd:23:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^

3 error(s) found
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
    JObj(kvs) =>
      list.find(kvs, (kv) => kv.0 == key) |> option.map((kv) => kv.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vals) => list.sum(list.map(vals, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JNull => []
    JBool(_) => []
    JNum(_) => []
    JArr(vals) => list.flat_map(vals, jflatten_strings)
    J
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 33:6 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:33:6
   |
33 |     J
   |      ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:23:58
  in call to list.map()
  hint: Fix the argument type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^
error[E001]: type mismatch in call to list.map(): expected fn((String, JVal)) -> B but got fn(?4, JVal) -> Int
  --> /tmp/dojo-mini-json-query-2.almd:23:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
23 |     JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
   |                                                          ^

3 error(s) found
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
    JObj(kvs) =>
      list.find(kvs, (kv) => kv.0 == key) |> option.map((kv) => kv.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(vals) => list.sum(list.map(vals, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (kv) => jcount(kv.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JNull => []
    JBool(_) => []
    JNum(_) => []
    JArr(vals) => list.flat_map(vals, jflatten_strings)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 34:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:34:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
