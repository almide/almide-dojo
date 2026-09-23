fn fibonacci(n: i64) -> i64 {
    let (mut a, mut b) = (0i64, 1i64);
    for _ in 0..n {
        let next = a + b;
        a = b;
        b = next;
    }
    a
}
