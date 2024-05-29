export function nthFibonacciRecursive(n: i32): i32 {
  if (n < 2) return n;

  return nthFibonacciRecursive(n - 1) + nthFibonacciRecursive(n - 2);
}

export function nthFibonacci(n: i32): i64 {
  let a: i64 = 0, b: i64 = 1;

  if (n > 0) {
    while (n - 1 > 0) {
      const next = a + b; // "i64" is inferred.

      a = b;
      b = next;

      n--;
    }

    return b;
  }

  return a;
}

export function factorial(n: i32): i64 {
  let result: i64 = 1;

  for (let i = 2; i <= n; i++) {
    result *= i; // Implicitly converted.
  }

  return result;
}

export function nthPrime(n: i32): i32 {
  let number = 2;
  let lastPrime = 0;

  while (n > 0) {
    let factor = 2;
    let isPrime = true;

    while (factor * factor <= number && isPrime) {
      if (number % factor == 0) isPrime = false; // "==" instead of "===".
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