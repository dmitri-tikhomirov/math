import {readFileSync} from 'fs';

import * as mathJs from './math.js';

console.time('js');

console.log(mathJs.nthFibonacciRecursive(5));

console.timeEnd('js');

console.time('wasm');

WebAssembly.instantiate(readFileSync('math-cpp.wasm')).then(mathCpp => {
  console.log(mathCpp.instance.exports._Z21nthFibonacciRecursivei(5));

  console.timeEnd('wasm');
});