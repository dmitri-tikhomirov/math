export function nthFibonacciRecursive(n: i32): i32 {
  if (n < 2) return n;

  return nthFibonacciRecursive(n - 1) + nthFibonacciRecursive(n - 2);
}

export function nthFibonacci(n: i32): i64 {
  let a: i64 = 0, b: i64 = 1;

  if (n > 0) {
    while (n - 1 > 0) {
      const next: i64 = a + b;

      a = b;
      b = next;

      n--;
    }

    return b;
  }

  return a;
}