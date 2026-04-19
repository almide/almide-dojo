# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
    JObj(pairs) =>
      list.find(pairs, (pair) => string.equals(pair.0, key))
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(children) =>
      list.map(children, jcount) |> list.sum
    JObj(pairs) =>
      list.map(pairs, (pair) => jcount(pair.1)) |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) =>
      list.flat_map(children, jflatten_strings)
    JObj(pairs) =>
      list.flat_map(pairs, (
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected FatArrow at line 19:11 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-0.almd:19:11
   |
19 |     JNull | JBool(_) | JNum(_) | JStr(_) => 1
   |           ^
error: Expected expression at line 32:29 (got Newline '')
  --> /tmp/dojo-mini-json-query-0.almd:32:29
   |
32 |       list.flat_map(pairs, (
   |                             ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-0.almd:12:56
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (pair) => string.equals(pair.0, key))
   |                                                        ^^^

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
    JObj(pairs) =>
      list.find(pairs, (pair) => string.equals(pair.0, key) == true)
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(children) =>
      list.map(children, jcount) |> list.sum
    JObj(pairs) =>
      list.map(pairs, (pair) => jcount(pair.1)) |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) =>
      list.flat_map(children, jflatten_strings)
    JObj(p
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected RParen at line 34:11 (got Newline '')
  --> /tmp/dojo-mini-json-query-1.almd:34:11
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
   |
34 |     JObj(p
   |           ^
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-1.almd:12:56
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (pair) => string.equals(pair.0, key) == true)
   |                                                        ^^^

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
    JObj(pairs) =>
      list.find(pairs, (pair) => pair.0 == key)
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(children) =>
      list.map(children, jcount) |> list.sum
    JObj(pairs) =>
      list.map(pairs, (pair) => jcount(pair.1)) |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) =>
      list.flat_map(children, jflatten_strings)
    JObj(pairs) =>
      list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 37:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:37:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

1 error(s) found
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
    JObj(pairs) =>
      list.find(pairs, (pair) => pair.0 == key)
        |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(children) =>
      list.map(children, jcount) |> list.sum
    JObj(pairs) =>
      list.map(pairs, (pair) => jcount(pair.1)) |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(children) =>
      list.flat_map(children, jflatten_strings)
    JObj(pairs) =>
      list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 37:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:37:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
37 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
