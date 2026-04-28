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
    | JBool(bool)
    | JNum(i32)
    | JStr(String)
    | JArr(Vec<JVal>)
    | JObj(Vec<(String, JVal)>);

fn jget(obj: JVal, key: String) -> Option<JVal> {
    match obj {
        JObj(items) => items
            .iter()
            .find(|(k, _)| k == &key)
            .map(|(_, v)| *v),
        _ => None,
    }
}

fn jcount(val: JVal) -> i32 {
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }
}

fn jflatten_strings(val: JVal) -> Vec<String> {
    match val {
        JStr(s) => vec![s],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(*v
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected type name at line 3:13 (got Ident 'bool')
  --> /tmp/dojo-mini-json-query-0.almd:3:13
  hint: Type names must start with an uppercase letter, e.g. Int, String, MyType
  |
3 |     | JBool(bool)
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:42 (got LAngle '<')
  --> /tmp/dojo-mini-json-query-0.almd:9:42
  |
9 | fn jget(obj: JVal, key: String) -> Option<JVal> {
  |                                          ^

2 error(s) found
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
        JObj(items) => items
            .iter()
            .find(|(k, _)| k == &key)
            .map(|(_, v)| *v),
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => list.sum(arr.map(jcount)),
        JObj(obj) => list.sum(obj.map(|(_, v)| jcount(*v))),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => list.from_iter([s]),
        JArr(arr) => list.flat_map(arr, jflatten_strings),
        JObj(obj) => list.flat_map(obj, |(_, v)| jflatten_strings(*v)),
    }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected pattern at line 12:13 (got Dot '.')
  --> /tmp/dojo-mini-json-query-1.almd:12:13
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |             .iter()
   |             ^

1 error(s) found
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
        JObj(items) => match items {
            [] => none,
            (k, v) :: _ => if k == key then some(v) else jget(v, key),
        },
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => list.sum(arr.map(jcount)),
        JObj(obj) => list.sum(obj.map(|(_, v)| jcount(*v))),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => list.from_iter([s]),
        JArr(arr) => list.flat_map(arr, jflatten_strings),
        JObj(obj) => list.flat_map(obj, |(_, v)| jflatten_strings(*v)),
    }

effect fn main()
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected FatArrow at line 13:20 (got Colon ':')
  --> /tmp/dojo-mini-json-query-2.almd:13:20
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
   |
13 |             (k, v) :: _ => if k == key then some(v) else jget(v, key),
   |                    ^
error: Expected FatArrow at line 20:15 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:20:15
   |
20 |         JNull | JBool(_) | JNum(_) | JStr(_) => 1,
   |               ^
error: Expected expression at line 29:41 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:29:41
   |
29 |         JObj(obj) => list.flat_map(obj, |(_, v)| jflatten_strings(*v)),
   |                                         ^
error: Expected Arrow at line 32:17 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:32:17
   |
32 | effect fn main()
   |                 ^

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
        JObj(items) => match items {
            [] => none,
            head :: tail => if head.0 == key then some(head.1) else jget(head.1, key),
        },
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => list.sum(arr.map(jcount)),
        JObj(obj) => list.sum(obj.map(|item| jcount(item.1))),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => list.from_iter([s]),
        JArr(arr) => list.flat_map(arr, jflatten_strings),
        JObj(obj) => list.flat_map(obj, |item| jflatten_strings(item.1)),
    }

effect fn
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected FatArrow at line 13:18 (got Colon ':')
  --> /tmp/dojo-mini-json-query-3.almd:13:18
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
   |
13 |             head :: tail => if head.0 == key then some(head.1) else jget(head.1, key),
   |                  ^
error: Expected FatArrow at line 20:15 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:20:15
   |
20 |         JNull | JBool(_) | JNum(_) | JStr(_) => 1,
   |               ^
error: '|x|' closure syntax is not valid in Almide at line 29:41
  --> /tmp/dojo-mini-json-query-3.almd:29:41
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
29 |         JObj(obj) => list.flat_map(obj, |item| jflatten_strings(item.1)),
   |                                         ^
error: Expected function name at line 32:10 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:32:10
   |
32 | effect fn
   |          ^

4 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
