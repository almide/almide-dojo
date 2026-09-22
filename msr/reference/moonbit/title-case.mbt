fn title_case(s : String) -> String {
  let buf = StringBuilder()
  let mut start = true
  for c in s {
    if c == ' ' {
      buf.write_char(c)
      start = true
    } else {
      let lower = if c >= 'A' && c <= 'Z' { (c.to_int() + 32).unsafe_to_char() } else { c }
      let out = if start && lower >= 'a' && lower <= 'z' {
        (lower.to_int() - 32).unsafe_to_char()
      } else {
        lower
      }
      buf.write_char(out)
      start = false
    }
  }
  buf.to_string()
}
