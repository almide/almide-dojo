import gleam/string

fn go(cs: List(String), stack: List(String)) -> Bool {
  case cs {
    [] -> stack == []
    [c, ..rest] ->
      case c {
        "(" -> go(rest, [")", ..stack])
        "[" -> go(rest, ["]", ..stack])
        "{" -> go(rest, ["}", ..stack])
        ")" | "]" | "}" ->
          case stack {
            [top, ..below] if top == c -> go(rest, below)
            _ -> False
          }
        _ -> go(rest, stack)
      }
  }
}

pub fn is_balanced(s: String) -> Bool {
  go(string.to_graphemes(s), [])
}
