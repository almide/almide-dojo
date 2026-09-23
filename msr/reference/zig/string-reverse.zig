const std = @import("std");

pub fn reverse(allocator: std.mem.Allocator, s: []const u8) ![]u8 {
    const out = try allocator.dupe(u8, s);
    std.mem.reverse(u8, out);
    return out;
}
