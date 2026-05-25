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
    list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
  | JObj(_) => list.sum(list.map(val, fn(x) => jcount(x)), fn(x) => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:21 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:12:21
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                     ^
error: Expected function name at line 12:56 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:12:56
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                                                        ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:3
   |
17 |   | JNull => 1
   |   ^
error: Expected function name at line 21:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:21:32
   |
21 |   | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
   |                                ^
error: Expected function name at line 22:41 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:22:41
   |
22 |   | JObj(_) => list.sum(list.map(val, fn(x) => jcount(x)), fn(x) => x)
   |                                         ^
error: Expected function name at line 22:62 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:22:62
   |
22 |   | JObj(_) => list.sum(list.map(val, fn(x) => jcount(x)), fn(x) => x)
   |                                                              ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^
error: Expected function name at line 27:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:27:37
   |
27 |   | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^

9 error(s) found
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
    list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
  | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:21 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:12:21
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                     ^
error: Expected function name at line 12:56 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:12:56
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                                                        ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:17:3
   |
17 |   | JNull => 1
   |   ^
error: Expected function name at line 21:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:21:32
   |
21 |   | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
   |                                ^
error: Expected function name at line 22:48 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:22:48
   |
22 |   | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)
   |                                                ^
error: Expected function name at line 22:69 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:22:69
   |
22 |   | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)
   |                                                                     ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^
error: Expected function name at line 27:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:27:37
   |
27 |   | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^

9 error(s) found
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
    list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
  | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:21 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:12:21
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                     ^
error: Expected function name at line 12:56 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:12:56
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                                                        ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:17:3
   |
17 |   | JNull => 1
   |   ^
error: Expected function name at line 21:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:21:32
   |
21 |   | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
   |                                ^
error: Expected function name at line 22:48 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:22:48
   |
22 |   | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)
   |                                                ^
error: Expected function name at line 22:69 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:22:69
   |
22 |   | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)
   |                                                                     ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^
error: Expected function name at line 27:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:27:37
   |
27 |   | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^

9 error(s) found
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
    list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
  | _ => none

fn jcount(val: JVal) -> Int =
  match val
  | JNull => 1
  | JBool(_) => 1
  | JNum(_) => 1
  | JStr(_) => 1
  | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
  | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)

fn jflatten_strings(val: JVal) -> List[String] =
  match val
  | JStr(s) => [s]
  | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected LBrace at line 11:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:11:3
   |
11 |   | JObj(xs) =>
   |   ^
error: Expected function name at line 12:21 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:12:21
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                     ^
error: Expected function name at line 12:56 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:12:56
   |
12 |     list.find(xs, fn(p) => p.0 == key) |> option.map(fn(p) => p.1)
   |                                                        ^
error: Expected LBrace at line 17:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:17:3
   |
17 |   | JNull => 1
   |   ^
error: Expected function name at line 21:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:21:32
   |
21 |   | JArr(xs) => list.sum(xs, fn(x) => jcount(x))
   |                                ^
error: Expected function name at line 22:48 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:22:48
   |
22 |   | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)
   |                                                ^
error: Expected function name at line 22:69 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:22:69
   |
22 |   | JObj(_) => list.sum(list.map(xs => xs.1, fn(x) => jcount(x)), fn(x) => x)
   |                                                                     ^
error: Expected LBrace at line 26:3 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:26:3
   |
26 |   | JStr(s) => [s]
   |   ^
error: Expected function name at line 27:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:27:37
   |
27 |   | JArr(xs) => list.flat_map(xs, fn(x) => jflatten_strings(x))
   |                                     ^

9 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
