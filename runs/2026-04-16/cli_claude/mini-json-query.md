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

fn jget(obj: JVal, key: String) -> Option[JVal] = match obj {
  JObj(pairs) => option.map(list.find(pairs, ((p)) => p.0 == key), ((p)) => p.1),
  _ => none,
}

fn jcount(val: JVal) -> Int = match val {
  JNull => 1,
  JBool(_) => 1,
  JNum(_) => 1,
  JStr(_) => 1,
  JArr(xs) => list.sum(list.map(xs, (x) => jcount(x))),
  JObj(pairs) => list.sum(list.map(pairs, ((p)) => jcount(p.1))),
}

fn jflatten_strings(val: JVal) -> List[String] = match val {
  JNull => [],
  JBool(_) => [],
  JNum(_) => [],
  JStr(s) => [s],
  JArr(xs) => list.flat_map(xs, (x) => jflatten_strings(x)),
  JObj(pairs) => list.flat_map(pairs, ((p)) => jflatten_strings(p.1)),
}

effect fn main() -> Unit = {}
```
