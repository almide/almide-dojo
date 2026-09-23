const std = @import("std");

pub fn flatten(allocator: std.mem.Allocator, xss: []const []const i64) ![]i64 {
    var total: usize = 0;
    for (xss) |xs| total += xs.len;
    const out = try allocator.alloc(i64, total);
    var k: usize = 0;
    for (xss) |xs| {
        for (xs) |x| {
            out[k] = x;
            k += 1;
        }
    }
    return out;
}
