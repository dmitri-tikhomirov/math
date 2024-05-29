(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_=>_i64 (func (param i32) (result i64)))
 (memory $0 0)
 (export "nthFibonacciRecursive" (func $math-as/nthFibonacciRecursive))
 (export "nthFibonacci" (func $math-as/nthFibonacci))
 (export "factorial" (func $math-as/factorial))
 (export "nthPrime" (func $math-as/nthPrime))
 (export "memory" (memory $0))
 (func $math-as/nthFibonacciRecursive (param $0 i32) (result i32)
  local.get $0
  i32.const 2
  i32.lt_s
  if
   local.get $0
   return
  end
  local.get $0
  i32.const 1
  i32.sub
  call $math-as/nthFibonacciRecursive
  local.get $0
  i32.const 2
  i32.sub
  call $math-as/nthFibonacciRecursive
  i32.add
 )
 (func $math-as/nthFibonacci (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  i64.const 1
  local.set $1
  local.get $0
  i32.const 0
  i32.gt_s
  if
   loop $while-continue|0
    local.get $0
    i32.const 1
    i32.sub
    i32.const 0
    i32.gt_s
    if
     local.get $1
     local.get $2
     i64.add
     local.get $1
     local.set $2
     local.set $1
     local.get $0
     i32.const 1
     i32.sub
     local.set $0
     br $while-continue|0
    end
   end
   local.get $1
   return
  end
  i64.const 0
 )
 (func $math-as/factorial (param $0 i32) (result i64)
  (local $1 i32)
  (local $2 i64)
  i64.const 1
  local.set $2
  i32.const 2
  local.set $1
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.ge_s
   if
    local.get $1
    i64.extend_i32_s
    local.get $2
    i64.mul
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $math-as/nthPrime (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 2
  local.set $1
  loop $while-continue|0
   local.get $0
   i32.const 0
   i32.gt_s
   if
    i32.const 2
    local.set $3
    i32.const 1
    local.set $4
    loop $while-continue|1
     local.get $1
     local.get $3
     local.get $3
     i32.mul
     i32.ge_s
     local.get $4
     i32.and
     if
      local.get $1
      local.get $3
      i32.rem_s
      if
       local.get $3
       i32.const 1
       i32.add
       local.set $3
      else
       i32.const 0
       local.set $4
      end
      br $while-continue|1
     end
    end
    local.get $4
    if
     local.get $1
     local.set $2
     local.get $0
     i32.const 1
     i32.sub
     local.set $0
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  local.get $2
 )
)
