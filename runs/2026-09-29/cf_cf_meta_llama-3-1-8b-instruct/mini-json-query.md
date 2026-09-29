# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E014`

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (x) => match x {
        (k, v) => if k == key then some(v) else none
        _ => none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
      _ => 0
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
      _ => []
    })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E029]: unknown type 'JVal'
  --> /tmp/dojo-mini-json-query-0.almd:1:14
  in parameter 'obj'
  here: fn jget(obj: JVal, key: String) -> JVal? = match obj {
  hint: no `type JVal` is declared (or imported) in this program — declare it, or check the spelling
  |
1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
  |              ^^^^
error[E005]: argument 'f' expects fn((String, ?4)) -> Bool but got fn((String, ?4)) -> Option[?4]
  --> /tmp/dojo-mini-json-query-0.almd:4:5
  in call to list.find()
  here: (x) => match x {
  hint: Fix the argument type
...
4 |     (x) => match x {
  |     ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:35
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
41 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                   ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:51
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
41 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                   ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:51
  in call to JObj()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
41 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                   ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:41:18
  in call to jget()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
41 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                  ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:74
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
41 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                                          ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:45:35
  in call to JNum()
  here: assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
45 |   assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
   |                                   ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:45:35
  in call to JObj()
  here: assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
45 |   assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
   |                                   ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:45:18
  in call to jget()
  here: assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
45 |   assert_eq(jget(JObj([("a", JNum(1))]), "z"), none)
   |                  ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:49:23
  in call to JNum()
  here: assert_eq(jget(JNum(1), "a"), none)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
49 |   assert_eq(jget(JNum(1), "a"), none)
   |                       ^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:49:18
  in call to jget()
  here: assert_eq(jget(JNum(1), "a"), none)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
49 |   assert_eq(jget(JNum(1), "a"), none)
   |                  ^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:53:23
  in call to JObj()
  here: assert_eq(jget(JObj([]), "a"), none)
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
53 |   assert_eq(jget(JObj([]), "a"), none)
   |                       ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:53:18
  in call to jget()
  here: assert_eq(jget(JObj([]), "a"), none)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> JVal? = match obj {
   | ---------------------- fn jget() defined here
...
53 |   assert_eq(jget(JObj([]), "a"), none)
   |                  ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:57:25
  in call to JNum()
  here: assert_eq(jcount(JNum(1)), 1)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
57 |   assert_eq(jcount(JNum(1)), 1)
   |                         ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:57:20
  in call to jcount()
  here: assert_eq(jcount(JNum(1)), 1)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
57 |   assert_eq(jcount(JNum(1)), 1)
   |                    ^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:61:20
  in variable JNull
  here: assert_eq(jcount(JNull), 1)
  hint: Check the variable name
   |
61 |   assert_eq(jcount(JNull), 1)
   |                    ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:65:25
  in call to JStr()
  here: assert_eq(jcount(JStr("x")), 1)
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
65 |   assert_eq(jcount(JStr("x")), 1)
   |                         ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:65:20
  in call to jcount()
  here: assert_eq(jcount(JStr("x")), 1)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
65 |   assert_eq(jcount(JStr("x")), 1)
   |                    ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:69:31
  in call to JNum()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
69 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                               ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:69:40
  in call to JNum()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
69 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                        ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:69:49
  in call to JNum()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
69 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:69:49
  in call to JArr()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
69 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:69:20
  in call to jcount()
  here: assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
69 |   assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3)
   |                    ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:74:22
  in call to JNum()
  here: ("a", JArr([JNum(1), JNull])),
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
74 |     ("a", JArr([JNum(1), JNull])),
   |                      ^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:74:26
  in variable JNull
  here: ("a", JArr([JNum(1), JNull])),
  hint: Check the variable name
   |
74 |     ("a", JArr([JNum(1), JNull])),
   |                          ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:74:26
  in call to JArr()
  here: ("a", JArr([JNum(1), JNull])),
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
74 |     ("a", JArr([JNum(1), JNull])),
   |                          ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:75:16
  in call to JStr()
  here: ("b", JStr("x"))
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
75 |     ("b", JStr("x"))
   |                ^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:75:16
  in call to JObj()
  here: ("b", JStr("x"))
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
75 |     ("b", JStr("x"))
   |                ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:73:20
  in call to jcount()
  here: assert_eq(jcount(JObj([
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
73 |   assert_eq(jcount(JObj([
   |                    ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:80:25
  in call to JArr()
  here: assert_eq(jcount(JArr([])), 0)
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
80 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:80:20
  in call to jcount()
  here: assert_eq(jcount(JArr([])), 0)
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
12 | fn jcount(val: JVal) -> Int = match val {
   | ------------------------ fn jcount() defined here
...
80 |   assert_eq(jcount(JArr([])), 0)
   |                    ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:84:35
  in call to JStr()
  here: assert_eq(jflatten_strings(JStr("hi")), ["hi"])
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
84 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:84:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JStr("hi")), ["hi"])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
84 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                              ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:88:35
  in call to JNum()
  here: assert_eq(jflatten_strings(JNum(1)), [])
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
88 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:88:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JNum(1)), [])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
88 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                              ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:92:41
  in call to JStr()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
92 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                         ^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:92:52
  in call to JNum()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
92 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                    ^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:92:61
  in call to JStr()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
92 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:92:61
  in call to JArr()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
92 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:92:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
92 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                              ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:98:18
  in call to JStr()
  here: ("x", JStr("hello")),
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
98 |       ("x", JStr("hello")),
   |                  ^^^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:99:24
  in call to JStr()
  here: ("y", JArr([JStr("world"), JNull]))
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
99 |       ("y", JArr([JStr("world"), JNull]))
   |                        ^^^^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:99:34
  in variable JNull
  here: ("y", JArr([JStr("world"), JNull]))
  hint: Check the variable name
   |
99 |       ("y", JArr([JStr("world"), JNull]))
   |                                  ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:99:34
  in call to JArr()
  here: ("y", JArr([JStr("world"), JNull]))
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
99 |       ("y", JArr([JStr("world"), JNull]))
   |                                  ^^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:99:34
  in call to JObj()
  here: ("y", JArr([JStr("world"), JNull]))
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
99 |       ("y", JArr([JStr("world"), JNull]))
   |                                  ^^^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:97:22
  in call to jflatten_strings()
  here: jflatten_strings(JObj([
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
24 | fn jflatten_strings(val: JVal) -> List[String] = match val {
   | ---------------------------------- fn jflatten_strings() defined here
...
97 |     jflatten_strings(JObj([
   |                      ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:106:35
  in call to JArr()
  here: assert_eq(jflatten_strings(JArr([])), [])
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
    |
106 |   assert_eq(jflatten_strings(JArr([])), [])
    |                                   ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:106:30
  in call to jflatten_strings()
  here: assert_eq(jflatten_strings(JArr([])), [])
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
    |
 24 | fn jflatten_strings(val: JVal) -> List[String] = match val {
    | ---------------------------------- fn jflatten_strings() defined here
 ...
106 |   assert_eq(jflatten_strings(JArr([])), [])
    |                              ^^^^
error[E001]: type mismatch in ?? fallback: expected (String, ?4) but got Option[?7]
  --> /tmp/dojo-mini-json-query-0.almd:8:8
  in ?? fallback
  here: ) ?? none,
  hint: Fix the expression type or change the expected type
  |
8 |   ) ?? none,
  |        ^^^^
error[E001]: type mismatch in match arm: expected (String, ?4) but got Option[?8]
  --> /tmp/dojo-mini-json-query-0.almd:9:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
9 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, ?4)
  --> /tmp/dojo-mini-json-query-0.almd:9:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
  |
9 |   _ => none,
  |        ^^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:41:74
  in call to assert_eq()
  here: assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
  hint: Fix the expression type or change the expected type
   |
41 |   assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2)))
   |                                                                          ^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:75:16
  in list element
  here: ("b", JStr("x"))
  hint: Fix the expression type or change the expected type
   |
75 |     ("b", JStr("x"))
   |                ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:92:52
  in list element
  here: assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
  hint: Fix the expression type or change the expected type
   |
92 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                    ^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:99:34
  in list element
  here: ("y", JArr([JStr("world"), JNull]))
  hint: Fix the expression type or change the expected type
   |
99 |       ("y", JArr([JStr("world"), JNull]))
   |                                  ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:34:8
  in empty list `[]` with no element-type context
  here: _ => [],
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
34 |   _ => [],
   |        ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:53:23
  in empty list `[]` with no element-type context
  here: assert_eq(jget(JObj([]), "a"), none)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
53 |   assert_eq(jget(JObj([]), "a"), none)
   |                       ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:80:25
  in empty list `[]` with no element-type context
  here: assert_eq(jcount(JArr([])), 0)
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
80 |   assert_eq(jcount(JArr([])), 0)
   |                         ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:106:35
  in empty list `[]` with no element-type context
  here: assert_eq(jflatten_strings(JArr([])), [])
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
    |
106 |   assert_eq(jflatten_strings(JArr([])), [])
    |                                   ^
error[E025]: cannot infer a concrete type for this expression (type Option[(String, ?4)])
  --> /tmp/dojo-mini-json-query-0.almd:2:24
  in this expression with an unconstrained type
  here: JObj(xs) => list.find(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[(String, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   JObj(xs) => list.find(
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

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (x) => match x {
        (k, v) => if k == key then some(v) else none
        _ => none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
      _ => 0
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
      _ => []
    })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-1.almd:8:12
  in match
  here: _ => none,
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
  |
8 |       _ => none,
  |            ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:6:5
  in call to list.find()
  here: (x) => match x {
  hint: Fix the argument type
...
6 |     (x) => match x {
  |     ^
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-1.almd:22:10
  in match
  here: _ => 0,
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
22 |     _ => 0,
   |          ^
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-1.almd:33:12
  in match
  here: _ => [],
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
33 |       _ => [],
   |            ^
error[E001]: type mismatch in ?? fallback: expected (String, JVal) but got Option[?4]
  --> /tmp/dojo-mini-json-query-1.almd:10:8
  in ?? fallback
  here: ) ?? none,
  hint: Fix the expression type or change the expected type
   |
10 |   ) ?? none,
   |        ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?5]
  --> /tmp/dojo-mini-json-query-1.almd:11:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |   _ => none,
   |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-1.almd:11:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
   |
11 |   _ => none,
   |        ^^^^

7 error(s) found
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

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (x) => match x {
        (k, v) => if k == key then some(v) else none
        _ => none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
      _ => 0
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
      _ => []
    })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-2.almd:8:12
  in match
  here: _ => none,
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
  |
8 |       _ => none,
  |            ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:6:5
  in call to list.find()
  here: (x) => match x {
  hint: Fix the argument type
...
6 |     (x) => match x {
  |     ^
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-2.almd:22:10
  in match
  here: _ => 0,
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
22 |     _ => 0,
   |          ^
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-2.almd:33:12
  in match
  here: _ => [],
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
33 |       _ => [],
   |            ^
error[E001]: type mismatch in ?? fallback: expected (String, JVal) but got Option[?4]
  --> /tmp/dojo-mini-json-query-2.almd:10:8
  in ?? fallback
  here: ) ?? none,
  hint: Fix the expression type or change the expected type
   |
10 |   ) ?? none,
   |        ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?5]
  --> /tmp/dojo-mini-json-query-2.almd:11:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |   _ => none,
   |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-2.almd:11:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
   |
11 |   _ => none,
   |        ^^^^

7 error(s) found
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

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) =>
      list.find(xs, (x) => match x {
        (k, v) => if k == key then some(v) else none
        _ => none
      }) |> option.unwrap_or(none)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs |> list.map(jcount))
    JObj(xs) => list.sum(xs |> list.map((x) => match x {
      (k, v) => jcount(v)
      _ => 0
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(xs) => list.flat_map(xs, (x) => match x {
      (k, v) => jflatten_strings(v)
      _ => []
    })
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-3.almd:8:12
  in match
  here: _ => none,
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
  |
8 |       _ => none,
  |            ^^^^
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:6:5
  in call to list.find()
  here: (x) => match x {
  hint: Fix the argument type
...
6 |     (x) => match x {
  |     ^
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-3.almd:22:10
  in match
  here: _ => 0,
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
22 |     _ => 0,
   |          ^
error[E014]: unreachable match arm
  --> /tmp/dojo-mini-json-query-3.almd:33:12
  in match
  here: _ => [],
  hint: This arm's pattern is already covered by an earlier arm. Either delete it, or tighten the earlier arm so this one is reachable.
   |
33 |       _ => [],
   |            ^
error[E001]: type mismatch in ?? fallback: expected (String, JVal) but got Option[?4]
  --> /tmp/dojo-mini-json-query-3.almd:10:8
  in ?? fallback
  here: ) ?? none,
  hint: Fix the expression type or change the expected type
   |
10 |   ) ?? none,
   |        ^^^^
error[E001]: type mismatch in match arm: expected (String, JVal) but got Option[?5]
  --> /tmp/dojo-mini-json-query-3.almd:11:8
  in match arm
  here: _ => none,
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
11 |   _ => none,
   |        ^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got (String, JVal)
  --> /tmp/dojo-mini-json-query-3.almd:11:8
  in fn 'jget'
  here: _ => none,
  hint: Fix the expression type or change the expected type
   |
11 |   _ => none,
   |        ^^^^

7 error(s) found
FAILED: /tmp/dojo-mini-json-query-3.almd
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
