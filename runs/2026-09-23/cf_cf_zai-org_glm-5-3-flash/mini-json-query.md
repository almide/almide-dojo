# mini-json-query

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
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

fn jget_pair(p: (String, JVal), key: String) -> Option[JVal] =
  match p {
    (k, v) => if k == key then some(v) else none
  }

fn jget(obj: JVal, key: String) -> Option[JVal] =
  match obj {
    JObj(pairs) => list.first(list.filter_map(pairs, (p) => jget_pair(p, key)))
    _ => none
  }

fn jcount_pair(p: (String, JVal)) -> Int =
  match p {
    (_, v) => jcount(v)
  }

fn jcount(val: JVal) -> Int =
  match val {
    JNull => 1
    JBool(_) => 1
    JNum(_) => 1
    JStr(_) => 1
    JArr(items) => list.sum(list.map(items, (x) => jcount(x)))
    JObj(pairs) => list.sum(list.map(pairs, (p) => jcount_pair(p)))
  }

fn jflatten_pair(p: (String, JVal)) -> List[String] =
  match p {
    (_, v) => jflatten_strings(v)
  }

fn jflatten_strings(val: JVal) -> List[String] =
  match val {
    JStr(s) => [s]
    JNull => []
    JBool(_) => []
    JNum(_) => []
    JArr(items) => list.flat_map(items, (x) => jflatten_strings(x))
    JObj(pairs) => list.flat_map(pairs, (p) => jflatten_pair(p))
  }

effect fn main() -> Unit = {}
```
