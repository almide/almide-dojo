fn count_vowels(s: &str) -> i64 {
    s.chars().filter(|c| "aeiou".contains(*c)).count() as i64
}
