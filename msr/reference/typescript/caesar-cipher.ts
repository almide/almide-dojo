function shiftText(text: string, k: number): string {
  return [...text]
    .map((c) => {
      if (c < "a" || c > "z") return c;
      const off = (((c.charCodeAt(0) - 97 + k) % 26) + 26) % 26;
      return String.fromCharCode(97 + off);
    })
    .join("");
}

function encrypt(text: string, shift: number): string {
  return shiftText(text, shift);
}

function decrypt(text: string, shift: number): string {
  return shiftText(text, -shift);
}
