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
        JObj(items) => items.iter().find(|(k, _)| k == &key).map(|(_, v)| v),
        _ => none
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(v)).sum()
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => list.from_iter([s]),
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(v)).collect()
    }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 11:42 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-1.almd:11:42
   |
11 |         JObj(items) => items.iter().find(|(k, _)| k == &key).map(|(_, v)| v),
   |                                          ^

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
        JObj(items) => items.iter().find(|(k, _)| k == key).map(|(_, v)| v),
        _ => none
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(v)).sum()
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => list.from_iter([s]),
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(v)).collect()
    }

effect fn main() -> Unit =
    let _ =
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 11:42 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:11:42
   |
11 |         JObj(items) => items.iter().find(|(k, _)| k == key).map(|(_, v)| v),
   |                                          ^
error: Expected FatArrow at line 17:15 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:17:15
   |
17 |         JNull | JBool(_) | JNum(_) | JStr(_) => 1,
   |               ^
error: Expected expression at line 26:42 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:26:42
   |
26 |         JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(v)).collect()
   |                                          ^
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-2.almd:32:1
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

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
        JObj(items) => items.iter().find(|item| item.0 == key).map(|item| item.1),
        _ => none
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(v)).sum()
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => list.from_iter([s]),
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|item| jflatten_strings(item.1)).collect()
    }

effect fn main() -> Unit =
    let _
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: '|x|' closure syntax is not valid in Almide at line 11:42
  --> /tmp/dojo-mini-json-query-3.almd:11:42
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
11 |         JObj(items) => items.iter().find(|item| item.0 == key).map(|item| item.1),
   |                                          ^
error: Expected FatArrow at line 17:15 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:17:15
   |
17 |         JNull | JBool(_) | JNum(_) | JStr(_) => 1,
   |               ^
error: '|x|' closure syntax is not valid in Almide at line 26:42
  --> /tmp/dojo-mini-json-query-3.almd:26:42
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
26 |         JObj(obj) => obj.iter().flat_map(|item| jflatten_strings(item.1)).collect()
   |                                          ^
error: Expected Eq at line 30:10 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:30:10
   |
30 |     let _
   |          ^

4 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
