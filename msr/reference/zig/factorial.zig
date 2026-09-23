pub fn factorial(n: i64) i64 {
    var out: i64 = 1;
    var i: i64 = 2;
    while (i <= n) : (i += 1) out *= i;
    return out;
}
