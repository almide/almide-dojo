# mini-json-query

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs |> list.sum { jcount }
    JObj(xs) => xs |> list.sum { jcount }
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map { jflatten_strings }
    JObj(xs) => xs |> list.flat_map { jflatten_strings }
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error: Expected pattern at line 3:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-0.almd:3:33
  here: JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
  |                                 ^
error: Expected pattern at line 13:32 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-0.almd:13:32
  here: JArr(xs) => xs |> list.sum { jcount }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
13 |     JArr(xs) => xs |> list.sum { jcount }
   |                                ^
error: Expected pattern at line 20:37 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-0.almd:20:37
  here: JArr(xs) => xs |> list.flat_map { jflatten_strings }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |     JArr(xs) => xs |> list.flat_map { jflatten_strings }
   |                                     ^
error[E029]: unknown type 'JVal'
  --> /tmp/dojo-mini-json-query-0.almd:1:14
  in parameter 'obj'
  here: fn jget(obj: JVal, key: String) -> Option[JVal] =
  hint: no `type JVal` is declared (or imported) in this program — declare it, or check the spelling
  |
1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
  |              ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:27:53
  in call to JNum()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
27 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                     ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:27:69
  in call to JNum()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
27 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                     ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:27:69
  in call to JObj()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
27 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                     ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:27:36
  in call to jget()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
27 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                    ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:27:92
  in call to JNum()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
27 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:28:57
  in call to JNum()
  here: test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
28 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                         ^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:28:57
  in call to JObj()
  here: test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
28 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                                         ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:28:40
  in call to jget()
  here: test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
28 | test "jget not found" { assert_eq(jget(JObj([("a", JNum(1))]), "z"), none) }
   |                                        ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:29:43
  in call to JNum()
  here: test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
29 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                           ^
error[E005]: argument 'obj' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:29:38
  in call to jget()
  here: test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
29 | test "jget not obj" { assert_eq(jget(JNum(1), "a"), none) }
   |                                      ^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:30:45
  in call to JObj()
  here: test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
30 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                             ^
error[E005]: argument 'obj' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:30:40
  in call to jget()
  here: test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jget[JVal](...)
   |
 1 | fn jget(obj: JVal, key: String) -> Option[JVal] =
   | ---------------------- fn jget() defined here
...
30 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                        ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:31:48
  in call to JNum()
  here: test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
31 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                                ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:31:43
  in call to jcount()
  here: test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
31 | test "jcount leaf num" { assert_eq(jcount(JNum(1)), 1) }
   |                                           ^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:32:44
  in variable JNull
  here: test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
  hint: Check the variable name
   |
32 | test "jcount leaf null" { assert_eq(jcount(JNull), 1) }
   |                                            ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:33:48
  in call to JStr()
  here: test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
33 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                                ^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:33:43
  in call to jcount()
  here: test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
33 | test "jcount leaf str" { assert_eq(jcount(JStr("x")), 1) }
   |                                           ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:34:49
  in call to JNum()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
34 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                 ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:34:58
  in call to JNum()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
34 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                          ^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:34:67
  in call to JNum()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
34 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:34:67
  in call to JArr()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
34 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                                                   ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:34:38
  in call to jcount()
  here: test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
34 | test "jcount arr" { assert_eq(jcount(JArr([JNum(1), JNum(2), JNum(3)])), 3) }
   |                                      ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:35:64
  in call to JNum()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                ^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:35:68
  in variable JNull
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: Check the variable name
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:35:68
  in call to JArr()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                    ^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:35:89
  in call to JStr()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:35:89
  in call to JObj()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:35:41
  in call to jcount()
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                         ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:36:49
  in call to JArr()
  here: test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
36 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:36:44
  in call to jcount()
  here: test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jcount[JVal](...)
   |
 7 | fn jcount(val: JVal) -> Int =
   | ------------------------ fn jcount() defined here
...
36 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                            ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:37:68
  in call to JStr()
  here: test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
37 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E005]: argument 'val' expects JVal but got JStr
  --> /tmp/dojo-mini-json-query-0.almd:37:63
  in call to jflatten_strings()
  here: test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
37 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                               ^^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:38:68
  in call to JNum()
  here: test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
38 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E005]: argument 'val' expects JVal but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:38:63
  in call to jflatten_strings()
  here: test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
38 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                               ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:39:75
  in call to JStr()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                           ^^^
error[E003]: unknown type or constructor 'JNum' in call position
  --> /tmp/dojo-mini-json-query-0.almd:39:86
  in call to JNum()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JNum' is in scope. Check the spelling or add the missing import.
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:39:95
  in call to JStr()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:39:95
  in call to JArr()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:39:64
  in call to jflatten_strings()
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                ^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:78
  in call to JStr()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                              ^^^^^^^
error[E003]: unknown type or constructor 'JStr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:106
  in call to JStr()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JStr' is in scope. Check the spelling or add the missing import.
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                          ^^^^^^^
error[E003]: undefined variable 'JNull'
  --> /tmp/dojo-mini-json-query-0.almd:40:116
  in variable JNull
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: Check the variable name
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:116
  in call to JArr()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E003]: unknown type or constructor 'JObj' in call position
  --> /tmp/dojo-mini-json-query-0.almd:40:116
  in call to JObj()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: No type, variant constructor, or opaque alias named 'JObj' is in scope. Check the spelling or add the missing import.
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E005]: argument 'val' expects JVal but got JObj
  --> /tmp/dojo-mini-json-query-0.almd:40:61
  in call to jflatten_strings()
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                             ^^^^
error[E003]: unknown type or constructor 'JArr' in call position
  --> /tmp/dojo-mini-json-query-0.almd:41:65
  in call to JArr()
  here: test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
  hint: No type, variant constructor, or opaque alias named 'JArr' is in scope. Check the spelling or add the missing import.
   |
