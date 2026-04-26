# mini-json-query

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
    JObj(pairs) => 
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-0.almd
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:62:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
62 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:66:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
66 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:70:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
70 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:76:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
76 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-0.almd:81:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
81 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

5 error(s) found
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
    JObj(pairs) => 
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-1.almd
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:62:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
62 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:66:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
66 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:70:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
70 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:76:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
76 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-1.almd:81:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
81 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

5 error(s) found
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
    JObj(pairs) => 
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-2.almd
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:62:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
62 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:66:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
66 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:70:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
70 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:76:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
76 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-2.almd:81:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
81 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

5 error(s) found
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
    JObj(pairs) => 
      list.find(pairs, (x) => string.eq(x.0, key)) 
      |> option.map((x) => x.1)
    _ => none
  }

fn jcount(val: JVal) -> Int = 
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(xs) => list.sum(list.map(xs, jcount))
    JObj(pairs) => list.sum(list.map(pairs, (x) => jcount(x.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] = 
  match val {
    JStr(s) => [s]
    JArr(xs) => list.flat_map(xs, jflatten_strings)
    JObj(pairs) => list
```

**Diagnostic:**

```
Compiling /tmp/dojo-mini-json-query-3.almd
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:62:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
62 |   assert_eq(jflatten_strings(JStr("hi")), ["hi"])
   |                                   ^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:66:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
66 |   assert_eq(jflatten_strings(JNum(1)), [])
   |                                   ^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:70:61
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
70 |   assert_eq(jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")])), ["a", "b"])
   |                                                             ^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:76:32
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
76 |     ("y", JArr([JStr("world"), JNull]))
   |                                ^^^^^
error[E002]: undefined function 'jflatten_strings'
  --> /tmp/dojo-mini-json-query-3.almd:81:35
  in call to jflatten_strings()
  hint: Did you mean `float.to_string`?
  try:
      // jflatten_strings(...)  →  float.to_string(...)
      float.to_string(...)
   |
81 |   assert_eq(jflatten_strings(JArr([])), [])
   |                                   ^

5 error(s) found
Compile error for /tmp/dojo-mini-json-query-3.almd:
compile failed
FAILED: /tmp/dojo-mini-json-query-3.almd

1/1 test file(s) failed

```
