function title_case(s: string): string {
  return s
    .split(" ")
    .map((w) => (w === "" ? w : w[0].toUpperCase() + w.slice(1).toLowerCase()))
    .join(" ");
}
