fn count_vowels(s : String) -> Int {
  let mut n = 0
  for c in s {
    match c {
      'a' | 'e' | 'i' | 'o' | 'u' => n = n + 1
      _ => ()
    }
  }
  n
}
