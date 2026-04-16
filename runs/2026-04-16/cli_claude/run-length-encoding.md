# run-length-encoding

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn encode_helper(chars: List[String], curr: String, cnt: Int, acc: String) -> String =
  match list.first(chars) {
    none => if cnt == 0 then acc else acc + int.to_string(cnt) + curr,
    some(c) =>
      if cnt == 0 then encode_helper(list.drop(chars, 1), c, 1, acc)
      else if c == curr then encode_helper(list.drop(chars, 1), curr, cnt + 1, acc)
      else encode_helper(list.drop(chars, 1), c, 1, acc + int.to_string(cnt) + curr)
  }

fn rle_encode(s: String) -> String = encode_helper(string.chars(s), "", 0, "")

fn decode_helper(chars: List[String], acc: String) -> String =
  match list.first(chars) {
    none => acc,
    some(digit) =>
      match int.parse(digit) {
        ok(n) => match list.get(chars, 1) {
          some(ch) => decode_helper(list.drop(chars, 2), acc + string.repeat(ch, n)),
          none => acc
        },
        err(_) => acc
      }
  }

fn rle_decode(s: String) -> String = decode_helper(string.chars(s), "")
```
