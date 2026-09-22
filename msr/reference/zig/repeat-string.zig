const std = @import("std");

pub fn repeat(allocator: std.mem.Allocator, s: []const u8, n: i64) ![]u8 {
    const count: usize = @intCast(@max(n, 0));
    const out = try allocator.alloc(u8, s.len * count);
    for (0..count) |i| @memcpy(out[i * s.len .. (i + 1) * s.len], s);
    return out;
}
