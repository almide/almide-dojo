fn go(n: Int, table: List(#(Int, String))) -> String {
  case n, table {
    0, _ -> ""
    _, [] -> ""
    _, [#(v, sym), ..rest] ->
      case n >= v {
        True -> sym <> go(n - v, table)
        False -> go(n, rest)
      }
  }
}

pub fn to_roman(n: Int) -> String {
  go(n, [
    #(1000, "M"), #(900, "CM"), #(500, "D"), #(400, "CD"), #(100, "C"),
    #(90, "XC"), #(50, "L"), #(40, "XL"), #(10, "X"), #(9, "IX"),
    #(5, "V"), #(4, "IV"), #(1, "I"),
  ])
}
