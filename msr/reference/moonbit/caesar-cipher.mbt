fn shift_text(text : String, k : Int) -> String {
  let buf = StringBuilder()
  for c in text {
    if c >= 'a' && c <= 'z' {
      let off = ((c.to_int() - 97 + k) % 26 + 26) % 26
      buf.write_char((97 + off).unsafe_to_char())
    } else {
      buf.write_char(c)
    }
  }
  buf.to_string()
}

fn encrypt(text : String, shift : Int) -> String {
  shift_text(text, shift)
}

fn decrypt(text : String, shift : Int) -> String {
  shift_text(text, -shift)
}
