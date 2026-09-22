const std = @import("std");

fn shiftText(allocator: std.mem.Allocator, text: []const u8, k: i64) ![]u8 {
    const out = try allocator.alloc(u8, text.len);
    for (text, 0..) |c, i| {
        if (c >= 'a' and c <= 'z') {
            const off: u8 = @intCast(@mod(@as(i64, c - 'a') + k, 26));
            out[i] = 'a' + off;
        } else {
            out[i] = c;
        }
    }
    return out;
}

pub fn encrypt(allocator: std.mem.Allocator, text: []const u8, shift: i64) ![]u8 {
    return shiftText(allocator, text, shift);
}

pub fn decrypt(allocator: std.mem.Allocator, text: []const u8, shift: i64) ![]u8 {
    return shiftText(allocator, text, -shift);
}
