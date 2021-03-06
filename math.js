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

export function factorial(n) {
  let result = 1n;

  for (let i = 2; i <= n; i++) {
    result *= BigInt(i);
  }

  return result;
}

export function nthPrime(n) {
  let number = 2;
  let lastPrime = 0;

  while (n > 0) {
    let factor = 2;
    let isPrime = true;

    while (factor * factor <= number && isPrime) {
      if (number % factor === 0) isPrime = false;
      else factor++;
    }

    if (isPrime) {
      n--;
      lastPrime = number;
    }

    number++;
  }

  return lastPrime;
}