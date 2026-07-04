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
    JObj(list) =>
      list.find { case (k, _) => k == key }.map { case (_, v) => v }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => xs.sum(jcount)
    JObj(list) => list.sum(jcount)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list([s])
    JArr(xs) => xs.flat_map(jflatten_strings)
    JObj(list) => list.flat_map { case (_, v) => jflatten_strings(v) }
    _ => list([])
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected pattern at line 12:17 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-0.almd:12:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       list.find { case (k, _) => k == key }.map { case (_, v) => v }
   |                 ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 27:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-0.almd:27:33
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     JObj(list) => list.flat_map { case (_, v) => jflatten_strings(v) }
   |                                 ^

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
  match obj {
    JObj(list) =>
      list.find { case (k, _) => k == key }.map { case (_, v) => v }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => xs.sum(jcount)
    JObj(list) => list.sum(jcount)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list([s])
    JArr(xs) => xs.flat_map(jflatten_strings)
    JObj(list) => list.flat_map { case (k, v) => jflatten_strings(v) }
    _ => list([])
  }

effect fn main() -> Unit =
  let _ = ()
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 12:17 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-1.almd:12:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       list.find { case (k, _) => k == key }.map { case (_, v) => v }
   |                 ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 27:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-1.almd:27:33
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     JObj(list) => list.flat_map { case (k, v) => jflatten_strings(v) }
   |                                 ^

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
  match obj {
    JObj(list) =>
      list.find { case (k, _) => k == key }.map { case (_, v) => v }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => xs.sum(jcount)
    JObj(list) => list.sum(jcount)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list([s])
    JArr(xs) => xs.flat_map(jflatten_strings)
    JObj(list) => list.flat_map { case (k, v) => jflatten_strings(v) }
    _ => list([])
  }

effect fn main() -> Unit =
  match jget(JObj([("a", JNum(1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 12:17 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-2.almd:12:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       list.find { case (k, _) => k == key }.map { case (_, v) => v }
   |                 ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 27:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-2.almd:27:33
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     JObj(list) => list.flat_map { case (k, v) => jflatten_strings(v) }
   |                                 ^
error: Expected ']' to close list literal opened at line 32:19
  --> /tmp/dojo-mini-json-query-2.almd:34:1
  hint: Add ']' or check for a missing delimiter inside the list literal
   |
32 |   match jget(JObj([("a", JNum(1))
   |                   --------------- '[' opened here
...
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^^^^

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
    JObj(list) =>
      list.find { case (k, v) => k == key }.map { case (_, v) => v }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => xs.fold(0, (acc, x) => acc + jcount(x))
    JObj(list) => list.fold(0, (acc, x) => acc + jcount(x))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list([s])
    JArr(xs) => xs.flat_map(jflatten_strings)
    JObj(list) => list.flat_map { case (k, v) => jflatten_strings(v) }
    _ => list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 12:17 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-3.almd:12:17
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |       list.find { case (k, v) => k == key }.map { case (_, v) => v }
   |                 ^
error: Expected FatArrow at line 18:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:18:11
   |
18 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected pattern at line 27:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-3.almd:27:33
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |     JObj(list) => list.flat_map { case (k, v) => jflatten_strings(v) }
   |                                 ^

3 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
