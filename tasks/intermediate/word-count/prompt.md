Write a function with this exact signature:

    fn word_count(s: String) -> Map[String, Int]

Behavior:

- Split `s` into words by spaces and count the frequency of each word
- `word_count("the cat and the dog")` returns a map where `"the"` maps to `2`, `"cat"` to `1`, etc.
- `word_count("")` returns an empty map
- Words are case-sensitive: `"The"` and `"the"` are different words

Notes:

- Use `string.split(s, " ")` to split into words.
- Use `list.fold` with `map.get_or` and `map.set` to build the frequency map.
- Empty strings from splitting should be filtered out with `list.filter`.
