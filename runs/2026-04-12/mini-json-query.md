# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected pattern at line 13:9 (got Dot '.')
  --> /tmp/dojo-mini-json-query-3.almd:13:9
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
13 |         .map((_, v) => v)
   |         ^
error: Expected pattern at line 34:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-3.almd:34:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E003]: undefined variable 'v'
  --> /tmp/dojo-mini-json-query-3.almd:24:60
  in variable v
  hint: Check the variable name
   |
24 |     JObj(fields) => list.sum(fields.map(((k, v)) => jcount(v)))
   |                                                            ^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:34:76
  in call to jget()
  hint: Check the function name
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                            ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:35:64
  in call to jget()
  hint: Check the function name
   |
35 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                                ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:36:47
  in call to jget()
  hint: Check the function name
   |
36 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                               ^^^
error[E002]: undefined function 'jget'
  --> /tmp/dojo-mini-json-query-3.almd:37:50
  in call to jget()
  hint: Check the function name
   |
37 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                                  ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:44:68
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:45:68
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:46:95
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:47:116
  in call to jflatten_strings()
  hint: Check the function name
   |
47 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:48:65
  in call to jflatten_strings()
  hint: Check the function name
   |
48 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

12 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```

## Last attempted code

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
    JObj(fields) => 
      list.find(fields, (k, _) => k == key)
        .map((_, v) => v)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(fields) => list.sum(fields.map(((k, v)) => jcount(v)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs.map(jflatten_strings))
    JObj(fields) => list.flat_map(fields.map(((k, v)) => jflatten_strings(v)))
    _ => []
```
