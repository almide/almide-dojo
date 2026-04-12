Write a function with this exact signature:

    fn to_roman(n: Int) -> String

Behavior:

- Convert a positive integer `n` (1 to 3999) to its Roman numeral representation
- Use standard Roman numeral rules with subtractive notation:
  - M=1000, CM=900, D=500, CD=400, C=100, XC=90, L=50, XL=40, X=10, IX=9, V=5, IV=4, I=1
- `to_roman(1994)` must return `"MCMXCIV"`

Notes:

- A common approach is to define a list of `(value, symbol)` pairs from largest to smallest, then greedily subtract.
- Use `int.to_string` is NOT needed here — build the string from Roman symbols directly.
