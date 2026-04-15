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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |> Option.map(| (_, v) | v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> Option.map(| (_, v) | v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> Option.map(| (_, v) | v)
   |                                  ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 19:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:19:33
   |
19 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 26:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:26:35
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 26:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:26:38
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                      ^

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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> Option.map(| (_, v) | v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> Option.map(| (_, v) | v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> Option.map(| (_, v) | v)
   |                                  ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 19:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:19:33
   |
19 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 26:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:26:35
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 26:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:26:38
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                      ^

6 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> some(| (_, v) | v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> some(| (_, v) | v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> some(| (_, v) | v)
   |                                  ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 19:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:19:33
   |
19 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 26:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:26:35
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 26:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:26:38
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                      ^

6 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> some(v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs, jcount)
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> some(v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |-> some(v)
   |                                  ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 19:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:19:33
   |
19 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 26:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:26:35
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                   ^
error: Expected function name at line 26:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:26:38
   |
26 |     JObj(xs) => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                      ^

6 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
