Modify the program below. Return the whole file.

Requested change:

- Store polynomials sparsely: change `Poly` to `type Poly: Eq, Repr = { terms: Map[Int, Int] }`
  mapping an exponent to its NON-ZERO coefficient (the zero polynomial is the empty map).
  `poly(cs)` keeps taking the dense list (index = exponent) and builds the map.
- Every function keeps its signature and result; `x^1000` must now be cheap.

Preserve (the hidden oracle checks these):

- `render` prints the highest power FIRST whatever order the terms were built in,
  with the same sign and coefficient rules (`-x^3 + 2x - 1`, `x`, `0`).
- No zero coefficient is ever stored: `add(p, negate)` of a polynomial and its
  negation is the zero polynomial, EQUAL to `poly([])`, degree `none`, rendered `0`.
- `mul` and `degree` keep their answers.
