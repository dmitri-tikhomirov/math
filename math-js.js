// O(2 ^ n). Very slow, numbers are not too large. Good for benchmarking.
export function nthFibonacciRecursive(n) {
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

export function nthPrimeSieve(n) {
  const isPrime = [false, false]; // 0 and 1 are not primes.

  let number = 2;
  // For primes >= 11, nth prime is definetely not smaller than 2 * n.
  let upperBound = 2 * n;

  // Repeat indefinetely until the nth prime is found.
  while (true) {
    while (number <= upperBound) {
      if (isPrime[number] === undefined) { // If not already crossed off.
        n--; // Found another prime.

        if (n === 0) return number;

        // Smaller multiples are already crossed off.
        let multiple = number * number;

        // Cross off multiples of the newly found prime.
        while (multiple <= upperBound) {
          isPrime[multiple] = false;
          multiple += number;
        }
      }

      number++;
    }

    upperBound *= 2;

    // Sieve previously found primes up to the new upper bound.
    for (let i = 2; i < number; i++) {
      if (isPrime[i] === undefined) {
        let multiple = i * (number / i > i ? Math.ceil(number / i) : i);

        while (multiple <= upperBound) {
          isPrime[multiple] = false;
          multiple += i;
        }
      }
    }
  }
}

export function nthPrimeSieveLowMemory(n) {
  // We will store each discovered prime and its upcoming multiple in a table.
  // The table will be a heap based priority queue.
  class PriorityQueue {
    constructor() {
      this.data = [];
    }

    #parent(index) {
      return index ? Math.floor((index - 1) / 2) : 0;
    }

    #leftChild(index) {
      return 2 * index + 1;
    }

    #rightChild(index) {
      return 2 * index + 2;
    }

    #swap(index1, index2) {
      const temp = this.data[index1];

      this.data[index1] = this.data[index2];
      this.data[index2] = temp;
    }

    #upHeap(index) {
      while(this.data[index].priority <
          this.data[this.#parent(index)].priority && index > 0) {
        this.#swap(index, this.#parent(index));
        index = this.#parent(index);
      }
    }

    #minChild(index) {
      if (this.#rightChild(index) > this.data.length - 1) {
        return this.#leftChild(index);
      }

      if (this.data[this.#rightChild(index)].priority <
          this.data[this.#leftChild(index)].priority) {
        return this.#rightChild(index);
      } else {
        return this.#leftChild(index);
      }
    }

    #downHeap(index) {
      if (index < this.data.length - 1 && this.data[index].priority >
          this.data[this.#minChild(index)].priority) {
        const newIndex = this.#minChild(index);
        this.#swap(index, newIndex);
        this.#downHeap(newIndex);
      }
    }

    add(element, priority) {
      this.data[this.data.length] = new PriorityQueue.node(element, priority);
      if (this.data.length > 1) this.#upHeap(this.data.length - 1);
    }

    minElement() {
      return this.data[0]?.element;
    }

    minPriority() {
      return this.data[0]?.priority;
    }

    changeMinPriority(newPriority) {
      this.data[0].priority = newPriority;
      this.#downHeap(0);
    }
  }

  PriorityQueue.node = class {
    constructor(element, priority) {
      this.element = element;
      this.priority = priority;
    }
  }

  const table = new PriorityQueue;

  let number = 2;

  while (n > 0) {
    // The minimum is the next upcoming multiple.
    if (number === table.minPriority()) {
      do {
        table.changeMinPriority(table.minPriority() + table.minElement());
      } while (number === table.minPriority());
    } else {
      table.add(number, number * number);
      n--;
    }

    number++;
  }

  return number - 1;
}