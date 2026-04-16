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
  | JBool(Bool)
  | JNum(Int)
  | JStr(String)
  | JArr(List[JVal])
  | JObj(List[(String, JVal)])

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(_._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr homic => list.sum(homic, fn x => jcount(x))
    JObj homic => list.sum(homic, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr homic => list.flat_map(homic, jflatten_strings)
    JObj homic => list.flat_map(homic, fn (_, v) => jflatten_strings(v))
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-0.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(_._2)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(_._2)
   |                                  ^
error: Expected FatArrow at line 21:10 (got Ident 'homic')
  --> /tmp/dojo-mini-json-query-0.almd:21:10
   |
21 |     JArr homic => list.sum(homic, fn x => jcount(x))
   |          ^
error: Expected LParen at line 21:40 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-0.almd:21:40
   |
21 |     JArr homic => list.sum(homic, fn x => jcount(x))
   |                                        ^
error: Expected function name at line 22:38 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:22:38
   |
22 |     JObj homic => list.sum(homic, fn (_, v) => jcount(v))
   |                                      ^
error: Expected FatArrow at line 28:10 (got Ident 'homic')
  --> /tmp/dojo-mini-json-query-0.almd:28:10
   |
28 |     JArr homic => list.flat_map(homic, jflatten_strings)
   |          ^
error: Expected function name at line 29:43 (got LParen '(')
  --> /tmp/dojo-mini-json-query-0.almd:29:43
   |
29 |     JObj homic => list.flat_map(homic, fn (_, v) => jflatten_strings(v))
   |                                           ^

7 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(_._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr xs => list.sum(xs, fn x => jcount(x))
    JObj xs => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr xs => list.flat_map(xs, jflatten_strings)
    JObj xs => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
  }

effect fn main() -> Unit =
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-1.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(_._2)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(_._2)
   |                                  ^
error: Expected FatArrow at line 21:10 (got Ident 'xs')
  --> /tmp/dojo-mini-json-query-1.almd:21:10
   |
21 |     JArr xs => list.sum(xs, fn x => jcount(x))
   |          ^
error: Expected LParen at line 21:34 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-1.almd:21:34
   |
21 |     JArr xs => list.sum(xs, fn x => jcount(x))
   |                                  ^
error: Expected function name at line 22:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:22:32
   |
22 |     JObj xs => list.sum(xs, fn (_, v) => jcount(v))
   |                                ^
error: Expected FatArrow at line 28:10 (got Ident 'xs')
  --> /tmp/dojo-mini-json-query-1.almd:28:10
   |
28 |     JArr xs => list.flat_map(xs, jflatten_strings)
   |          ^
error: Expected function name at line 29:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-1.almd:29:37
   |
29 |     JObj xs => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                     ^
error: Expected expression at line 34:1 (got Test 'test')
  --> /tmp/dojo-mini-json-query-1.almd:34:1
   |
34 | test "jget found" { assert_eq(jget(JObj([("a", JNum(1)), ("b", JNum(2))]), "b"), some(JNum(2))) }
   | ^

8 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr xs => list.sum(xs, fn x => jcount(x))
    JObj xs => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr xs => list.flat_map(xs, jflatten_strings)
    JObj xs => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
  }

effect fn main()
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-2.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
   |                                  ^
error: Expected LParen at line 11:73 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-2.almd:11:73
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
   |                                                                         ^
error: Expected FatArrow at line 21:10 (got Ident 'xs')
  --> /tmp/dojo-mini-json-query-2.almd:21:10
   |
21 |     JArr xs => list.sum(xs, fn x => jcount(x))
   |          ^
error: Expected LParen at line 21:34 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-2.almd:21:34
   |
21 |     JArr xs => list.sum(xs, fn x => jcount(x))
   |                                  ^
error: Expected function name at line 22:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:22:32
   |
22 |     JObj xs => list.sum(xs, fn (_, v) => jcount(v))
   |                                ^
error: Expected FatArrow at line 28:10 (got Ident 'xs')
  --> /tmp/dojo-mini-json-query-2.almd:28:10
   |
28 |     JArr xs => list.flat_map(xs, jflatten_strings)
   |          ^
error: Expected function name at line 29:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-2.almd:29:37
   |
29 |     JObj xs => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                     ^
error: Expected Arrow at line 32:17 (got Newline '')
  --> /tmp/dojo-mini-json-query-2.almd:32:17
   |
32 | effect fn main()
   |                 ^

9 error(s) found
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
    JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr xs => list.sum(xs, fn x => jcount(x))
    JObj xs => list.sum(xs, fn (_, v) => jcount(v))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr xs => list.flat_map(xs, jflatten_strings)
    JObj xs => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
  }

effect fn main()
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error: Expected expression at line 11:31 (got Fn 'fn')
  --> /tmp/dojo-mini-json-query-3.almd:11:31
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
   |                               ^
error: Expected function name at line 11:34 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:11:34
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
   |                                  ^
error: Expected LParen at line 11:73 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:11:73
   |
11 |     JObj(xs) => list.find(xs, fn (k, v) => k == key) |> option.map(fn x => x._2)
   |                                                                         ^
error: Expected FatArrow at line 21:10 (got Ident 'xs')
  --> /tmp/dojo-mini-json-query-3.almd:21:10
   |
21 |     JArr xs => list.sum(xs, fn x => jcount(x))
   |          ^
error: Expected LParen at line 21:34 (got FatArrow '=>')
  --> /tmp/dojo-mini-json-query-3.almd:21:34
   |
21 |     JArr xs => list.sum(xs, fn x => jcount(x))
   |                                  ^
error: Expected function name at line 22:32 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:22:32
   |
22 |     JObj xs => list.sum(xs, fn (_, v) => jcount(v))
   |                                ^
error: Expected FatArrow at line 28:10 (got Ident 'xs')
  --> /tmp/dojo-mini-json-query-3.almd:28:10
   |
28 |     JArr xs => list.flat_map(xs, jflatten_strings)
   |          ^
error: Expected function name at line 29:37 (got LParen '(')
  --> /tmp/dojo-mini-json-query-3.almd:29:37
   |
29 |     JObj xs => list.flat_map(xs, fn (_, v) => jflatten_strings(v))
   |                                     ^
error: Expected Arrow at line 32:17 (got Newline '')
  --> /tmp/dojo-mini-json-query-3.almd:32:17
   |
32 | effect fn main()
   |                 ^

9 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
