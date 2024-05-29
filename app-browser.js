import * as mathJs from './math-js.js';

console.log('Javascript vs Webassembly, nth Fibonacci');
console.log('----------------------------------------\n');

let n = 35;
console.log('n = ' + n + '\n');

console.time('Javascript time');
console.log('nth Fibonacci: ' + mathJs.nthFibonacciRecursive(n));
console.timeEnd('Javascript time');
console.log('\n');

console.time('WebAssembly (C++) time');
const mathCpp = await WebAssembly.instantiateStreaming(fetch("math-cpp.wasm"));
console.timeLog('WebAssembly (C++) time');
console.log('nth Fibonacci: ' +
  mathCpp.instance.exports.nthFibonacciRecursive(n));
console.timeEnd('WebAssembly (C++) time');
console.log('\n');

console.time('WebAssembly (AssemblyScript) time');
const mathAs = await WebAssembly.instantiateStreaming(fetch("math-as.wasm"));
console.timeLog('WebAssembly (AssemblyScript) time');
console.log('nth Fibonacci: ' +
  mathAs.instance.exports.nthFibonacciRecursive(n));
console.timeEnd('WebAssembly (AssemblyScript) time');
console.log('\n');

console.log('Javascript vs Webassembly, nth prime');
console.log('------------------------------------\n');

n = 200000;
console.log('n = ' + n + '\n');

console.time('Javascript time');
console.log('nth prime: ' + mathJs.nthPrime(n));
console.timeEnd('Javascript time');
console.log('\n');

console.time('WebAssembly (C++) time');
console.log('nth prime: ' + mathCpp.instance.exports.nthPrime(n));
console.timeEnd('WebAssembly (C++) time');
console.log('\n');

console.time('WebAssembly (AssemblyScript) time');
console.log('nth prime: ' + mathAs.instance.exports.nthPrime(n));
console.timeEnd('WebAssembly (AssemblyScript) time');
console.log('\n');

console.log('Javascript, nth prime, simple sieve vs low memory sieve');
console.log('-------------------------------------------------------\n');

console.time('Javascript time, simple sieve');
console.log('nth prime: ' + mathJs.nthPrimeSieve(n));
console.timeEnd('Javascript time, simple sieve');
console.time('Javascript time, low memory sieve');
console.log('nth prime: ' + mathJs.nthPrimeSieveLowMemory(n));
console.timeEnd('Javascript time, low memory sieve');