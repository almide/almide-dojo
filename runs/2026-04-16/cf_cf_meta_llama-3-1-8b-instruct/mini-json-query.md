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
        JObj(pairs) => pairs
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
        JNull | JBool(_) | JNum(_) => vec![],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj
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
        JObj(pairs) => pairs
            .iter()
            .find(|(k, _)| k == &key)
            .map(|(_, v)| *v),
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => vec![s],
        JNull | JBool(_) | JNum(_) => vec![],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)|
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
        JObj(pairs) => pairs
            .iter()
            .find(|(k, _)| k == &key)
            .map(|(_, v)| *v),
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => vec![s],
        JNull | JBool(_) | JNum(_) => vec![],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(k,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected pattern at line 12:13 (got Dot '.')
  --> /tmp/dojo-mini-json-query-2.almd:12:13
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |             .iter()
   |             ^

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
        JObj(pairs) => pairs
            .iter()
            .find(|(k, _)| k == &key)
            .map(|(_, v)| *v),
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => vec![s],
        JNull | JBool(_) | JNum(_) => vec![],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(k,
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 12:13 (got Dot '.')
  --> /tmp/dojo-mini-json-query-3.almd:12:13
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
12 |             .iter()
   |             ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
