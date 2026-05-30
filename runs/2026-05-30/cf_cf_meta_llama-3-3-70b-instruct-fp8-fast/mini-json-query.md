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
    JArr(xs) => 
      list.map(xs, jcount) 
      |> list.sum
    JObj(pairs) => 
      list.map(pairs, (x) => jcount(x.1)) 
      |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JNull => []
    JBool(_) => []
    JNum(_) => []
    J
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 36:6 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:36:6
   |
36 |     J
   |      ^

1 error(s) found
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
    JArr(xs) => 
      list.map(xs, jcount) 
      |> list.sum
    JObj(pairs) => 
      list.map(pairs, (x) => jcount(x.1)) 
      |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JNull => []
    JBool(_) => []
    JNum(_) => []
    JStr(s) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:38:1
   |
38 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

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
    JArr(xs) => 
      list.map(xs, jcount) 
      |> list.sum
    JObj(pairs) => 
      list.map(pairs, (x) => jcount(x.1)) 
      |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JNull => []
    JBool(_) => []
    JNum(_) => []
    JStr(s) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:38:1
   |
38 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

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
    JArr(xs) => 
      list.map(xs, jcount) 
      |> list.sum
    JObj(pairs) => 
      list.map(pairs, (x) => jcount(x.1)) 
      |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JNull => []
    JBool(_) => []
    JNum(_) => []
    JStr(s) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 38:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:38:1
   |
38 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
