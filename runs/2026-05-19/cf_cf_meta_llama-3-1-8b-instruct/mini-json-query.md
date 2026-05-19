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

fn jget(obj: JVal, key: String) -> Option[JVal] {
    match obj {
        JObj(items) => items
            .iter()
            .find(|(k, _)| k == &key)
            .map(|(_, v)| *v),
        _ => None,
    }
}

fn jcount(val: JVal) -> Int {
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }
}

fn jflatten_strings(val: JVal) -> List[String] {
    match val {
        JStr(s) => vec![s],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(*v)).collect(),
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Missing '=' before function body at line 9:49
  --> /tmp/dojo-mini-json-query-1.almd:9:49
  hint: Almide requires '=' before the body. Write: fn jget(...) -> Type = { ... }
  |
9 | fn jget(obj: JVal, key: String) -> Option[JVal] {
  |                                                 ^

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

fn jget(obj: JVal, key: String) -> Option[JVal] = {
    match obj {
        JObj(items) => items
            .iter()
            .find(|(k, _)| k == &key)
            .map(|(_, v)| *v),
        _ => None,
    }
}

fn jcount(val: JVal) -> Int = {
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(*v)).sum(),
    }
}

fn jflatten_strings(val: JVal) -> List[String] = {
    match val {
        JStr(s) => vec![s],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(*v)).collect
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
error: Expected '}' to close block opened at line 9:51
  --> /tmp/dojo-mini-json-query-2.almd:13:33
  hint: Add '}' or check for a missing delimiter inside the block
   |
 9 | fn jget(obj: JVal, key: String) -> Option[JVal] = {
   |                                                   --------------- '{' opened here
...
13 |             .find(|(k, _)| k == &key)
   |                                 ^

2 error(s) found
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

fn jget(obj: JVal, key: String) -> Option[JVal] = {
    match obj {
        JObj(items) => items
            .iter()
            .find(|(k, _)| k == key)
            .map(|(_, v)| v),
        _ => None,
    }
}

fn jcount(val: JVal) -> Int = {
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(arr) => arr.iter().map(jcount).sum(),
        JObj(obj) => obj.iter().map(|(_, v)| jcount(v)).sum(),
    }
}

fn jflatten_strings(val: JVal) -> List[String] = {
    match val {
        JStr(s) => vec![s],
        JArr(arr) => arr.iter().flat_map(jflatten_strings).collect(),
        JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(v)).collect(),
    }
}
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:1 (got RBrace '}')
  --> /tmp/dojo-mini-json-query-3.almd:17:1
   |
17 | }
   | ^
error: Expected FatArrow at line 21:15 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:21:15
   |
21 |         JNull | JBool(_) | JNum(_) | JStr(_) => 1,
   |               ^
error: Expected expression at line 22:19 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:22:19
   |
22 |         JArr(arr) => arr.iter().map(jcount).sum(),
   |                   ^
error: Expected expression at line 23:19 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:23:19
   |
23 |         JObj(obj) => obj.iter().map(|(_, v)| jcount(v)).sum(),
   |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:1 (got RBrace '}')
  --> /tmp/dojo-mini-json-query-3.almd:25:1
   |
25 | }
   | ^
error: Expected expression at line 31:42 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:31:42
   |
31 |         JObj(obj) => obj.iter().flat_map(|(_, v)| jflatten_strings(v)).collect(),
   |                                          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 33:1 (got RBrace '}')
  --> /tmp/dojo-mini-json-query-3.almd:33:1
   |
33 | }
   | ^
error[E003]: undefined variable 'arr'
  --> /tmp/dojo-mini-json-query-3.almd:22:14
  in variable arr
  hint: Check the variable name
   |
22 |         JArr(arr) => arr.iter().map(jcount).sum(),
   |              ^^^
error[E003]: undefined variable 'obj'
  --> /tmp/dojo-mini-json-query-3.almd:23:14
  in variable obj
  hint: Check the variable name
   |
23 |         JObj(obj) => obj.iter().map(|(_, v)| jcount(v)).sum(),
   |              ^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:9:51
  in fn 'jget'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[JVal]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[JVal]
  |
9 | fn jget(obj: JVal, key: String) -> Option[JVal] = {
  |                                                   ^
error[E001]: type mismatch in fn 'jcount': expected Int but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:23:14
  in fn 'jcount'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
23 |         JObj(obj) => obj.iter().map(|(_, v)| jcount(v)).sum(),
   |              ^^^
error[E001]: type mismatch in fn 'jflatten_strings': expected List[String] but got Unit
  --> /tmp/dojo-mini-json-query-3.almd:27:50
  in fn 'jflatten_strings'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[String]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[String]
   |
27 | fn jflatten_strings(val: JVal) -> List[String] = {
   |                                                  ^

13 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
