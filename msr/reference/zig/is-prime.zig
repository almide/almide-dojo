pub fn is_prime(n: i64) bool {
    if (n < 2) return false;
    var d: i64 = 2;
    while (d * d <= n) : (d += 1) {
        if (@mod(n, d) == 0) return false;
    }
    return true;
}
