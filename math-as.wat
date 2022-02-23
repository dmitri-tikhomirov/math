(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_=>_i64 (func (param i32) (result i64)))
 (global $~lib/memory/__data_end i32 (i32.const 8))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 16392))
 (global $~lib/memory/__heap_base i32 (i32.const 16392))
 (memory $0 0)
 (table $0 1 funcref)
 (elem $0 (i32.const 1))
 (export "nthFibonacciRecursive" (func $math/nthFibonacciRecursive))
 (export "nthFibonacci" (func $math/nthFibonacci))
 (export "factorial" (func $math/factorial))
 (export "nthPrime" (func $math/nthPrime))
 (export "memory" (memory $0))
 (func $math/nthFibonacciRecursive (param $0 i32) (result i32)
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
  call $math/nthFibonacciRecursive
  local.get $0
  i32.const 2
  i32.sub
  call $math/nthFibonacciRecursive
  i32.add
 )
 (func $math/nthFibonacci (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  i64.const 0
  local.set $1
  i64.const 1
  local.set $2
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
    local.set $3
    local.get $3
    if
     local.get $1
     local.get $2
     i64.add
     local.set $4
     local.get $2
     local.set $1
     local.get $4
     local.set $2
     local.get $0
     i32.const 1
     i32.sub
     local.set $0
     br $while-continue|0
    end
   end
   local.get $2
   return
  end
  local.get $1
 )
 (func $math/factorial (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  i64.const 1
  local.set $1
  i32.const 2
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.le_s
   local.set $3
   local.get $3
   if
    local.get $1
    local.get $2
    i64.extend_i32_s
    i64.mul
    local.set $1
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
 )
 (func $math/nthPrime (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 2
  local.set $1
  i32.const 0
  local.set $2
  loop $while-continue|0
   local.get $0
   i32.const 0
   i32.gt_s
   local.set $3
   local.get $3
   if
    i32.const 2
    local.set $4
    i32.const 1
    local.set $5
    loop $while-continue|1
     local.get $4
     local.get $4
     i32.mul
     local.get $1
     i32.le_s
     if (result i32)
      local.get $5
     else
      i32.const 0
     end
     local.set $6
     local.get $6
     if
      local.get $1
      local.get $4
      i32.rem_s
      i32.const 0
      i32.eq
      if
       i32.const 0
       local.set $5
      else
       local.get $4
       i32.const 1
       i32.add
       local.set $4
      end
      br $while-continue|1
     end
    end
    local.get $5
    if
     local.get $0
     i32.const 1
     i32.sub
     local.set $0
     local.get $1
     local.set $2
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
