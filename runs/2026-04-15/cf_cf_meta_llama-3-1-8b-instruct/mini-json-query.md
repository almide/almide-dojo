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
    JObj(xs) =>
      list.find(xs, (x) => x.0 == key)
      |> Option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main()
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected Arrow at line 32:17 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:32:17
   |
32 | effect fn main()
   |                 ^

2 error(s) found
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
    JObj(xs) =>
      list.find(xs, (x) => x.0 == key)
      |> Option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit =
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 34:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:34:1
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

2 error(s) found
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
    JObj(xs) =>
      list.find(xs, (x) => x.0 == key)
      |> Option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit =
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 34:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:34:1
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

2 error(s) found
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
    JObj(xs) =>
      list.find(xs, (x) => x.0 == key)
      |> Option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit =
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 34:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:34:1
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

2 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
