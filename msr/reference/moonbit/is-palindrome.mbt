fn is_palindrome(s : String) -> Bool {
  let cs = s.to_array()
  let n = cs.length()
  for i in 0..<(n / 2) {
    if cs[i] != cs[n - 1 - i] {
      return false
    }
  }
  true
}
