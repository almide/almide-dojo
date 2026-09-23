import gleam/list
import gleam/string

fn shift_text(text: String, k: Int) -> String {
  string.to_utf_codepoints(text)
  |> list.map(fn(cp) {
    let n = string.utf_codepoint_to_int(cp)
    case n >= 97 && n <= 122 {
      True -> {
        let assert Ok(shifted) = string.utf_codepoint({ { n - 97 + k } % 26 + 26 } % 26 + 97)
        shifted
      }
      False -> cp
    }
  })
  |> string.from_utf_codepoints
}

pub fn encrypt(text: String, shift: Int) -> String {
  shift_text(text, shift)
}

pub fn decrypt(text: String, shift: Int) -> String {
  shift_text(text, 0 - shift)
}
