extern "C" { // To prevent name mangling
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

  long long int factorial(int n) {
    long long int result = 1;

    for (int i = 2; i <= n; i++) {
      result *= i; // Implicitly converted
    }

    return result;
  }

  int nthPrime(int n) {
    int number = 2, lastPrime = 0;

    while (n > 0) {
      int factor = 2;
      bool isPrime = true;

      while (factor * factor <= number && isPrime) {
        if (number % factor == 0) isPrime = false;
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
}