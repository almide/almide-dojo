function rle_encode(s: string): string {
  let out = "";
  let i = 0;
  while (i < s.length) {
    let j = i;
    while (j < s.length && s[j] === s[i]) j++;
    out += String(j - i) + s[i];
    i = j;
  }
  return out;
}

function rle_decode(s: string): string {
  let out = "";
  for (let i = 0; i + 1 < s.length; i += 2) out += s[i + 1].repeat(Number(s[i]));
  return out;
}
