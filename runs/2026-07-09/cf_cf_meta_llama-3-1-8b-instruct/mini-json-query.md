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
    JObj(xs) => xs.find({ (k, v) => k == key }).map(|(_, v)| v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => xs.sum(jcount)
    JObj(xs) => xs.sum({ (k, v) => jcount(v) })
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => xs.flat_map(jflatten_strings)
    JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 11:53 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:11:53
   |
11 |     JObj(xs) => xs.find({ (k, v) => k == key }).map(|(_, v)| v)
   |                                                     ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:26:17
  in call to list.flat_map()
  hint: Fix the argument type
   |
26 |     JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
   |                 ^^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:26:17
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
26 |     JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
   |                 ^^

4 error(s) found
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
    JObj(xs) => xs.find({ (k, v) => k == key }).map(|(_, v)| v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => xs.sum(jcount)
    JObj(xs) => xs.fold(0, (acc, (k, v)) => acc + jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => xs.flat_map(jflatten_strings)
    JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 11:53 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:53
   |
11 |     JObj(xs) => xs.find({ (k, v) => k == key }).map(|(_, v)| v)
   |                                                     ^
error: Expected FatArrow at line 17:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:17:11
   |
17 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-1.almd:26:17
  in call to list.flat_map()
  hint: Fix the argument type
   |
26 |     JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
   |                 ^^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-1.almd:26:17
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
26 |     JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
   |                 ^^

4 error(s) found
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
      match xs.find({ (k, v) => k == key }) {
        some((_, v)) => some(v)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
    _ => []
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:33:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:13
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs.find({ (k, v) => k == key }) {
   |             ^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-2.almd:12:13
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs.find({ (k, v) => k == key }) {
   |             ^^

4 error(s) found
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
      match xs.find({ (k, v) => k == key }) {
        some((k, v)) => some(v)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ (k, v) => jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
    _ =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 21:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:21:11
   |
21 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:33:1
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:13
  in call to list.find()
  hint: Fix the argument type
   |
12 |       match xs.find({ (k, v) => k == key }) {
   |             ^^
error[E001]: type mismatch in call to list.find(): expected fn((String, JVal)) -> Bool but got fn(String, ?1) -> Bool
  --> /tmp/dojo-mini-json-query-3.almd:12:13
  in call to list.find()
  hint: Fix the expression type or change the expected type
   |
12 |       match xs.find({ (k, v) => k == key }) {
   |             ^^

4 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
