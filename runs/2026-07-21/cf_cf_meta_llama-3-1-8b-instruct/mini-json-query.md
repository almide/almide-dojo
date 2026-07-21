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
    | JObj(xs) =>
      list.find(xs, (x) => match x {
        | (k, v) => if k == key then some(v) else none
        | _ => none
      })
    | _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    | JNull | JBool(_) | JNum(_) | JStr(_) => 1
    | JArr(xs) => list.sum(xs.map(jcount))
    | JObj(xs) => list.sum(xs.map((_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    | JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (k,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | JObj(xs) =>
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | JStr(s) => [s]
   |     ^

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
    | JObj(xs) =>
      list.find(xs, (x) => match x {
        | (k, v) => if k == key then some(v) else none
        | _ => none
      })
    | _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    | JNull | JBool(_) | JNum(_) | JStr(_) => 1
    | JArr(xs) => list.sum(xs.map(jcount))
    | JObj(xs) => list.sum(xs.map((_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    | JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (k, v) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | JObj(xs) =>
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | JStr(s) => [s]
   |     ^

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
    | JObj(xs) =>
      list.find(xs, (x) => match x {
        | (k, v) => if k == key then some(v) else none
        | _ => none
      })
    | _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    | JNull | JBool(_) | JNum(_) | JStr(_) => 1
    | JArr(xs) => list.sum(xs.map(jcount))
    | JObj(xs) => list.sum(xs.map((k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    | JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (k, v)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | JObj(xs) =>
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | JStr(s) => [s]
   |     ^

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
    | JObj(xs) =>
      list.find(xs, (x) => match x {
        | (k, v) => if k == key then some(v) else none
        | _ => none
      })
    | _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    | JNull | JBool(_) | JNum(_) | JStr(_) => 1
    | JArr(xs) => list.sum(xs.map(jcount))
    | JObj(xs) => list.sum(xs.map((k, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    | JStr(s) => [s]
    | JArr(xs) => list.flat_map(xs, jflatten_strings)
    | JObj(xs) => list.flat_map(xs, (k, v)
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 11:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:11:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     | JObj(xs) =>
   |     ^
error: Expected pattern at line 21:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:21:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     | JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |     ^
error: Expected pattern at line 28:5 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:28:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     | JStr(s) => [s]
   |     ^

3 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
