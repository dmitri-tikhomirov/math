# Math

A collection of math functions made to compare performance of WebAssembly vs Javascript or performance of different algorithms.

## List of functions

- Nth Fibonacci number, recursive implementation (`Javascript`, `C++`, `AssemblyScript`).
- Nth Fibonacci number, iterative implementation (`Javascript`, `C++`, `AssemblyScript`).
- Factorial (`Javascript`, `C++`, `AssemblyScript`).
- Nth prime number, trial division (`Javascript`, `C++`, `AssemblyScript`).
- Nth prime number, Sieve of Eratosthenes (`Javascript`).
- Nth prime number, low memory Sieve of Eratosthenes (`Javascript`).

## How to use

You can run the project either in a Javascript/WebAssembly environment (like Node.js or Bun) or in browsers. To run in an environment, start `app.js`. To run in a browser, start `index.html`.

For browsers, you need a local server (there are a lot of tools/packages/extensions that will setup a minimalistic local server for you). Opening `index.html` via the `file://` protocol will not work.

The output will be to the console. If running in a browser, it will be to the browser console.

## WebAssembly vs Javascript

WebAssembly's performance, as compared to Javascript, varies a lot depending on the exact function tested, on the engine used, on compilation settings, etc. Number crunching like this is supposed to be WebAssembly's specialty, but even then, WebAssembly is not consistently faster than Javascript across a variety of tasks. Use WebAssembly for new projects only if you know that it will be faster for your particular use case. Otherwise use Javascript for a stable and reasonably fast performance.