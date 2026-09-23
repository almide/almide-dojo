fn repeat(s : String, n : Int) -> String {
  let buf = StringBuilder()
  for _ in 0..<n {
    buf.write_string(s)
  }
  buf.to_string()
}
