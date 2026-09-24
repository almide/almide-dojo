# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map((x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, (x) => match x {
    (k, v) => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, ?3)) -> Bool but got fn((String, ?3)) -> Option[?3]
  --> /tmp/dojo-mini-json-query-0.almd:2:29
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
...
2 |   JObj(xs) => list.find(xs, (x) => match x {
  |                             ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:32:35
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
32 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                   ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:32:51
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
32 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                   ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:32:51
  in call to JObj()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
32 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                   ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:32:18
  in call to jget()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
32 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                  ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:32:74
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
32 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                                          ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:36:35
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
36 |   assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
   |                                   ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:36:35
  in call to JObj()
  here: assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
36 |   assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
   |                                   ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:36:18
  in call to jget()
  here: assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
36 |   assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
   |                  ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:23
  in call to JNum()
  here: assert_eq(jget(JNum(1), "a"), none)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
40 |   assert_eq(jget(JNum(1), "a"), none)
   |                       ^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:40:18
  in call to jget()
  here: assert_eq(jget(JNum(1), "a"), none)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
40 |   assert_eq(jget(JNum(1), "a"), none)
   |                  ^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:44:23
  in call to JObj()
  here: assert_eq(jget(JObj([]), "a"), none)
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
44 |   assert_eq(jget(JObj([]), "a"), none)
   |                       ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:44:18
  in call to jget()
  here: assert_eq(jget(JObj([]), "a"), none)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
44 |   assert_eq(jget(JObj([]), "a"), none)
   |                  ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:48:25
  in call to JNum()
  here: assert_eq(jcount(JNum(1)), 1)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
48 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:48:20
  in call to jcount()
  here: assert_eq(jcount(JNum(1)), 1)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 8 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
48 |   assert_eq(jcount(JNum(1)), 1)
   |                    ^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:52:20
  in variable JNull
  here: assert_eq(jcount(JNull), 1)
  hint: Check the variable name
   |
52 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:56:25
  in call to JStr()
  here: assert_eq(jcount(JStr("x")), 1)
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
56 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:56:20
  in call to jcount()
  here: assert_eq(jcount(JStr("x")), 1)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 8 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
56 |   assert_eq(jcount(JStr("x")), 1)
   |                    ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:60:31
  in call to JNum()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
60 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                               ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:60:40
  in call to JNum()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
60 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                        ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:60:49
  in call to JNum()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
60 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:60:49
  in call to JArr()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
60 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:60:20
  in call to jcount()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 8 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
60 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                    ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:65:22
  in call to JNum()
  here: ("a", JArr([JNum(1), JNull])),
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
65 |     ("a", JArr([JNum(1), JNull])),
   |                      ^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:65:26
  in variable JNull
  here: ("a", JArr([JNum(1), JNull])),
  hint: Check the variable name
   |
65 |     ("a", JArr([JNum(1), JNull])),
   |                          ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:65:26
  in call to JArr()
  here: ("a", JArr([JNum(1), JNull])),
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
65 |     ("a", JArr([JNum(1), JNull])),
   |                          ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:66:16
  in call to JStr()
  here: ("b", JStr("x"))
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
66 |     ("b", JStr("x"))
   |                ^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:66:16
  in call to JObj()
  here: ("b", JStr("x"))
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
66 |     ("b", JStr("x"))
   |                ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:64:20
  in call to jcount()
  here: assert_eq(jcount(JObj([
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 8 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
64 |   assert_eq(jcount(JObj([
   |                    ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:71:25
  in call to JArr()
  here: assert_eq(jcount(JArr([])), 0)
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
71 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:71:20
  in call to jcount()
  here: assert_eq(jcount(JArr([])), 0)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 8 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
71 |   assert_eq(jcount(JArr([])), 0)
   |                    ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:75:35
  in call to JStr()
  here: assert_eq(jflatten_strings(JStr("hi")), ["hi"])
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
75 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:75:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JStr("hi")), ["hi"])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
19 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
75 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                              ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:79:35
  in call to JNum()
  here: assert_eq(jflatten_strings(JNum(1)), [])
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
79 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:79:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JNum(1)), [])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
19 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
79 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                              ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:83:41
  in call to JStr()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
83 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                         ^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:83:52
  in call to JNum()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
83 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                    ^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:83:61
  in call to JStr()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
83 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:83:61
  in call to JArr()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
83 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:83:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
19 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
83 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                              ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:88:16
  in call to JStr()
  here: ("x", JStr("hello")),
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
88 |     ("x", JStr("hello")),
   |                ^^^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:89:22
  in call to JStr()
  here: ("y", JArr([JStr("world"), JNull]))
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
89 |     ("y", JArr([JStr("world"), JNull]))
   |                      ^^^^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:89:32
  in variable JNull
  here: ("y", JArr([JStr("world"), JNull]))
  hint: Check the variable name
   |
89 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:89:32
  in call to JArr()
  here: ("y", JArr([JStr("world"), JNull]))
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
89 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:89:32
  in call to JObj()
  here: ("y", JArr([JStr("world"), JNull]))
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
89 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:87:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JObj([
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
19 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
87 |   assert_eq(jflatten_strings(JObj([
   |                              ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:94:35
  in call to JArr()
  here: assert_eq(jflatten_strings(JArr([])), [])
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
94 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:94:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JArr([])), [])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
19 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
94 |   assert_eq(jflatten_strings(JArr([])), [])
   |                              ^^^^
error[E001]: type mismatch in ?? fallback: expected (String, ?3) but got Option[?5]
  --> /tmp/dojo-mini-json-query-0.almd:4:9
  in ?? fallback
  here: }) ?? none,
  hint: Fix the expression type or change the expected type
  |
4 |   }) ?? none,
  |         ^^^^
error[E001]: type mismatch in match arm: expected (String, ?3) but got Option[?6]
  --> /tmp/dojo-mini-json-query-0.almd:5:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
5 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?3)
  --> /tmp/dojo-mini-json-query-0.almd:5:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
  |
5 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:32:74
  in call to assert_eq()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: Fix the expression type or change the expected type
   |
32 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                                          ^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:66:16
  in list element
  here: ("b", JStr("x"))
  hint: Fix the expression type or change the expected type
   |
66 |     ("b", JStr("x"))
   |                ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:83:52
  in list element
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: Fix the expression type or change the expected type
   |
83 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                    ^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:89:32
  in list element
  here: ("y", JArr([JStr("world"), JNull]))
  hint: Fix the expression type or change the expected type
   |
89 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E029]: unknown type 'JVal'
  in parameter 'obj'
  hint: no `type JVal` is declared (or imported) in this program — declare it, or check the spelling
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:25:8
  in empty list `[]` with no element-type context
  here: _ => [],
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
25 |   _ => [],
   |        ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:44:23
  in empty list `[]` with no element-type context
  here: assert_eq(jget(JObj([]), "a"), none)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
44 |   assert_eq(jget(JObj([]), "a"), none)
   |                       ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:71:25
  in empty list `[]` with no element-type context
  here: assert_eq(jcount(JArr([])), 0)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
71 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:94:35
  in empty list `[]` with no element-type context
  here: assert_eq(jflatten_strings(JArr([])), [])
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
94 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^
error[E025]: cannot infer a concrete type for this expression (type Option[(String, ?3)])
  --> /tmp/dojo-mini-json-query-0.almd:2:24
  in this expression with an unconstrained type
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[(String, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   JObj(xs) => list.find(xs, (x) => match x {
  |                        ^

61 error(s) found
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

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map((x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, (x) => match x {
    (k, v) => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:4:29
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
...
4 |   JObj(xs) => list.find(xs, (x) => match x {
  |                             ^
error[E001]: type mismatch in ?? fallback: expected (String, JVal) but got Option[?2]
  --> /tmp/dojo-mini-json-query-1.almd:6:9
  in ?? fallback
  here: }) ?? none,
  hint: Fix the expression type or change the expected type
  |
6 |   }) ?? none,
  |         ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?3]
  --> /tmp/dojo-mini-json-query-1.almd:7:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
7 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-1.almd:7:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
  |
7 |   _ => none,
  |        ^^^^

4 error(s) found
FAILED: /tmp/dojo-mini-json-query-1.almd
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

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map((x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, (x) => match x {
    (k, v) => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:4:29
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
...
4 |   JObj(xs) => list.find(xs, (x) => match x {
  |                             ^
error[E001]: type mismatch in ?? fallback: expected (String, JVal) but got Option[?2]
  --> /tmp/dojo-mini-json-query-2.almd:6:9
  in ?? fallback
  here: }) ?? none,
  hint: Fix the expression type or change the expected type
  |
6 |   }) ?? none,
  |         ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?3]
  --> /tmp/dojo-mini-json-query-2.almd:7:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
7 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-2.almd:7:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
  |
7 |   _ => none,
  |        ^^^^

4 error(s) found
FAILED: /tmp/dojo-mini-json-query-2.almd
Compile error for /tmp/dojo-mini-json-query-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(xs) => list.find(xs, (x) => match x {
    (k, v) => if k == key then some(v) else none
  }) |> option.unwrap_or(none)
  _ => none
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1
  JBool(_) => 1
  JNum(_) => 1
  JStr(_) => 1
  JArr(xs) => list.sum(xs |> list.map(jcount))
  JObj(xs) => list.sum(xs |> list.map((x) => match x {
    (k, v) => jcount(v)
  }))
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JStr(s) => [s]
  JArr(xs) => list.flat_map(xs, jflatten_strings)
  JObj(xs) => list.flat_map(xs, (x) => match x {
    (k, v) => jflatten_strings(v)
  })
  _ => []
}

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:4:29
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
...
4 |   JObj(xs) => list.find(xs, (x) => match x {
  |                             ^
error[E001]: type mismatch in ?? fallback: expected (String, JVal) but got Option[?2]
  --> /tmp/dojo-mini-json-query-3.almd:6:9
  in ?? fallback
  here: }) ?? none,
  hint: Fix the expression type or change the expected type
  |
6 |   }) ?? none,
  |         ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?3]
  --> /tmp/dojo-mini-json-query-3.almd:7:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
7 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-3.almd:7:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
  |
7 |   _ => none,
  |        ^^^^

4 error(s) found
FAILED: /tmp/dojo-mini-json-query-3.almd
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
