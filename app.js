import {readFileSync} from 'fs';

import * as mathJs from './math.js';

console.time('js');
console.log(mathJs.nthFibonacciRecursive(39));
console.timeEnd('js');

console.time('wasmCpp');
WebAssembly.instantiate(readFileSync('math-cpp.wasm')).then(mathCpp => {
  console.log(mathCpp.instance.exports.nthFibonacciRecursive(39));
  console.timeEnd('wasmCpp');

  console.time('wasmAs');
  WebAssembly.instantiate(readFileSync('math-as.wasm')).then(mathAs => {
    console.log(mathAs.instance.exports.nthFibonacciRecursive(39));
    console.timeEnd('wasmAs');
  });
});