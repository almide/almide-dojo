Modify the program below. Return the whole file.

Requested change:

- Add `type Hashed: Partitioner = { seed: Int }` (the seed may be negative). Its hash
  starts at `seed` and, for each character code `c` of the key in order, becomes
  `(h * 31 + c) % 1000003`; the bucket is that hash reduced into `0 .. n-1` — the
  mathematical remainder, which is never negative.
- Add `type Scheme = | Length(ByLength) | Hash(Hashed)` and
  `fn histogram_with(s: Scheme, keys: List[String], n: Int) -> String`.

Preserve (the hidden oracle checks these):

- `ByLength`, `spread`, `histogram` and the protocol keep their behaviour.
- Every key lands in exactly one bucket for every seed, including negative seeds whose
  hash stays negative; no key is lost (`%` in Almide keeps the sign of the left side).
- `n = 1` puts every key in bucket 0; the empty key hashes to the seed itself.
