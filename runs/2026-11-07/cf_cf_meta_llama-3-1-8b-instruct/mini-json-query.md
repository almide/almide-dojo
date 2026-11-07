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
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, (x) => match x {
      (k, v) => if k == key then some(v) else none
    }) ?? none
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.flat_map((x) => match x {
      (k, v) => list.some(jcount(v))
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.some(s)
    JArr(xs) => list.flat_map(xs.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
      (k, v) => list.some(jflatten_strings(v))
    }))
    _ => list.none()
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E029]: unknown type 'JVal'
  --> /tmp/dojo-mini-json-query-0.almd:1:14
  in parameter 'obj'
  here: fn jget(obj: JVal, key: String) -> Option[JVal] =
  hint: no `type JVal` is declared (or imported) in this program — declare it, or check the spelling
  |
1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
  |              ^^^^
error[E005]: argument 'f' expects fn((String, ?4)) -> Bool but got fn((String, ?4)) -> Option[?4]
  --> /tmp/dojo-mini-json-query-0.almd:3:31
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
  |
3 |     JObj(xs) => list.find(xs, (x) => match x {
  |                               ^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-0.almd:17:17
  in call to list.some()
  here: (k, v) => list.some(jcount(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
17 |       (k, v) => list.some(jcount(v))
   |                 ^^^^^^^^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-0.almd:23:16
  in call to list.some()
  here: JStr(s) => list.some(s)
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
23 |     JStr(s) => list.some(s)
   |                ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-0.almd:24:31
  in call to list.flat_map()
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
24 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                               ^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-0.almd:26:17
  in call to list.some()
  here: (k, v) => list.some(jflatten_strings(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
26 |       (k, v) => list.some(jflatten_strings(v))
   |                 ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-0.almd:25:31
  in call to list.flat_map()
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
25 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                               ^^
error[E002]: undefined function 'list.none'
  --> /tmp/dojo-mini-json-query-0.almd:28:10
  in call to list.none()
  here: _ => list.none()
  hint: No function 'none' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
28 |     _ => list.none()
   |          ^^^^^^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:33:53
  in call to JNum()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                     ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:33:69
  in call to JNum()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                     ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:33:69
  in call to JObj()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                     ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:33:36
  in call to jget()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                    ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:33:92
  in call to JNum()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:34:57
  in call to JNum()
  here: test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
34 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                         ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:34:57
  in call to JObj()
  here: test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
34 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                         ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:34:40
  in call to jget()
  here: test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
34 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                        ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:35:43
  in call to JNum()
  here: test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
35 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                           ^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:35:38
  in call to jget()
  here: test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
35 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                      ^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:36:45
  in call to JObj()
  here: test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
36 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                             ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:36:40
  in call to jget()
  here: test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
36 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                        ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:37:48
  in call to JNum()
  here: test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
37 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:37:43
  in call to jcount()
  here: test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 9 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
37 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                           ^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:38:44
  in variable JNull
  here: test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
  hint: Check the variable name
   |
38 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:39:48
  in call to JStr()
  here: test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
39 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:39:43
  in call to jcount()
  here: test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 9 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
39 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                           ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:49
  in call to JNum()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
40 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                 ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:58
  in call to JNum()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
40 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                          ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:67
  in call to JNum()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
40 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:67
  in call to JArr()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
40 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:40:38
  in call to jcount()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 9 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
40 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                      ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:64
  in call to JNum()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                ^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in variable JNull
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: Check the variable name
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:68
  in call to JArr()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:89
  in call to JStr()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:89
  in call to JObj()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:41:41
  in call to jcount()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 9 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                         ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:42:49
  in call to JArr()
  here: test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
42 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:42:44
  in call to jcount()
  here: test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 9 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
42 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                            ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:43:68
  in call to JStr()
  here: test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
43 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:43:63
  in call to jflatten_strings()
  here: test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
43 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                               ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:44:68
  in call to JNum()
  here: test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
44 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:44:63
  in call to jflatten_strings()
  here: test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
44 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                               ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:45:75
  in call to JStr()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                           ^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:45:86
  in call to JNum()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:45:95
  in call to JStr()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:45:95
  in call to JArr()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:45:64
  in call to jflatten_strings()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:46:78
  in call to JStr()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                              ^^^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:46:106
  in call to JStr()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                          ^^^^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in variable JNull
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: Check the variable name
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in call to JArr()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in call to JObj()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:46:61
  in call to jflatten_strings()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                             ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:47:65
  in call to JArr()
  here: test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
47 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:47:60
  in call to jflatten_strings()
  here: test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
21 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
47 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                            ^^^^
error[E001]: type mismatch in ?? fallback: expected (String, ?4) but got Option[?6]
  --> /tmp/dojo-mini-json-query-0.almd:5:11
  in ?? fallback
  here: }) ?? none
  hint: Fix the expression type or change the expected type
  |
5 |     }) ?? none
  |           ^^^^
error[E001]: type mismatch in match arm: expected Option[JVal] but got (String, ?4) — Option[JVal] is the declared return type, and the arm at line 6 produces it
  --> /tmp/dojo-mini-json-query-0.almd:5:8
  in match arm
  here: }) ?? none
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
5 |     }) ?? none
  |        ^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:33:92
  in call to assert_eq()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: Fix the expression type or change the expected type
   |
