function sum_digits(n: number): number {
  return [...String(Math.abs(n))].reduce((acc, d) => acc + Number(d), 0);
}
