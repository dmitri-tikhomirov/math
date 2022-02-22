import {readFileSync} from 'fs';

import * as mathJs from './math.js';

console.time('js');
console.log(mathJs.factorial(20));
console.timeEnd('js');
console.log('\n');

console.time('wasmCpp');
const mathCpp = await WebAssembly.instantiate(readFileSync('math-cpp.wasm'));
console.timeLog('wasmCpp');
console.log(mathCpp.instance.exports.factorial(20));
console.timeEnd('wasmCpp');
console.log('\n');

console.time('wasmAs');
const mathAs = await WebAssembly.instantiate(readFileSync('math-as.wasm'));
console.timeLog('wasmAs');
console.log(mathAs.instance.exports.factorial(20));
console.timeEnd('wasmAs');