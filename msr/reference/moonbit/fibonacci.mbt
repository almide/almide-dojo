fn fibonacci(n : Int) -> Int {
  let mut a = 0
  let mut b = 1
  for _ in 0..<n {
    let next = a + b
    a = b
    b = next
  }
  a
}
