Modify the program below. Return the whole file.

Requested change:

- Extract `fn tokens(text: String) -> List[String]` (the words of the text, in
  order, punctuation stripped, empty ones dropped) and make both `word_count`
  and `longest_word` use it.

Preserve (the hidden oracle checks these):

- `word_count` and `longest_word` stay the same functions of their input:
  "well-known" and "don't" are ONE word each; only leading and trailing
  punctuation is removed.
- A pure refactor: tokenizing allocates no more than the inline code did.
