# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
      list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-0.almd:12:31
  in call to string.equals()
  here: list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
   |                               ^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-mini-json-query-0.almd
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
      list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-1.almd:12:31
  in call to string.equals()
  here: list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
   |                               ^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-mini-json-query-1.almd
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
      list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-2.almd:12:31
  in call to string.equals()
  here: list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
   |                               ^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-mini-json-query-2.almd
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
      list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-mini-json-query-3.almd:12:31
  in call to string.equals()
  here: list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
   |
12 |       list.find(pairs, (x) => string.equals(x.0, key)).map((x) => x.1)
   |                               ^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-mini-json-query-3.almd
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
