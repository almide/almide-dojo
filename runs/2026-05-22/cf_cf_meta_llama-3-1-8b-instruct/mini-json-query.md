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
        JObj(fields) => {
            let field = fields
                .iter()
                .find(|(k, _)| k == &key)
                .map(|(_, v)| v.clone());
            field
        }
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
        JObj(obj) => obj.iter().flat
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
    | JBool(Boolean)
    | JNum(Int)
    | JStr(String)
    | JArr(List[JVal])
    | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
    match obj {
        JObj(fields) => {
            let field = fields
                .iter()
                .find(|(k, _)| k == &key)
                .map(|(_, v)| v.clone());
            field
        }
        _ => None,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => vec![s],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 13:17 (got Dot '.')
  --> /tmp/dojo-mini-json-query-1.almd:13:17
   |
13 |                 .iter()
   |                 ^
error: Expected '}' to close block opened at line 11:25
  --> /tmp/dojo-mini-json-query-1.almd:14:37
  hint: Add '}' or check for a missing delimiter inside the block
   |
11 |         JObj(fields) => {
   |                         --------------- '{' opened here
...
14 |                 .find(|(k, _)| k == &key)
   |                                     ^

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
    | JBool(Boolean)
    | JNum(Int)
    | JStr(String)
    | JArr(List[JVal])
    | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
    match obj {
        JObj(fields) => match fields.iter().find(|(k, _)| k == &key) {
            some((_, v)) => some(v.clone()),
            none => none,
        },
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => vec![s],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(*v)).collect(),
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 11:50 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:11:50
   |
11 |         JObj(fields) => match fields.iter().find(|(k, _)| k == &key) {
   |                                                  ^

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
    | JBool(Boolean)
    | JNum(Int)
    | JStr(String)
    | JArr(List[JVal])
    | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
    match obj {
        JObj(fields) =>
            fields.iter().find(|(k, _)| k == &key).map(|(_, v)| v.clone()),
        _ => none,
    }

fn jcount(val: JVal) -> Int =
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }

fn jflatten_strings(val: JVal) -> List[String] =
    match val {
        JStr(s) => vec![s],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(*v)).collect(),
    }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 12:32 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:12:32
   |
12 |             fields.iter().find(|(k, _)| k == &key).map(|(_, v)| v.clone()),
   |                                ^

1 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
