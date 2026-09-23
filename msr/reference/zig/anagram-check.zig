const std = @import("std");

fn counts(s: []const u8) [256]i64 {
    var c = [_]i64{0} ** 256;
    for (s) |ch| {
        if (ch != ' ') c[std.ascii.toLower(ch)] += 1;
    }
    return c;
}

pub fn is_anagram(a: []const u8, b: []const u8) bool {
    const ca = counts(a);
    const cb = counts(b);
    return std.mem.eql(i64, &ca, &cb);
}
