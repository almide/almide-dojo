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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 29:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:29:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 30:10 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:30:10
   |
30 | effect fn
   |          ^

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
    JObj(xs) => option.some(list.find(xs, (x) => x.0 == key).map((x) => x.1))
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected name at line 11:24 (got Some 'some')
  --> /tmp/dojo-mini-json-query-2.almd:11:24
   |
11 |     JObj(xs) => option.some(list.find(xs, (x) => x.0 == key).map((x) => x.1))
   |                        ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^

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
    JObj(xs) => option.some(list.find(xs, (x) => x.0 == key).map((x) => x.1))
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, (x) => jcount(x))
    JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected name at line 11:24 (got Some 'some')
  --> /tmp/dojo-mini-json-query-3.almd:11:24
   |
11 |     JObj(xs) => option.some(list.find(xs, (x) => x.0 == key).map((x) => x.1))
   |                        ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^

2 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
