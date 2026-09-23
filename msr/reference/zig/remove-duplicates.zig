const std = @import("std");

pub fn remove_duplicates(allocator: std.mem.Allocator, xs: []const i64) ![]i64 {
    const out = try allocator.alloc(i64, xs.len);
    var n: usize = 0;
    for (xs) |x| {
        if (std.mem.indexOfScalar(i64, out[0..n], x) == null) {
            out[n] = x;
            n += 1;
        }
    }
    return out[0..n];
}
