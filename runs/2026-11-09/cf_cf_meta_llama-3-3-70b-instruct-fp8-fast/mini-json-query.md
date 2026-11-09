# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 3
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
      list.find(xs, (x) => x.0 == key) |> list.map((x) => x.1) |> list.first
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.map(xs, jcount) |> list.sum
    JObj(xs) => list.map(xs, (x) => jcount(x.1)) |> list.sum
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
error[E005]: argument 'xs' expects List[A] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-0.almd:12:7
  in call to list.map()
  here: list.find(xs, (x) => x.0 == key) |> list.map((x) => x.1) |> list.first
  hint: the argument is an Option[(String, JVal)] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
12 |       list.find(xs, (x) => x.0 == key) |> list.map((x) => x.1) |> list.first
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
    JObj(xs) =>
      list.find(xs, (x) => x.0 == key) |> (x => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.map(xs, jcount) |> list.sum
    JObj(xs) => list.map(xs, (x) => jcount(x.1)) |> list.sum
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
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-mini-json-query-1.almd:12:46
  in lambda syntax
  here: list.find(xs, (x) => x.0 == key) |> (x => x.1)
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
12 |       list.find(xs, (x) => x.0 == key) |> (x => x.1)
   |                                              ^^
error: Lambda parameter must be wrapped in parentheses at line 12:46
  --> /tmp/dojo-mini-json-query-1.almd:12:46
  here: list.find(xs, (x) => x.0 == key) |> (x => x.1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |       list.find(xs, (x) => x.0 == key) |> (x => x.1)
   |                                              ^

2 error(s) found
FAILED: /tmp/dojo-mini-json-query-1.almd
  parse error: Lambda parameter must be wrapped in parentheses
  parse error: Lambda parameter must be wrapped in parentheses at line 12:46
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
    JObj(xs) =>
      list.find(xs, (x) => x.0 == key) |> ((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.map(xs, (x) => jcount(x)) |> list.sum
    JObj(xs) => list.map(xs, (x) => jcount(x.1)) |> list.sum
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
FAILED: /tmp/dojo-mini-json-query-2.almd
Compile error for /tmp/dojo-mini-json-query-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `1` on type `Option<(AlmideStr, JVal)>`
    --> <generated.rs>:6142:87
     |
6142 | ...   JVal::JObj(xs) => ((std::rc::Rc::new(move |x: Option<(AlmideString, JVal)>| x.1) as std::rc::Rc<dyn Fn(Option<(AlmideString,...
     |                                                                                     ^ unknown field
     |
help: one of the expressions' fields has a field of the same name
     |
6142 |         JVal::JObj(xs) => ((std::rc::Rc::new(move |x: Option<(AlmideString, JVal)>| x.unwrap().1) as std::rc::Rc<dyn Fn(Option<(AlmideString, JVal)>) -> Option<JVal>>))((almide_box_take(xs)).into_iter().find(|x| {
     |                                                                                       +++++++++


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 9 warnings emitted

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

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
      list.find(xs, (x) => x.0 == key) |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.map(xs, (x) => jcount(x)) |> list.sum
    JObj(xs) => list.map(xs, (x) => jcount(x.1)) |> list.sum
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
