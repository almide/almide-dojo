Modify the program below. Return the whole file.

Requested change:

- Store phones normalized: introduce `type Phone: Eq, Repr = { cc: Int, number: String }`
  and change `Contact.phone: String` to `Contact.phone: Phone`. `contact(name, text)`
  keeps taking the typed text and normalizes it:
  - spaces, `-`, `.`, `(` and `)` are separators and are dropped;
  - `+<country><rest>` is international: the country code is the digits after `+`
    up to the first separator in the typed text (`+81 90-1234-5678` has cc 81);
  - otherwise the number is national, the country is 81, and ONE leading `0` (the
    trunk prefix) is dropped (`090-1234-5678` is cc 81, number `9012345678`).
- `lookup(book, text)` normalizes `text` the same way. `render` prints
  `name <+cc number>`, e.g. `ann <+81 9012345678>`.

Preserve (the hidden oracle checks these):

- `add` still keeps the FIRST contact for a phone and ignores later ones, where
  "same phone" now means the same normalized phone: `+81 90-1234-5678`,
  `090 1234 5678` and `(090) 1234.5678` are one number.
- Only one trunk `0` is dropped; an international number keeps every digit after
  its country code.
- `import_all` keeps the input order of the kept contacts.
