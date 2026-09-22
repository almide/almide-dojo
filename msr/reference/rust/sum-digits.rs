fn sum_digits(n: i64) -> i64 {
    let mut m = n.abs();
    let mut total = 0;
    while m > 0 {
        total += m % 10;
        m /= 10;
    }
    total
}
