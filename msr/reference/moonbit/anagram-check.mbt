fn letters(s : String) -> Array[Char] {
  let out : Array[Char] = []
  for c in s {
    if c != ' ' {
      out.push(if c >= 'A' && c <= 'Z' { (c.to_int() + 32).unsafe_to_char() } else { c })
    }
  }
  out.sort()
  out
}

fn is_anagram(a : String, b : String) -> Bool {
  letters(a) == letters(b)
}
