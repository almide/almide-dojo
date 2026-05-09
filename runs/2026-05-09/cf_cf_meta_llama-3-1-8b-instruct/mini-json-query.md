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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map(x => x.1)
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

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-mini-json-query-0.almd:11:56
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key).map(x => x.1)
   |                                                        ^^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^

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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map(x => x.1)
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
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-mini-json-query-1.almd:11:56
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key).map(x => x.1)
   |                                                        ^^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^

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
    JObj(xs) => list.find(xs, (x) => x.0 == key).map(|x| x.1)
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

effect fn main
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: '|x|' closure syntax is not valid in Almide at line 11:54
  --> /tmp/dojo-mini-json-query-2.almd:11:54
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key).map(|x| x.1)
   |                                                      ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected LParen at line 30:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:30:15
   |
30 | effect fn main
   |               ^

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
  match obj {
    JObj(xs) => list.find(xs, (x) => x.0 == key).map(|x| x.1)
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

effect fn main
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: '|x|' closure syntax is not valid in Almide at line 11:54
  --> /tmp/dojo-mini-json-query-3.almd:11:54
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
11 |     JObj(xs) => list.find(xs, (x) => x.0 == key).map(|x| x.1)
   |                                                      ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected LParen at line 30:15 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:30:15
   |
30 | effect fn main
   |               ^

3 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
