fn rle_encode(s: &str) -> String {
    let mut out = String::new();
    let chars: Vec<char> = s.chars().collect();
    let mut i = 0;
    while i < chars.len() {
        let mut j = i;
        while j < chars.len() && chars[j] == chars[i] {
            j += 1;
        }
        out.push_str(&(j - i).to_string());
        out.push(chars[i]);
        i = j;
    }
    out
}

fn rle_decode(s: &str) -> String {
    let chars: Vec<char> = s.chars().collect();
    let mut out = String::new();
    for pair in chars.chunks(2) {
        if let [d, c] = pair {
            let n = d.to_digit(10).unwrap_or(0) as usize;
            out.extend(std::iter::repeat(*c).take(n));
        }
    }
    out
}
