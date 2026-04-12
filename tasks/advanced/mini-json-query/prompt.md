Define a simple JSON-like value type and write query functions on it.

Define this exact type:

    type JVal =
      | JNull
      | JBool(Bool)
      | JNum(Int)
      | JStr(String)
      | JArr(List[JVal])
      | JObj(List[(String, JVal)])

Write functions with these exact signatures:

    fn jget(obj: JVal, key: String) -> Option[JVal]
    fn jcount(val: JVal) -> Int
    fn jflatten_strings(val: JVal) -> List[String]

Behavior:

**`jget`**: Look up a key in a `JObj`.
- `jget(JObj([("a", JNum(1))]), "a")` returns `some(JNum(1))`
- Returns `none` if key not found or val is not `JObj`

**`jcount`**: Count the total number of leaf values (JNull, JBool, JNum, JStr) in a nested structure.
- `jcount(JNum(1))` returns `1`
- `jcount(JArr([JNum(1), JNum(2)]))` returns `2`
- `jcount(JObj([("a", JArr([JNum(1), JNull]))]))` returns `2`

**`jflatten_strings`**: Collect all `JStr` values from a nested structure, depth-first.
- `jflatten_strings(JStr("hi"))` returns `["hi"]`
- `jflatten_strings(JNum(1))` returns `[]`
- `jflatten_strings(JArr([JStr("a"), JNum(1), JStr("b")]))` returns `["a", "b"]`

Notes:

- Use `match` with pattern matching on each variant.
- For `JArr` and `JObj`, recurse into children using `list.map` + `list.sum` or `list.flat_map`.
- `JObj` uses a list of tuples `(String, JVal)` rather than `Map` for simplicity.
- You must also include an empty main function: `effect fn main() -> Unit = {}`
