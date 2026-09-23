const std = @import("std");

pub fn mat_add(allocator: std.mem.Allocator, a: []const []const i64, b: []const []const i64) ![][]i64 {
    const out = try allocator.alloc([]i64, a.len);
    for (a, b, 0..) |ra, rb, i| {
        out[i] = try allocator.alloc(i64, ra.len);
        for (ra, rb, 0..) |x, y, j| out[i][j] = x + y;
    }
    return out;
}

pub fn mat_transpose(allocator: std.mem.Allocator, m: []const []const i64) ![][]i64 {
    const ncols = if (m.len == 0) 0 else m[0].len;
    const out = try allocator.alloc([]i64, ncols);
    for (0..ncols) |j| {
        out[j] = try allocator.alloc(i64, m.len);
        for (m, 0..) |row, i| out[j][i] = row[j];
    }
    return out;
}

pub fn mat_scale(allocator: std.mem.Allocator, m: []const []const i64, s: i64) ![][]i64 {
    const out = try allocator.alloc([]i64, m.len);
    for (m, 0..) |row, i| {
        out[i] = try allocator.alloc(i64, row.len);
        for (row, 0..) |x, j| out[i][j] = x * s;
    }
    return out;
}

pub fn mat_dot_row(row_a: []const i64, col_b: []const i64) i64 {
    var total: i64 = 0;
    for (row_a, col_b) |x, y| total += x * y;
    return total;
}
