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
    JObj(xs) => xs
      .find({ (k, _) => k == key })
      .map({ (_, v) => v })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => xs.sum(jcount)
    JObj(xs) => xs.sum(jcount)
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
error: Expected pattern at line 12:7 (got Dot '.')
  --> /tmp/dojo-mini-json-query-0.almd:12:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       .find({ (k, _) => k == key })
   |       ^
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:28:17
  in call to list.flat_map()
  hint: Fix the argument type
   |
28 |     JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
   |                 ^^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:28:17
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
28 |     JObj(xs) => xs.flat_map({ (k, v) => jflatten_strings(v) })
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
    JObj(xs) => xs
      .find({ (k, _) => k == key })
      .map({ (_, v) => v })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map(jcount))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 12:7 (got Dot '.')
  --> /tmp/dojo-mini-json-query-1.almd:12:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       .find({ (k, _) => k == key })
   |       ^
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-1.almd:28:64
  in call to list.flat_map()
  hint: Fix the argument type
   |
28 |     JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
   |                                                                ^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-1.almd:28:64
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
28 |     JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
   |                                                                ^

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
    JObj(xs) => xs
      .find({ (k, _) => k == key })
      .map({ (_, v) => v })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ (_, v) => jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 12:7 (got Dot '.')
  --> /tmp/dojo-mini-json-query-2.almd:12:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       .find({ (k, _) => k == key })
   |       ^
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-2.almd:28:64
  in call to list.flat_map()
  hint: Fix the argument type
   |
28 |     JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
   |                                                                ^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-2.almd:28:64
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
28 |     JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
   |                                                                ^

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
    JObj(xs) => xs
      .find({ (k, _) => k == key })
      .map({ (_, v) => v })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.map({ (_, v) => jcount(v) }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 12:7 (got Dot '.')
  --> /tmp/dojo-mini-json-query-3.almd:12:7
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       .find({ (k, _) => k == key })
   |       ^
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-3.almd:28:64
  in call to list.flat_map()
  hint: Fix the argument type
   |
28 |     JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
   |                                                                ^
error[E001]: type mismatch in call to list.flat_map(): expected fn((String, JVal)) -> List[B] but got fn(?0, JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-3.almd:28:64
  in call to list.flat_map()
  hint: Fix the expression type or change the expected type
   |
28 |     JObj(xs) => list.flat_map(xs, { (k, v) => jflatten_strings(v) })
   |                                                                ^

4 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
