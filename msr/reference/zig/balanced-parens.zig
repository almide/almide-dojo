pub fn is_balanced(s: []const u8) bool {
    var stack: [256]u8 = undefined;
    var top: usize = 0;
    for (s) |c| {
        switch (c) {
            '(', '[', '{' => {
                if (top == stack.len) return false;
                stack[top] = switch (c) {
                    '(' => ')',
                    '[' => ']',
                    else => '}',
                };
                top += 1;
            },
            ')', ']', '}' => {
                if (top == 0 or stack[top - 1] != c) return false;
                top -= 1;
            },
            else => {},
        }
    }
    return top == 0;
}
