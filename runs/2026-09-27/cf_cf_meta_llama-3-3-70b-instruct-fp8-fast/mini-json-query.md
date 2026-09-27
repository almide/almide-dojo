# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

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
      list.find(pairs, (k, v) => k == key) |> option.map((k, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list.flat_map(pairs, (_, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal), ?1) -> Bool
  --> /tmp/dojo-mini-json-query-0.almd:12:24
  in call to list.find()
  here: list.find(pairs, (k, v) => k == key) |> option.map((k, v) => v)
  hint: Fix the argument type
...
12 |       list.find(pairs, (k, v) => k == key) |> option.map((k, v) => v)
   |                        ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn((String, JVal), ?3) -> ?3
  --> /tmp/dojo-mini-json-query-0.almd:12:68
  in call to option.map()
  here: list.find(pairs, (k, v) => k == key) |> option.map((k, v) => v)
  hint: Fix the argument type
   |
11 |     JObj(pairs) =>
   | ---------------------------- fn option.map() defined here
...
12 |       list.find(pairs, (k, v) => k == key) |> option.map((k, v) => v)
   |                                                                    ^
error[E005]: argument 'f' expects fn((String, JVal)) -> B but got fn((String, JVal), JVal) -> Int
  --> /tmp/dojo-mini-json-query-0.almd:23:45
  in call to list.map()
  here: JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)))
  hint: Fix the argument type
...
23 |     JObj(pairs) => list.sum(list.map(pairs, (_, v) => jcount(v)))
   |                                             ^
error[E005]: argument 'f' expects fn((String, JVal)) -> List[B] but got fn((String, JVal), JVal) -> List[String]
  --> /tmp/dojo-mini-json-query-0.almd:30:41
  in call to list.flat_map()
  here: JObj(pairs) => list.flat_map(pairs, (_, v) => jflatten_strings(v))
  hint: Fix the argument type
...
30 |     JObj(pairs) => list.flat_map(pairs, (_, v) => jflatten_strings(v))
   |                                         ^

4 error(s) found
FAILED: /tmp/dojo-mini-json-query-0.almd
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

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
      list.find(pairs, (pair) => pair.0 == key) |> option.map((pair) => pair.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, (x) => jcount(x)))
    JObj(pairs) => list.sum(list.map(pairs, (pair) => jcount(pair.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(pairs) => list.flat_map(pairs, (pair) => jflatten_strings(pair.1))
    _ => []
  }

effect fn main() -> Unit = {}
```
