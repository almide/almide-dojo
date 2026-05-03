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
    JObj(fields) =>
      list.find(fields, (x) => string.equals(x.0, key))
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
    JObj(fields) => list.sum(list.map(fields, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(fields) => list.flat_map(fields, (x) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-0.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-0.almd:12:51
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(fields, (x) => string.equals(x.0, key))
   |                                                   ^^^

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
    JObj(fields) =>
      list.find(fields, (x) => string.equals(x.0, key) == true)
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
    JObj(fields) => list.sum(list.map(fields, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(fields) => list.flat_map(fields, (x) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-1.almd:12:51
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(fields, (x) => string.equals(x.0, key) == true)
   |                                                   ^^^

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
    JObj(fields) =>
      list.find(fields, (x) => string.equals(x.0, key) == true)
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
    JObj(fields) => list.sum(list.map(fields, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(fields) => list.flat_map(fields,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-2.almd:12:51
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(fields, (x) => string.equals(x.0, key) == true)
   |                                                   ^^^

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
    JObj(fields) =>
      list.find(fields, (x) => x.0 == key)
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
    JObj(fields) => list.sum(list.map(fields, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(fields) => list.flat_map(fields, (x) => jflatten_strings(x.
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected name at line 31:69 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:31:69
   |
31 |     JObj(fields) => list.flat_map(fields, (x) => jflatten_strings(x.
   |                                                                     ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
