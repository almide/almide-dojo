import gleam/list
import gleam/string

fn letters(s: String) -> List(String) {
  string.lowercase(s)
  |> string.to_graphemes
  |> list.filter(fn(c) { c != " " })
  |> list.sort(string.compare)
}

pub fn is_anagram(a: String, b: String) -> Bool {
  letters(a) == letters(b)
}
