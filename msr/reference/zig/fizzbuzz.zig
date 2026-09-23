const std = @import("std");

pub fn fizzbuzz(allocator: std.mem.Allocator, n: i64) ![]u8 {
    if (@mod(n, 15) == 0) return allocator.dupe(u8, "FizzBuzz");
    if (@mod(n, 3) == 0) return allocator.dupe(u8, "Fizz");
    if (@mod(n, 5) == 0) return allocator.dupe(u8, "Buzz");
    return std.fmt.allocPrint(allocator, "{d}", .{n});
}
