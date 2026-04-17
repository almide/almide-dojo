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
    JObj(pairs) => list.find(pairs, (x) => x.0 == key) |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected ')' to close function call opened at line 29:33
  --> /tmp/dojo-mini-json-query-0.almd:31:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |     JObj(pairs) => list.flat_map(pairs
   |                                 --------------- '(' opened here
...
31 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

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
    JObj(pairs) => list.find(pairs, (x) => x.0 == key) |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs, (x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected ')' to close parenthesized expression opened at line 29:41
  --> /tmp/dojo-mini-json-query-1.almd:29:43
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
29 |     JObj(pairs) => list.flat_map(pairs, (x
   |                                         --------------- '(' opened here
   |
29 |     JObj(pairs) => list.flat_map(pairs, (x
   |                                           ^

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
    JObj(pairs) => list.find(pairs, (x) => x.0 == key) |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs, (x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected ')' to close parenthesized expression opened at line 29:41
  --> /tmp/dojo-mini-json-query-2.almd:29:43
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
29 |     JObj(pairs) => list.flat_map(pairs, (x
   |                                         --------------- '(' opened here
   |
29 |     JObj(pairs) => list.flat_map(pairs, (x
   |                                           ^

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
    JObj(pairs) => list.find(pairs, (x) => x.0 == key) |> option.map((x) => x.1)
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
    JObj(pairs) => list.flat_map(pairs, (x
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected ')' to close parenthesized expression opened at line 29:41
  --> /tmp/dojo-mini-json-query-3.almd:29:43
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
29 |     JObj(pairs) => list.flat_map(pairs, (x
   |                                         --------------- '(' opened here
   |
29 |     JObj(pairs) => list.flat_map(pairs, (x
   |                                           ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
