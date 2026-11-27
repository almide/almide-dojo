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
    JObj(kvs) =>
      list.find(kvs, (k, v) => k == key) |> list.map((_, v) => v) |> list.first
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(kvs) => list.flat_map(kvs, (_, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:12:7
  in call to list.map()
  here: list.find(kvs, (k, v) => k == key) |> list.map((_, v) => v) |> list.first
  hint: the argument is an Option[(String, JVal)] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
12 |       list.find(kvs, (k, v) => k == key) |> list.map((_, v) => v) |> list.first
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(A) -> B but got fn(?4, ?5) -> ?5
  --> /tmp/dojo-mini-json-query-0.almd:12:54
  in call to list.map()
  here: list.find(kvs, (k, v) => k == key) |> list.map((_, v) => v) |> list.first
  hint: Fix the argument type
   |
12 |       list.find(kvs, (k, v) => k == key) |> list.map((_, v) => v) |> list.first
   |                                                      ^
error[E025]: cannot infer type of the type parameter `A` declared on the function `list.map`
  --> /tmp/dojo-mini-json-query-0.almd:12:42
  in call to list.map()
  here: list.find(kvs, (k, v) => k == key) |> list.map((_, v) => v) |> list.first
  hint: Nothing at this call determines `A`: no argument's type mentions it and the call's result does not pin it. Name it at the call, e.g. `list.map[Int, JVal](...)`, or drop it from `list.map`'s declaration if the signature never uses it. An undetermined type parameter is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  try:
      list.map[Int, JVal](...)
   |
12 |       list.find(kvs, (k, v) => k == key) |> list.map((_, v) => v) |> list.first
   |                                          ^^

3 error(s) found
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
    JObj(kvs) =>
      list.find(kvs, (k, _) => k == key) |> option.map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull | JBool(_) | JNum(_) | JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(kvs) => list.sum(list.map(kvs, (_, v) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(kvs) => list.flat_map(kvs, (_, v) => jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```
