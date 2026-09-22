fn flatten(xss: &[Vec<i64>]) -> Vec<i64> {
    xss.iter().flatten().copied().collect()
}
