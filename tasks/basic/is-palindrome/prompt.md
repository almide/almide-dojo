Write a function with this exact signature:

    fn is_palindrome(s: String) -> Bool

Behavior:

- Return `true` if `s` reads the same forwards and backwards, `false` otherwise
- `is_palindrome("")` must return `true` (the empty string is a palindrome)
- `is_palindrome("a")` must return `true`
- The comparison is case-sensitive: `"Aa"` is NOT a palindrome
- Do not strip whitespace or punctuation: `"a b a"` IS a palindrome, `"a ba"` is not
