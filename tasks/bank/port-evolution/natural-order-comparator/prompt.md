Modify the program below. Return the whole file.

Requested change:

- Add `type Natural: Order = {}` that compares names the way people read them:
  split each name into runs of digits and runs of non-digits and compare run by run;
  two digit runs compare by their NUMBER (`9` < `10`), anything else compares as text;
  a name that is a prefix of the other (run-wise) comes first. When every run
  compares equal but the names differ (`a01` vs `a1`), the plain string comparison
  decides.
- Add `type Collation = | Plain(Lexical) | Human(Natural)` and
  `fn sort_by_collation(c: Collation, names: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Lexical`, `sort_names`, `greatest` and the protocol keep their behaviour; the
  sort stays stable for names that compare 0.
- `Natural.cmp(a, b)` is 0 only when `a == b`, so the order of `a01` and `a1` never
  depends on the input order (`a01` comes first, as in string order).
- Names without digits order exactly as `Lexical` does; `file9 < file10 < file10b`.
