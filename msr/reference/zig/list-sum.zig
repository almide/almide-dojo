pub fn list_sum(xs: []const i64) i64 {
    var total: i64 = 0;
    for (xs) |x| total += x;
    return total;
}
