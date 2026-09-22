fn is_balanced(s : String) -> Bool {
  let stack : Array[Char] = []
  for c in s {
    match c {
      '(' => stack.push(')')
      '[' => stack.push(']')
      '{' => stack.push('}')
      ')' | ']' | '}' =>
        match stack.pop() {
          Some(top) => if top != c { return false }
          None => return false
        }
      _ => ()
    }
  }
  stack.is_empty()
}