33 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:41:89
  in list element
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: Fix the expression type or change the expected type
   |
41 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:45:86
  in list element
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: Fix the expression type or change the expected type
   |
45 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:46:116
  in list element
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: Fix the expression type or change the expected type
   |
46 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:36:45
  in empty list `[]` with no element-type context
  here: test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
36 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                             ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:42:49
  in empty list `[]` with no element-type context
  here: test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
42 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:47:65
  in empty list `[]` with no element-type context
  here: test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
47 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E025]: cannot infer a concrete type for this expression (type List[?18])
  --> /tmp/dojo-mini-json-query-0.almd:24:31
  in this expression with an unconstrained type
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                               ^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?19])
  --> /tmp/dojo-mini-json-query-0.almd:24:17
  in this expression with an unconstrained type
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?26])
  --> /tmp/dojo-mini-json-query-0.almd:25:42
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
25 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                                          ^
error[E025]: cannot infer a concrete type for this expression (type List[?27])
  --> /tmp/dojo-mini-json-query-0.almd:25:30
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
25 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                              ^

68 error(s) found
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
    JObj(xs) => list.find(xs, (x) => match x {
      (k, v) => if k == key then some(v) else none
    })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.flat_map((x) => match x {
      (k, v) => list.some(jcount(v))
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.some(s)
    JArr(xs) => list.flat_map(xs.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
      (k, v) => list.some(jflatten_strings(v))
    }))
    _ => list.none()
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-1.almd:11:31
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
   |
