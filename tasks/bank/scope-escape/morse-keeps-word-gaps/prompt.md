Modify the program below. Return the whole file.

Requested change:

- Add `fn decode(msg: String) -> String` returning the decoded text, words
  separated by single spaces, with `?` for any letter code that is unknown.

Preserve (the hidden oracle checks these):

- `CODE`, `letter` and `symbols` keep their exact behaviour.
- " / " separates WORDS: "... --- ... / ..." is "SOS S". Extra spaces around
  the separators do not create empty letters.
- The letter table lookups and word lists are temporaries of `decode`.
