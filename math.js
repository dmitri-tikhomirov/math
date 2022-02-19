export function nthFibonacciRecursive(n) { // O(2 ^ n), useful as a benchmark
  if (n < 2) return n;

  return nthFibonacciRecursive(n - 1) + nthFibonacciRecursive(n - 2);
}

export function nthFibonacci(n) {
  let a = 0n, b = 1n;

  if (n > 0) {
    while (n - 1 > 0) {
      const next = a + b;

      a = b;
      b = next;

      n--;
    }

    return b;
  }

  return a;
}