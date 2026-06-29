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
      list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
    _ => []
  }

effect fn main
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 12:21 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:12:21
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                     ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:12:24
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                        ^
error: Expected function name at line 12:51 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:12:51
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                                                   ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 20:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:20:36
   |
20 |     JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
   |                                    ^
error: Expected expression at line 27:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:27:35
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                   ^
error: Expected function name at line 27:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:27:38
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                      ^
error: Expected LParen at line 31:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:31:15
   |
31 | effect fn main
   |               ^

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
    JObj(xs) =>
      list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
    _ => []
  }

effect fn main() -> Unit
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 12:21 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:12:21
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                     ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:12:24
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                        ^
error: Expected function name at line 12:51 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:12:51
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                                                   ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 20:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:20:36
   |
20 |     JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
   |                                    ^
error: Expected expression at line 27:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:27:35
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                   ^
error: Expected function name at line 27:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:27:38
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                      ^

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
  match obj {
    JObj(xs) =>
      list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
    _ => []
  }

effect fn main() -> Unit
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 12:21 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:12:21
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                     ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:12:24
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                        ^
error: Expected function name at line 12:51 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:12:51
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                                                   ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 20:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:20:36
   |
20 |     JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
   |                                    ^
error: Expected expression at line 27:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:27:35
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                   ^
error: Expected function name at line 27:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:27:38
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                      ^

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
  match obj {
    JObj(xs) =>
      list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(fn (x) => jcount(x)))
    JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
    _ => []
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 12:21 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:12:21
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                     ^
error: Expected function name at line 12:24 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:12:24
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                        ^
error: Expected function name at line 12:51 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:12:51
   |
12 |       list.find(xs, fn (x) => x._1 == key) >>= fn (x) => some(x._2)
   |                                                   ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected function name at line 19:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:19:36
   |
19 |     JArr(xs) => list.sum(xs.map(fn (x) => jcount(x)))
   |                                    ^
error: Expected function name at line 20:36 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:20:36
   |
20 |     JObj(xs) => list.sum(xs.map(fn (x) => jcount(x._2)))
   |                                    ^
error: Expected expression at line 27:35 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:27:35
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                   ^
error: Expected function name at line 27:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:27:38
   |
27 |     JObj(xs) => list.flat_map(xs, fn (x) => jflatten_strings(x._2))
   |                                      ^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
