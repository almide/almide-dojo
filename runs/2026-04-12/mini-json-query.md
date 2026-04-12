# mini-json-query

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 0

## Final code

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
      match list.find(pairs, (p) => p.0 == key) {
        some(p) => some(p.1)
        none => none
      }
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(items) => list.sum(list.map(items, (v) => jcount(v)))
    JObj(pairs) => list.sum(list.map(pairs, (p) => jcount(p.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JArr(items) => list.flat_map(items, (v) => jflatten_strings(v))
    JObj(pairs) => list.flat_map(pairs, (p) => jflatten_strings(p.1))
    _ => []
  }

effect fn main() -> Unit = {}
```
