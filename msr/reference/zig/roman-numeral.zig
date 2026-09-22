const std = @import("std");

pub fn to_roman(allocator: std.mem.Allocator, n: i64) ![]u8 {
    const values = [_]i64{ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
    const symbols = [_][]const u8{ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
    var buf: [64]u8 = undefined;
    var len: usize = 0;
    var m = n;
    for (values, symbols) |v, sym| {
        while (m >= v) {
            @memcpy(buf[len .. len + sym.len], sym);
            len += sym.len;
            m -= v;
        }
    }
    return allocator.dupe(u8, buf[0..len]);
}
