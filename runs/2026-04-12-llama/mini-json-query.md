# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd
error: Expected pattern at line 32:1 (got Test 'test')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:32:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
32 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^
error[E002]: undefined function 'jflatten_strings'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:42:68
  in call to jflatten_strings()
  hint: Check the function name
   |
42 | test "jflatten_strings leaf str" { assert_eq(jflatten_strings(JStr("hi")), ["hi"]) }
   |                                                                    ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:43:68
  in call to jflatten_strings()
  hint: Check the function name
   |
43 | test "jflatten_strings leaf num" { assert_eq(jflatten_strings(JNum(1)), []) }
   |                                                                    ^
error[E002]: undefined function 'jflatten_strings'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:44:95
  in call to jflatten_strings()
  hint: Check the function name
   |
44 | test "jflatten_strings arr mixed" { assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"]) }
   |                                                                                               ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:45:116
  in call to jflatten_strings()
  hint: Check the function name
   |
45 | test "jflatten_strings nested" { assert_eq(jflatten_strings(JObj([("x", JStr("hello")), ("y", JArr([JStr("world"), JNull]))])), ["hello", "world"]) }
   |                                                                                                                    ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:46:65
  in call to jflatten_strings()
  hint: Check the function name
   |
46 | test "jflatten_strings empty" { assert_eq(jflatten_strings(JArr([])), []) }
   |                                                                 ^
error[E001]: type mismatch in pipe call: expected fn(fn(fn(?2) -> Unknown) -> ?3) -> Option[?4] but got fn(Option[(String, JVal)]) -> Option[JVal]
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:13:46
  in pipe call
  hint: Fix the expression type or change the expected type
   |
13 |       |> (x) => x.map((entry) => entry.1) ?? none
   |                                              ^^^^

7 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-mini-json-query-3.almd

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
    JObj(entries) =>
      list.find(entries, (entry) => entry.0 == key)
      |> (x) => x.map((entry) => entry.1) ?? none
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.fold(xs, 0, (acc, x) => acc + jcount(x))
    JObj(entries) => list.fold(entries.map((entry) => entry.1), 0, (acc, x) => acc + jcount(x))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(xs) => list
```
