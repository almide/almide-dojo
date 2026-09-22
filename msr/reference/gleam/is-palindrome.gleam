import gleam/string

pub fn is_palindrome(s: String) -> Bool {
  string.reverse(s) == s
}
