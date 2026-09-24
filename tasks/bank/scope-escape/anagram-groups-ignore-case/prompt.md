Modify the program below. Return the whole file.

Requested change:

- Add `fn anagram_summary(ws: List[String]) -> String` returning
  `groups=<g>,largest=<word>`: `g` is the number of anagram groups with at
  least two words, and `word` is the first word (as written) of the largest
  such group; `groups=0,largest=-` when there is none.

Preserve (the hidden oracle checks these):

- `letters_key`, `is_anagram`, `distinct_words` and `longest` keep their
  exact behaviour.
- Grouping ignores case exactly like `is_anagram` ("Tea" and "eat" are one
  group); a word is reported as written.
- Ties for the largest group go to the group whose first word comes first in
  `ws`. Repeated identical words count as separate members.
- The grouping table is a temporary of `anagram_summary`: return only the string.
