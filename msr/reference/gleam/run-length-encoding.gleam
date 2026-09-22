import gleam/int
import gleam/list
import gleam/string

pub fn rle_encode(s: String) -> String {
  string.to_graphemes(s)
  |> list.chunk(fn(c) { c })
  |> list.map(fn(group) {
    case group {
      [c, ..] -> int.to_string(list.length(group)) <> c
      [] -> ""
    }
  })
  |> string.concat
}

fn dec(cs: List(String)) -> String {
  case cs {
    [d, c, ..rest] -> {
      let n = case int.parse(d) {
        Ok(v) -> v
        Error(_) -> 0
      }
      string.repeat(c, n) <> dec(rest)
    }
    _ -> ""
  }
}

pub fn rle_decode(s: String) -> String {
  dec(string.to_graphemes(s))
}
