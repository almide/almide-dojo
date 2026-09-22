pub fn is_palindrome(s: []const u8) bool {
    if (s.len < 2) return true;
    var i: usize = 0;
    var j: usize = s.len - 1;
    while (i < j) : ({
        i += 1;
        j -= 1;
    }) {
        if (s[i] != s[j]) return false;
    }
    return true;
}
