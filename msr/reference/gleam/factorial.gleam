pub fn factorial(n: Int) -> Int {
  case n <= 1 {
    True -> 1
    False -> n * factorial(n - 1)
  }
}
