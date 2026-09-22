import gleam/int

fn go(n: Int) -> Int {
  case n {
    0 -> 0
    _ -> n % 10 + go(n / 10)
  }
}

pub fn sum_digits(n: Int) -> Int {
  go(int.absolute_value(n))
}