11 |     JObj(xs) => list.find(xs, (x) => match x {
   |                               ^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-1.almd:25:17
  in call to list.some()
  here: (k, v) => list.some(jcount(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
25 |       (k, v) => list.some(jcount(v))
   |                 ^^^^^^^^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-1.almd:31:16
  in call to list.some()
  here: JStr(s) => list.some(s)
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
31 |     JStr(s) => list.some(s)
   |                ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-1.almd:32:31
  in call to list.flat_map()
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
32 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                               ^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-1.almd:34:17
  in call to list.some()
  here: (k, v) => list.some(jflatten_strings(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
34 |       (k, v) => list.some(jflatten_strings(v))
   |                 ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-1.almd:33:31
  in call to list.flat_map()
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                               ^^
error[E002]: undefined function 'list.none'
  --> /tmp/dojo-mini-json-query-1.almd:36:10
  in call to list.none()
  here: _ => list.none()
  hint: No function 'none' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
36 |     _ => list.none()
   |          ^^^^^^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-1.almd:11:26
  in fn 'jget'
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the expression type or change the expected type
   |
11 |     JObj(xs) => list.find(xs, (x) => match x {
   |                          ^
error[E025]: cannot infer a concrete type for this expression (type List[?10])
  --> /tmp/dojo-mini-json-query-1.almd:32:17
  in this expression with an unconstrained type
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
32 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?16])
  --> /tmp/dojo-mini-json-query-1.almd:33:42
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                                          ^
error[E025]: cannot infer a concrete type for this expression (type List[?17])
  --> /tmp/dojo-mini-json-query-1.almd:33:30
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                              ^

11 error(s) found
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
    JObj(xs) => list.find(xs, (x) => match x {
      (k, v) => if k == key then some(v) else none
    })?.map((x) => x)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.flat_map((x) => match x {
      (k, v) => list.some(jcount(v))
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.some(s)
    JArr(xs) => list.flat_map(xs.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
      (k, v) => list.some(jflatten_strings(v))
    }))
    _ => list.none()
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-2.almd:11:31
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
   |
11 |     JObj(xs) => list.find(xs, (x) => match x {
   |                               ^
error[E013]: cannot access field 'map' on type (String, JVal)
  --> /tmp/dojo-mini-json-query-2.almd:11:31
  in field map
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Optional chaining requires a record type inside Option
   |
11 |     JObj(xs) => list.find(xs, (x) => match x {
   |                               ^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-2.almd:25:17
  in call to list.some()
  here: (k, v) => list.some(jcount(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
25 |       (k, v) => list.some(jcount(v))
   |                 ^^^^^^^^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-2.almd:31:16
  in call to list.some()
  here: JStr(s) => list.some(s)
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
31 |     JStr(s) => list.some(s)
   |                ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-2.almd:32:31
  in call to list.flat_map()
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
32 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                               ^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-2.almd:34:17
  in call to list.some()
  here: (k, v) => list.some(jflatten_strings(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
34 |       (k, v) => list.some(jflatten_strings(v))
   |                 ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-2.almd:33:31
  in call to list.flat_map()
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                               ^^
error[E002]: undefined function 'list.none'
  --> /tmp/dojo-mini-json-query-2.almd:36:10
  in call to list.none()
  here: _ => list.none()
  hint: No function 'none' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
36 |     _ => list.none()
   |          ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?14])
  --> /tmp/dojo-mini-json-query-2.almd:32:17
  in this expression with an unconstrained type
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
32 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?20])
  --> /tmp/dojo-mini-json-query-2.almd:33:42
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                                          ^
error[E025]: cannot infer a concrete type for this expression (type List[?21])
  --> /tmp/dojo-mini-json-query-2.almd:33:30
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                              ^

11 error(s) found
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
    JObj(xs) => list.find(xs, (x) => match x {
      (k, v) => if k == key then some(v) else none
    })
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(xs.map(jcount))
    JObj(xs) => list.sum(xs.flat_map((x) => match x {
      (k, v) => list.some(jcount(v))
    }))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => list.some(s)
    JArr(xs) => list.flat_map(xs.map(jflatten_strings))
    JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
      (k, v) => list.some(jflatten_strings(v))
    }))
    _ => list.none()
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn((String, JVal)) -> Bool but got fn((String, JVal)) -> Option[JVal]
  --> /tmp/dojo-mini-json-query-3.almd:11:31
  in call to list.find()
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the argument type
   |
11 |     JObj(xs) => list.find(xs, (x) => match x {
   |                               ^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-3.almd:25:17
  in call to list.some()
  here: (k, v) => list.some(jcount(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
25 |       (k, v) => list.some(jcount(v))
   |                 ^^^^^^^^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-3.almd:31:16
  in call to list.some()
  here: JStr(s) => list.some(s)
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
31 |     JStr(s) => list.some(s)
   |                ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-3.almd:32:31
  in call to list.flat_map()
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
32 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                               ^^
error[E002]: undefined function 'list.some'
  --> /tmp/dojo-mini-json-query-3.almd:34:17
  in call to list.some()
  here: (k, v) => list.some(jflatten_strings(v))
  hint: Did you mean `list.sort`?
  try:
      list.sort
   |
34 |       (k, v) => list.some(jflatten_strings(v))
   |                 ^^^^^^^^^
error[E004]: list.flat_map() expects 2 argument(s) but got 1
  --> /tmp/dojo-mini-json-query-3.almd:33:31
  in call to list.flat_map()
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Check the number of arguments
  try:
      // list.flat_map() takes 2 arg(s) — you passed 1
      list.flat_map(<xs: List[A]>, <f: fn(A) -> List[B]>)
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                               ^^
error[E002]: undefined function 'list.none'
  --> /tmp/dojo-mini-json-query-3.almd:36:10
  in call to list.none()
  here: _ => list.none()
  hint: No function 'none' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
36 |     _ => list.none()
   |          ^^^^^^^^^
error[E001]: type mismatch in fn 'jget': expected Option[JVal] but got Option[(String, JVal)]
  --> /tmp/dojo-mini-json-query-3.almd:11:26
  in fn 'jget'
  here: JObj(xs) => list.find(xs, (x) => match x {
  hint: Fix the expression type or change the expected type
   |
11 |     JObj(xs) => list.find(xs, (x) => match x {
   |                          ^
error[E025]: cannot infer a concrete type for this expression (type List[?10])
  --> /tmp/dojo-mini-json-query-3.almd:32:17
  in this expression with an unconstrained type
  here: JArr(xs) => list.flat_map(xs.map(jflatten_strings))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
32 |     JArr(xs) => list.flat_map(xs.map(jflatten_strings))
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[?16])
  --> /tmp/dojo-mini-json-query-3.almd:33:42
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                                          ^
error[E025]: cannot infer a concrete type for this expression (type List[?17])
  --> /tmp/dojo-mini-json-query-3.almd:33:30
  in this expression with an unconstrained type
  here: JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
33 |     JObj(xs) => list.flat_map(xs.flat_map((x) => match x {
   |                              ^

11 error(s) found
FAILED: /tmp/dojo-mini-json-query-3.almd
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
