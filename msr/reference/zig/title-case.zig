const std = @import("std");

pub fn title_case(allocator: std.mem.Allocator, s: []const u8) ![]u8 {
    const out = try allocator.alloc(u8, s.len);
    var start = true;
    for (s, 0..) |c, i| {
        if (c == ' ') {
            out[i] = c;
            start = true;
        } else {
            out[i] = if (start) std.ascii.toUpper(c) else std.ascii.toLower(c);
            start = false;
        }
    }
    return out;
}
