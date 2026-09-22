fn rle_encode(s : String) -> String {
  let cs = s.to_array()
  let buf = StringBuilder()
  let mut i = 0
  while i < cs.length() {
    let mut j = i
    while j < cs.length() && cs[j] == cs[i] {
      j = j + 1
    }
    buf.write_string((j - i).to_string())
    buf.write_char(cs[i])
    i = j
  }
  buf.to_string()
}

fn rle_decode(s : String) -> String {
  let cs = s.to_array()
  let buf = StringBuilder()
  let mut i = 0
  while i + 1 < cs.length() {
    let n = cs[i].to_int() - '0'.to_int()
    for _ in 0..<n {
      buf.write_char(cs[i + 1])
    }
    i = i + 2
  }
  buf.to_string()
}
