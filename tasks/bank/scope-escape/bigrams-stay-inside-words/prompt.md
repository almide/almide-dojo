Modify the program below. Return the whole file.

Requested change:

- Add `fn top_bigram(text: String) -> String` returning `<pair> x<count>` for
  the most frequent pair of adjacent letters, or `none` when there is none.
  Ties go to the alphabetically first pair.

Preserve (the hidden oracle checks these):

- `words`, `letters` and `word_bigrams` keep their exact behaviour.
- A pair never spans two words: in "ab ba" the pairs are "ab" and "ba" only
  ("bb" is not a pair).
- The pair counts are a temporary of `top_bigram`: return only the string.
