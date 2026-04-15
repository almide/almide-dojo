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
  match obj
  | JObj(xs) =>
    list.find(xs, (k, v) => k == key) >>= (k, v) => some(v)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, jcount)
  | JObj(xs) => list.sum(xs, (k, v) => jcount(v))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs) => list.flat_map(xs, (k, v
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:3
   |
17 |   | JNull => 1
   |   ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^

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
  match obj
  | JObj(xs) =>
    list.find(xs, (k, v) => k == key) >>= (k, v) => some(v)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, jcount)
  | JObj(xs) => list.sum(xs, (k, v) => jcount(v))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs) => list.flat_map(xs, (k, v) => jflatten
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:17:3
   |
17 |   | JNull => 1
   |   ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^

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
  match obj
  | JObj(xs) =>
    list.find(xs, (k, v) => k == key) >>= (k, v) => some(v)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, jcount)
  | JObj(xs) => list.sum(xs, (k, v) => jcount(v))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs) => list.flat_map(xs, (k, v) => jflatten
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:17:3
   |
17 |   | JNull => 1
   |   ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^

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
  match obj
  | JObj(xs) =>
    let found = list.find(xs, (k, v) => k == key)
    match found
    | some((k, v)) => some(v)
    | none => none
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, jcount)
  | JObj(xs) => list.sum(xs, (k, v) => jcount(v))

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, jflatten_strings)
  | JObj(xs
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected LBrace at line 20:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:20:3
   |
20 |   | JNull => 1
   |   ^
error: Expected LBrace at line 29:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:29:3
   |
29 |   | JStr(s) => [s]
   |   ^

3 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
