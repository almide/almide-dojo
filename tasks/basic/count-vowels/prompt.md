Write a function with this exact signature:

    fn count_vowels(s: String) -> Int

Behavior:

- Return the number of vowel characters in `s`
- Vowels are: `a`, `e`, `i`, `o`, `u` (lowercase only)
- `count_vowels("")` must return `0`
- `count_vowels("hello")` must return `2`
- Uppercase vowels do NOT count: `count_vowels("HELLO")` returns `0`

Notes:

- Use `string.chars(s)` to get a `List[String]` of individual characters.
- Use `list.count(xs, predicate)` or `list.filter` + `list.len` to count matches.
