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
    JObj(xs) => 
      list.find(xs, (x) => x.0 == key) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
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

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:23:44
  in call to list.sum()
  here: JArr(xs) => list.sum(xs, (x) => jcount(x))
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[A]>)
   |
23 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error: type 'JVal' does not implement protocol 'Numeric'
  --> /tmp/dojo-mini-json-query-0.almd:23:44
  in call to list.sum()
  here: JArr(xs) => list.sum(xs, (x) => jcount(x))
  hint: Add `: Numeric` to the type declaration: type JVal: Numeric = ...
   |
23 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-0.almd:24:44
  in call to list.sum()
  here: JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[A]>)
   |
24 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error: type '(String, JVal)' does not implement protocol 'Numeric'
  --> /tmp/dojo-mini-json-query-0.almd:24:44
  in call to list.sum()
  here: JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  hint: 'Numeric' is satisfied only by the types that declare it; pass a value of such a type (for example by mapping each element first)
   |
24 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E001]: type mismatch in match arm: expected Int but got JVal — Int is the declared return type, and the arm at line 19 produces it
  --> /tmp/dojo-mini-json-query-0.almd:23:17
  in match arm
  here: JArr(xs) => list.sum(xs, (x) => jcount(x))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
23 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in match arm: expected Int but got (String, JVal) — Int is the declared return type, and the arm at line 19 produces it
  --> /tmp/dojo-mini-json-query-0.almd:24:17
  in match arm
  here: JObj(xs) => list.sum(xs, (x) => jcount(x.1))
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
24 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

6 error(s) found
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
    JObj(xs) => 
      list.find(xs, (x) => x.0 == key) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.fold(xs, 0, (acc, x) => acc + jcount(x))
    JObj(xs) => list.fold(xs, 0, (acc, x) => acc + jcount(x.1))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x))
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```
