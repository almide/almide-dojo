fn has_divisor(n: Int, d: Int) -> Bool {
  case d * d > n {
    True -> False
    False ->
      case n % d == 0 {
        True -> True
        False -> has_divisor(n, d + 1)
      }
  }
}

pub fn is_prime(n: Int) -> Bool {
  n >= 2 && !has_divisor(n, 2)
}
