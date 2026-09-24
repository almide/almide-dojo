Modify the program below. Return the whole file.

Requested change:

- Every kind gets its own sequence. Introduce
  `type Kind: Eq, Repr = | Invoice | Quote | Receipt` and
  `type DocId: Eq, Repr = { kind: Kind, n: Int }`, and change `Doc` to
  `type Doc: Eq, Repr = { id: DocId, amount: Int }`.
- `label` prints the prefix and a number padded to at least four digits:
  `INV-0042`, `QUO-0007`, `RCP-12345` (never truncated).
- `next_id(docs, kind)` and `issue(docs, kind, amount)` take a `Kind`; `find(docs, id)`
  takes a `DocId`.

Preserve (the hidden oracle checks these):

- The next number is one more than the highest number used BY THAT KIND, and 1 for
  a kind with no documents yet, whatever the other kinds have used.
- `register` orders by kind (Invoice, then Quote, then Receipt) and then by number
  as a NUMBER (`INV-9999` before `INV-10000`).
- `find` matches kind and number together.
