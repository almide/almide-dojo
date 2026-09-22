fn is_prime(n : Int) -> Bool {
  if n < 2 {
    return false
  }
  let mut d = 2
  while d * d <= n {
    if n % d == 0 {
      return false
    }
    d = d + 1
  }
  true
}
