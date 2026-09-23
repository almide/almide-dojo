import gleam/list
import gleam/string

pub fn count_vowels(s: String) -> Int {
  string.to_graphemes(s)
  |> list.filter(fn(c) { string.contains("aeiou", c) })
  |> list.length
}
