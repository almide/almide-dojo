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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, fn x => jcount(x))
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (_, v) => j
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                  ^
error: Expected function name at line 11:61 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:11:61
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                                             ^
error: Expected expression at line 21:30 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:21:30
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                              ^
error: Expected LParen at line 21:35 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-0.almd:21:35
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                                   ^
error: Expected function name at line 22:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:22:33
   |
22 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 29:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:29:35
   |
29 |     JObj(xs) => list.flat_map(xs, fn (_, v) => j
   |                                   ^
error: Expected function name at line 29:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:29:38
   |
29 |     JObj(xs) => list.flat_map(xs, fn (_, v) => j
   |                                      ^

8 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, fn x => jcount(x))
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                  ^
error: Expected function name at line 11:61 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:11:61
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                                             ^
error: Expected expression at line 21:30 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:21:30
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                              ^
error: Expected LParen at line 21:35 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-1.almd:21:35
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                                   ^
error: Expected function name at line 22:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:22:33
   |
22 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 29:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:29:35
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
   |                                   ^
error: Expected function name at line 29:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:29:38
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
   |                                      ^

8 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, fn x => jcount(x))
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                  ^
error: Expected function name at line 11:61 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:11:61
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                                             ^
error: Expected expression at line 21:30 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:21:30
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                              ^
error: Expected LParen at line 21:35 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-2.almd:21:35
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                                   ^
error: Expected function name at line 22:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:22:33
   |
22 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 29:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:29:35
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
   |                                   ^
error: Expected function name at line 29:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:29:38
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
   |                                      ^

8 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, fn x => jcount(x))
    JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                  ^
error: Expected function name at line 11:61 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:11:61
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) >>= fn (k, v) => some(v)
   |                                                             ^
error: Expected expression at line 21:30 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:21:30
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                              ^
error: Expected LParen at line 21:35 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:21:35
   |
21 |     JArr(xs) => list.sum(xs, fn x => jcount(x))
   |                                   ^
error: Expected function name at line 22:33 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:22:33
   |
22 |     JObj(xs) => list.sum(xs, fn (_, v) => jcount(v))
   |                                 ^
error: Expected expression at line 29:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:29:35
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
   |                                   ^
error: Expected function name at line 29:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:29:38
   |
29 |     JObj(xs) => list.flat_map(xs, fn (k, v) => jflatten_strings(v
   |                                      ^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
