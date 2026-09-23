fn sum_digits(n : Int) -> Int {
  let mut m = if n < 0 { -n } else { n }
  let mut total = 0
  while m > 0 {
    total = total + m % 10
    m = m / 10
  }
  total
}
