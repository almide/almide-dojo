pub fn sum_digits(n: i64) i64 {
    var m: i64 = if (n < 0) -n else n;
    var total: i64 = 0;
    while (m > 0) {
        total += @mod(m, 10);
        m = @divTrunc(m, 10);
    }
    return total;
}
