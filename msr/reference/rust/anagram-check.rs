fn is_anagram(a: &str, b: &str) -> bool {
    let norm = |s: &str| {
        let mut cs: Vec<char> = s.to_lowercase().chars().filter(|c| *c != ' ').collect();
        cs.sort();
        cs
    };
    norm(a) == norm(b)
}
