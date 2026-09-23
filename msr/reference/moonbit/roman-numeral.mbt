fn to_roman(n : Int) -> String {
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let buf = StringBuilder()
  let mut m = n
  for i in 0..<values.length() {
    while m >= values[i] {
      buf.write_string(symbols[i])
      m = m - values[i]
    }
  }
  buf.to_string()
}
