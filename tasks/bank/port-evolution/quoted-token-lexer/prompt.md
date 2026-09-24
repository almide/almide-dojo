Modify the program below. Return the whole file.

Requested change:

- Add `type Quoted: Lexer = {}`. Outside quotes it splits on spaces like `Spaces`.
  A double quote starts a quoted token that runs to the next unescaped double quote
  and may contain spaces; inside quotes `\"` is a quote and `\\` a backslash. A
  quoted token touching other characters is part of the same token (`a"b c"` is the
  single token `ab c`). A quote left open is `err("unterminated quote")`.
- Add `type Mode = | Plain(Spaces) | Shell(Quoted)` and
  `fn run(m: Mode, line: String) -> String!` that runs the generic `command`.

Preserve (the hidden oracle checks these):

- `Spaces`, `command` and the protocol keep their behaviour (`empty line` for no tokens).
- `""` is a real, EMPTY token: `set "" x` has three tokens (`set(|x)`), and a line of
  just `""` has one token.
- Spaces inside quotes are kept exactly, including leading and trailing ones.
