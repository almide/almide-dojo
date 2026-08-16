# mini-json-query

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

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
      list.find(pairs, (pair) => pair.0 == key)
        |> option.map((pair) => pair.1),
    _ => none
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1,
    JBool(_) => 1,
    JNum(_) => 1,
    JStr(_) => 1,
    JArr(items) => list.sum(list.map(items, (item) => jcount(item))),
    JObj(pairs) => list.sum(list.map(pairs, (pair) => jcount(pair.1)))
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JNull => [],
    JBool(_) => [],
    JNum(_) => [],
    JStr(s) => [s],
    JArr(items) => list.flat_map(items, (item) => jflatten_strings(item)),
    JObj(pairs) => list.flat_map(pairs, (pair) => jflatten_strings(pair.1))
  }

effect fn main() -> Unit = {}
```
