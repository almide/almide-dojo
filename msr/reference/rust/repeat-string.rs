fn repeat(s: &str, n: i64) -> String {
    s.repeat(n.max(0) as usize)
}
