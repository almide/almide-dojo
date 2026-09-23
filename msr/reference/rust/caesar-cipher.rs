fn shift_text(text: &str, k: i64) -> String {
    text.chars()
        .map(|c| {
            if c.is_ascii_lowercase() {
                let off = ((c as i64 - 97 + k).rem_euclid(26)) as u8;
                (b'a' + off) as char
            } else {
                c
            }
        })
        .collect()
}

fn encrypt(text: &str, shift: i64) -> String {
    shift_text(text, shift)
}

fn decrypt(text: &str, shift: i64) -> String {
    shift_text(text, -shift)
}
