int nthFibonacciRecursive(int n) {
  if (n < 2) return n;

  return nthFibonacciRecursive(n - 1) + nthFibonacciRecursive(n - 2);
}

long long int nthFibonacci(int n) {
  long long int a = 0, b = 1;

  if (n > 0) {
    while (n - 1 > 0) {
      const long long int next = a + b;

      a = b;
      b = next;

      n--;
    }

    return b;
  }

  return a;
}