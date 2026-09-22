fn go(n: Int, a: Int, b: Int) -> Int {
  case n {
    0 -> a
    _ -> go(n - 1, b, a + b)
  }
}

pub fn fibonacci(n: Int) -> Int {
  go(n, 0, 1)
}
