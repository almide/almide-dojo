Write a function with this exact signature:

    fn title_case(s: String) -> String

Behavior:

- Capitalize the first character of each word in `s`
- A word is a maximal sequence of non-space characters, separated by single spaces
- `title_case("")` must return `""`
- `title_case("hello world")` must return `"Hello World"`
- Characters after the first in each word are lowercased: `title_case("hELLO")` returns `"Hello"`

Notes:

- Use `string.split(s, " ")` to split by spaces.
- Use `string.capitalize(word)` to capitalize the first letter of a word.
- Use `string.to_lower(s)` to lowercase a string.
- Use `string.join(parts, " ")` to rejoin words.
