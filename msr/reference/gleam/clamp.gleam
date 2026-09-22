pub fn clamp(value: Int, low: Int, high: Int) -> Int {
  case value < low, value > high {
    True, _ -> low
    _, True -> high
    _, _ -> value
  }
}
