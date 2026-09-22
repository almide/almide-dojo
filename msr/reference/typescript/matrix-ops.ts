function mat_add(a: number[][], b: number[][]): number[][] {
  return a.map((row, i) => row.map((x, j) => x + b[i][j]));
}

function mat_transpose(m: number[][]): number[][] {
  if (m.length === 0) return [];
  return m[0].map((_, j) => m.map((row) => row[j]));
}

function mat_scale(m: number[][], s: number): number[][] {
  return m.map((row) => row.map((x) => x * s));
}

function mat_dot_row(row_a: number[], col_b: number[]): number {
  return row_a.reduce((acc, x, i) => acc + x * col_b[i], 0);
}
