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
    | JArr(List<JVal>)
    | JObj(List<(String, JVal)>);

fn jget(obj: JVal, key: String) -> Option<JVal> {
    match obj {
        JObj(xs) => {
            let (key, val) = xs.into_iter().find(|(k, _)| k == key).ok_or_else(|| None)?;
            Some(val)
        }
        _ => None,
    }
}

fn jcount(val: JVal) -> i32 {
    match val {
        JNull | JBool(_) | JNum(_) | JStr(_) => 1,
        JArr(xs) => xs.iter().map(jcount).sum(),
        JObj(xs) => xs.iter().map(|(_, v)| jcount(*v)).sum(),
    }
}

fn jflatten_strings(val: JVal) -> List<String> {
    match val {
        JStr(s) => list.from_iter([s]),
        JArr(xs) => list.flat_map(xs, jflatten_strings),
        JObj(xs) => list.flat_map(xs, |(_, v
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
error: Expected type name at line 19:25 (got Ident 'i32')
  --> /tmp/dojo-mini-json-query-0.almd:19:25
  hint: Type names must start with an uppercase letter, e.g. Int, String, MyType
   |
19 | fn jcount(val: JVal) -> i32 {
   |                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 27:39 (got LAngle '<')
  --> /tmp/dojo-mini-json-query-0.almd:27:39
   |
27 | fn jflatten_strings(val: JVal) -> List<String> {
   |                                       ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:33:76
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 9 | fn jget(obj: JVal, key: String) -> Option<JVal> {
   | ---------------------- fn jget() defined here
...
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:34:64
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 9 | fn jget(obj: JVal, key: String) -> Option<JVal> {
   | ---------------------- fn jget() defined here
...
34 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:35:47
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 9 | fn jget(obj: JVal, key: String) -> Option<JVal> {
   | ---------------------- fn jget() defined here
...
35 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:36:50
  in call to jget()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 9 | fn jget(obj: JVal, key: String) -> Option<JVal> {
   | ---------------------- fn jget() defined here
...
36 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:43:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
27 | fn jflatten_strings(val: JVal) -> List<String> {
   | ---------------------------------- fn jflatten_strings() defined here
...
43 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:44:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
27 | fn jflatten_strings(val: JVal) -> List<String> {
   | ---------------------------------- fn jflatten_strings() defined here
...
44 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:45:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
27 | fn jflatten_strings(val: JVal) -> List<String> {
   | ---------------------------------- fn jflatten_strings() defined here
...
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
27 | fn jflatten_strings(val: JVal) -> List<String> {
   | ---------------------------------- fn jflatten_strings() defined here
...
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:47:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
27 | fn jflatten_strings(val: JVal) -> List<String> {
   | ---------------------------------- fn jflatten_strings() defined here
...
47 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:33:76
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:33:92
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:34:64
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option but got Option[?0]
  --> /tmp/dojo-mini-json-query-0.almd:34:70
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
34 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                      ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:35:47
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
35 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option but got Option[?1]
  --> /tmp/dojo-mini-json-query-0.almd:35:53
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
35 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                                     ^^^^
error[E001]: type mismatch in call to jget(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:36:50
  in call to jget()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E001]: type mismatch in call to assert_eq(): expected Option but got Option[?3]
  --> /tmp/dojo-mini-json-query-0.almd:36:56
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
36 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                        ^^^^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:41:89
  in list element
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:43:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to assert_eq(): expected List but got List[String]
  --> /tmp/dojo-mini-json-query-0.almd:43:77
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
43 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                             ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:44:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in call to assert_eq(): expected List but got List[?5]
  --> /tmp/dojo-mini-json-query-0.almd:44:73
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
44 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                         ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:45:86
  in list element
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:45:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in call to assert_eq(): expected List but got List[String]
  --> /tmp/dojo-mini-json-query-0.almd:45:110
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                                              ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in list element
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to assert_eq(): expected List but got List[String]
  --> /tmp/dojo-mini-json-query-0.almd:46:139
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                                           ^^^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:47:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to assert_eq(): expected List but got List[?7]
  --> /tmp/dojo-mini-json-query-0.almd:47:71
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
47 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                       ^

36 error(s) found
Compile error for /tmp/dojo-mini-json-query-0.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:3:76
  in call to jget()
  hint: Check the function name
  |
3 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:4:64
  in call to jget()
  hint: Check the function name
  |
4 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
  |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:5:47
  in call to jget()
  hint: Check the function name
  |
5 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
  |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-1.almd:6:50
  in call to jget()
  hint: Check the function name
  |
6 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
  |                                                  ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:7:48
  in call to jcount()
  hint: Check the function name
  |
7 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
  |                                                ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:8:44
  in call to jcount()
  hint: Check the function name
  |
8 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
  |                                            ^^^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:9:48
  in call to jcount()
  hint: Check the function name
  |
9 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
  |                                                ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:10:67
  in call to jcount()
  hint: Check the function name
   |
10 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:11:89
  in call to jcount()
  hint: Check the function name
   |
11 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E002]: undefined function 'jcount'
  --> /tmp/dojo-mini-json-query-1.almd:12:49
  in call to jcount()
  hint: Check the function name
   |
12 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:13:68
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
13 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:14:68
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
14 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:15:95
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
15 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:16:116
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
16 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:17:65
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
17 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:11:68
  in list element
  hint: Fix the expression type or change the expected type
   |
11 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-1.almd:11:89
  in list element
  hint: Fix the expression type or change the expected type
   |
11 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-1.almd:15:86
  in list element
  hint: Fix the expression type or change the expected type
   |
15 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-1.almd:16:116
  in list element
  hint: Fix the expression type or change the expected type
   |
16 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-1.almd:16:116
  in list element
  hint: Fix the expression type or change the expected type
   |
16 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

20 error(s) found
Compile error for /tmp/dojo-mini-json-query-1.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, |(k, v)| k == key).map(|(_, v)| v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs, |x| jcount(x))
    JObj(xs) => list.sum(xs, |(_, v)| jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, |(_, v)| jflatten_strings(v))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 3:31 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:3:31
  |
3 |     JObj(xs) => list.find(xs, |(k, v)| k == key).map(|(_, v)| v)
  |                               ^
error: '|x|' closure syntax is not valid in Almide at line 13:30
  --> /tmp/dojo-mini-json-query-2.almd:13:30
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
13 |     JArr(xs) => list.sum(xs, |x| jcount(x))
   |                              ^
error: Expected expression at line 21:35 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-2.almd:21:35
   |
21 |     JObj(xs) => list.flat_map(xs, |(_, v)| jflatten_strings(v))
   |                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:35:68
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-2.almd:35:89
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-2.almd:39:86
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-2.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-2.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^

8 error(s) found
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, (x) => x.0 == key).map(|(_, v)| v)
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
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => jflatten_strings(x.1))
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 3:54 (got Pipe '|')
  --> /tmp/dojo-mini-json-query-3.almd:3:54
  |
3 |     JObj(xs) => list.find(xs, (x) => x.0 == key).map(|(_, v)| v)
  |                                                      ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:13:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
13 |     JArr(xs) => list.sum(xs, (x) => jcount(x))
   |                                            ^
error[E004]: list.sum() expects 1 argument(s) but got 2
  --> /tmp/dojo-mini-json-query-3.almd:14:44
  in call to list.sum()
  hint: Check the number of arguments
  try:
      // list.sum() takes 1 arg(s) — you passed 2
      list.sum(<xs: List[Int]>)
   |
14 |     JObj(xs) => list.sum(xs, (x) => jcount(x.1))
   |                                            ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:31:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
31 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:32:44
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
32 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:33:48
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
33 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:34:67
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
34 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:35:89
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:36:49
  in call to jcount()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
36 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:37:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
37 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:38:68
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
38 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:39:95
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:40:116
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:41:65
  in call to jflatten_strings()
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:31:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
31 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E001]: type mismatch in call to jcount(): expected JVal but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:32:44
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
32 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:33:48
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
33 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:34:67
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
34 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E001]: type mismatch in list element: expected JNum but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:35:68
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-3.almd:35:89
  in list element
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:35:89
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in call to jcount(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:36:49
  in call to jcount()
  hint: Fix the expression type or change the expected type
   |
36 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JStr
  --> /tmp/dojo-mini-json-query-3.almd:37:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
37 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:38:68
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
38 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-3.almd:39:86
  in list element
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:39:95
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E001]: type mismatch in list element: expected JStr but got JNull
  --> /tmp/dojo-mini-json-query-3.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-3.almd:40:116
  in list element
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JObj
  --> /tmp/dojo-mini-json-query-3.almd:40:116
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E001]: type mismatch in call to jflatten_strings(): expected JVal but got JArr
  --> /tmp/dojo-mini-json-query-3.almd:41:65
  in call to jflatten_strings()
  hint: Fix the expression type or change the expected type
   |
41 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

30 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
