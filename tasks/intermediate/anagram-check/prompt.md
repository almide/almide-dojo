Write a function with this exact signature:

    fn is_anagram(a: String, b: String) -> Bool

Behavior:

- Return `true` if `a` and `b` are anagrams (same characters, same counts, different order allowed)
- Comparison is case-insensitive: `"Listen"` and `"Silent"` are anagrams
- Spaces are ignored: `"a b"` and `"ba"` are anagrams
- `is_anagram("", "")` returns `true`

Notes:

- Use `string.to_lower(s)` for case-insensitive comparison.
- Use `string.chars(s)` and `list.filter` to remove spaces.
- Use `list.sort` to compare sorted character lists.
