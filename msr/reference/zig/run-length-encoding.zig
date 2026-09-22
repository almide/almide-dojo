const std = @import("std");

pub fn rle_encode(allocator: std.mem.Allocator, s: []const u8) ![]u8 {
    const out = try allocator.alloc(u8, s.len * 2);
    var n: usize = 0;
    var i: usize = 0;
    while (i < s.len) {
        var j = i;
        while (j < s.len and s[j] == s[i]) j += 1;
        out[n] = '0' + @as(u8, @intCast(j - i));
        out[n + 1] = s[i];
        n += 2;
        i = j;
    }
    return out[0..n];
}

pub fn rle_decode(allocator: std.mem.Allocator, s: []const u8) ![]u8 {
    var total: usize = 0;
    var i: usize = 0;
    while (i + 1 < s.len) : (i += 2) total += s[i] - '0';
    const out = try allocator.alloc(u8, total);
    var n: usize = 0;
    i = 0;
    while (i + 1 < s.len) : (i += 2) {
        for (0..s[i] - '0') |_| {
            out[n] = s[i + 1];
            n += 1;
        }
    }
    return out;
}