41 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E005]: argument 'val' expects JVal but got JArr
  --> /tmp/dojo-mini-json-query-0.almd:41:60
  in call to jflatten_strings()
  here: test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
  hint: 'JVal' is not a known type. To use it as a type parameter, declare it: fn jflatten_strings[JVal](...)
   |
17 | fn jflatten_strings(val: JVal) -> List[String] =
   | ---------------------------------- fn jflatten_strings() defined here
...
41 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                            ^^^^
error[E001]: type mismatch in call to assert_eq(): expected Option[JVal] but got Option[JNum]
  --> /tmp/dojo-mini-json-query-0.almd:27:92
  in call to assert_eq()
  here: test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
  hint: Fix the expression type or change the expected type
   |
27 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   |                                                                                            ^
error[E001]: type mismatch in list element: expected (String, JArr) but got (String, JStr)
  --> /tmp/dojo-mini-json-query-0.almd:35:89
  in list element
  here: test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
  hint: Fix the expression type or change the expected type
   |
35 | test "jcount nested" { assert_eq(jcount(JObj([("a", JArr([JNum(1), JNull])), ("b", JStr("x"))])), 3) }
   |                                                                                         ^^^
error[E001]: type mismatch in list element: expected JStr but got JNum
  --> /tmp/dojo-mini-json-query-0.almd:39:86
  in list element
  here: test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
  hint: Fix the expression type or change the expected type
   |
39 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                      ^
error[E001]: type mismatch in list element: expected (String, JStr) but got (String, JArr)
  --> /tmp/dojo-mini-json-query-0.almd:40:116
  in list element
  here: test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
  hint: Fix the expression type or change the expected type
   |
40 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:30:45
  in empty list `[]` with no element-type context
  here: test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
30 | test "jget empty obj" { assert_eq(jget(JObj([]), "a"), none) }
   |                                             ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:36:49
  in empty list `[]` with no element-type context
  here: test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
36 | test "jcount empty arr" { assert_eq(jcount(JArr([])), 0) }
   |                                                 ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-mini-json-query-0.almd:41:65
  in empty list `[]` with no element-type context
  here: test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
   |
41 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^

58 error(s) found
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
    JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs |> list.sum { jcount }
    JObj(xs) => xs |> list.sum { jcount }
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map { jflatten_strings }
    JObj(xs) => xs |> list.flat_map { jflatten_strings }
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error: Expected pattern at line 11:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-1.almd:11:33
  here: JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
   |                                 ^
error: Expected pattern at line 21:32 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-1.almd:21:32
  here: JArr(xs) => xs |> list.sum { jcount }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     JArr(xs) => xs |> list.sum { jcount }
   |                                ^
error: Expected pattern at line 28:37 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-1.almd:28:37
  here: JArr(xs) => xs |> list.flat_map { jflatten_strings }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     JArr(xs) => xs |> list.flat_map { jflatten_strings }
   |                                     ^

3 error(s) found
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
    JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs |> list.map { jcount } |> list.sum
    JObj(xs) => xs |> list.map { jcount } |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map { jflatten_strings }
    JObj(xs) => xs |> list.flat_map { jflatten_strings }
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error: Expected pattern at line 11:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-2.almd:11:33
  here: JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { (_, v) -> v }
   |                                 ^
error: Expected pattern at line 21:32 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-2.almd:21:32
  here: JArr(xs) => xs |> list.map { jcount } |> list.sum
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     JArr(xs) => xs |> list.map { jcount } |> list.sum
   |                                ^
error: Expected pattern at line 28:37 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-2.almd:28:37
  here: JArr(xs) => xs |> list.flat_map { jflatten_strings }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     JArr(xs) => xs |> list.flat_map { jflatten_strings }
   |                                     ^

3 error(s) found
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
    JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { some(v) }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => xs |> list.map { jcount } |> list.sum
    JObj(xs) => xs |> list.map { jcount } |> list.sum
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => xs |> list.flat_map { jflatten_strings }
    JObj(xs) => xs |> list.flat_map { jflatten_strings }
    _ => []
  }

effect fn main() -> Unit = {}
```

**Diagnostic:**

```
error: Expected pattern at line 11:33 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-3.almd:11:33
  here: JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { some(v) }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |     JObj(xs) => xs |> list.find { (k, v) -> k == key } |> option.map { some(v) }
   |                                 ^
error: Expected pattern at line 21:32 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-3.almd:21:32
  here: JArr(xs) => xs |> list.map { jcount } |> list.sum
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
21 |     JArr(xs) => xs |> list.map { jcount } |> list.sum
   |                                ^
error: Expected pattern at line 28:37 (got LBrace '{')
  --> /tmp/dojo-mini-json-query-3.almd:28:37
  here: JArr(xs) => xs |> list.flat_map { jflatten_strings }
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
28 |     JArr(xs) => xs |> list.flat_map { jflatten_strings }
   |                                     ^

3 error(s) found
FAILED: /tmp/dojo-mini-json-query-3.almd
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
