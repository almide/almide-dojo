import gleam/list
import gleam/string

pub fn title_case(s: String) -> String {
  string.split(s, " ")
  |> list.map(fn(w) {
    string.uppercase(string.slice(w, 0, 1)) <> string.lowercase(string.drop_start(w, 1))
  })
  |> string.join(" ")
}
