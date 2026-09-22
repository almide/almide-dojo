pub fn gcd(a: i64, b: i64) i64 {
    var x = a;
    var y = b;
    while (y != 0) {
        const t = @mod(x, y);
        x = y;
        y = t;
    }
    return x;
}
