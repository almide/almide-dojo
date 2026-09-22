fn to_roman(n: i64) -> String {
    let table = [
        (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"),
        (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I"),
    ];
    let mut n = n;
    let mut out = String::new();
    for (v, sym) in table {
        while n >= v {
            out.push_str(sym);
            n -= v;
        }
    }
    out
}
