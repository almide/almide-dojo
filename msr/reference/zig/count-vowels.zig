pub fn count_vowels(s: []const u8) i64 {
    var n: i64 = 0;
    for (s) |c| {
        switch (c) {
            'a', 'e', 'i', 'o', 'u' => n += 1,
            else => {},
        }
    }
    return n;
}
