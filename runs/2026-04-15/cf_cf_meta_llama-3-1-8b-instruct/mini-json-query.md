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
    list.find(xs, fn (k, v) =>
      match k
      | Some(k) =>
        if k == key then some(v) else none
        else none
    )
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, fn x => jcount(x))
  | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:22 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:12:22
   |
12 |     list.find(xs, fn (k, v) =>
   |                      ^
error: Expected LBrace at line 22:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:22:3
   |
22 |   | JNull => 1
   |   ^
error: Expected LParen at line 26:35 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-0.almd:26:35
   |
26 |   | JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                                   ^
error: Expected function name at line 27:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:27:42
   |
27 |   | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)
   |                                          ^
error: Expected LParen at line 27:69 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-0.almd:27:69
   |
27 |   | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)
   |                                                                     ^
error: Expected LBrace at line 31:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:31:3
   |
31 |   | JStr(s) => [s]
   |   ^

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
  match obj
  | JObj(xs) =>
    list.find(xs, fn (k, v) =>
      match k
      | Some(k) =>
        if k == key then some(v) else none
      | _ => none
    )
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, fn x => jcount(x))
  | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:22 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:12:22
   |
12 |     list.find(xs, fn (k, v) =>
   |                      ^
error: Expected LBrace at line 22:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:22:3
   |
22 |   | JNull => 1
   |   ^
error: Expected LParen at line 26:35 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-1.almd:26:35
   |
26 |   | JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                                   ^
error: Expected function name at line 27:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:27:42
   |
27 |   | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)
   |                                          ^
error: Expected LParen at line 27:69 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-1.almd:27:69
   |
27 |   | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)
   |                                                                     ^
error: Expected LBrace at line 31:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:31:3
   |
31 |   | JStr(s) => [s]
   |   ^

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
  match obj
  | JObj(xs) =>
    list.find(xs, fn (k, v) =>
      match k
      | Some(k) =>
        if k == key then some(v) else none
      | _ => none
    )
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.fold(xs, 0, fn (acc, x) => acc + jcount(x))
  | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:22 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:12:22
   |
12 |     list.find(xs, fn (k, v) =>
   |                      ^
error: Expected LBrace at line 22:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:22:3
   |
22 |   | JNull => 1
   |   ^
error: Expected function name at line 26:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:26:37
   |
26 |   | JArr(xs) => list.fold(xs, 0, fn (acc, x) => acc + jcount(x))
   |                                     ^
error: Expected function name at line 27:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:27:42
   |
27 |   | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)
   |                                          ^
error: Expected LParen at line 27:69 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-2.almd:27:69
   |
27 |   | JObj(_) => list.sum(list.map(val, fn (k, v) => jcount(v)), fn x => x)
   |                                                                     ^
error: Expected LBrace at line 31:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:31:3
   |
31 |   | JStr(s) => [s
   |   ^

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
  match obj
  | JObj(xs) =>
    list.find(xs, fn (k, v) =>
      match k
      | Some(k) =>
        if k == key then some(v) else none
      | _ => none
    )
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.fold(xs, 0, fn (acc, x) => acc + jcount(x))
  | JObj(xs) => list.sum(list.map(xs, fn (k, v) => jcount(v)), fn x => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:22 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:12:22
   |
12 |     list.find(xs, fn (k, v) =>
   |                      ^
error: Expected LBrace at line 22:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:22:3
   |
22 |   | JNull => 1
   |   ^
error: Expected function name at line 26:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:26:37
   |
26 |   | JArr(xs) => list.fold(xs, 0, fn (acc, x) => acc + jcount(x))
   |                                     ^
error: Expected function name at line 27:42 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:27:42
   |
27 |   | JObj(xs) => list.sum(list.map(xs, fn (k, v) => jcount(v)), fn x => x)
   |                                          ^
error: Expected LParen at line 27:69 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:27:69
   |
27 |   | JObj(xs) => list.sum(list.map(xs, fn (k, v) => jcount(v)), fn x => x)
   |                                                                     ^
error: Expected LBrace at line 31:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:31:3
   |
31 |   | JStr(s) => [
   |   ^

7 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
