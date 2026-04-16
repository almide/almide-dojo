# run-length-encoding

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn encode_helper(chars: List[String], cur: String, cnt: Int, acc: String) -> String =
  match list.first(chars) {
    none => if cnt == 0 then acc else acc + int.to_string(cnt) + cur,
    some(c) => {
      let rest = list.drop(chars, 1)
      if cnt == 0 then encode_helper(rest, c, 1, acc)
      else if c == cur then encode_helper(rest, cur, cnt + 1, acc)
      else encode_helper(rest, c, 1, acc + int.to_string(cnt) + cur)
    }
  }

fn rle_encode(s: String) -> String =
  encode_helper(string.chars(s), "", 0, "")

fn decode_helper(chars: List[String], acc: String) -> String =
  match list.first(chars) {
    none => acc,
    some(d) => {
      let rest = list.drop(chars, 1)
      match list.first(rest) {
        none => acc,
        some(c) => {
          let n = int.parse(d) |> result.unwrap_or(0)
          decode_helper(list.drop(rest, 1), acc + string.repeat(c, n))
        }
      }
    }
  }

fn rle_decode(s: String) -> String =
  decode_helper(string.chars(s), "")
```
