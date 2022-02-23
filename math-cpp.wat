(module
 (table 0 anyfunc)
 (memory $0 1)
 (export "memory" (memory $0))
 (export "nthFibonacciRecursive" (func $nthFibonacciRecursive))
 (export "nthFibonacci" (func $nthFibonacci))
 (export "factorial" (func $factorial))
 (export "nthPrime" (func $nthPrime))
 (func $nthFibonacciRecursive (; 0 ;) (param $0 i32) (result i32)
  (block $label$0
   (br_if $label$0
    (i32.ge_s
     (get_local $0)
     (i32.const 2)
    )
   )
   (return
    (get_local $0)
   )
  )
  (i32.add
   (call $nthFibonacciRecursive
    (i32.add
     (get_local $0)
     (i32.const -1)
    )
   )
   (call $nthFibonacciRecursive
    (i32.add
     (get_local $0)
     (i32.const -2)
    )
   )
  )
 )
 (func $nthFibonacci (; 1 ;) (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (get_local $0)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.const 1)
   )
   (block $label$1
    (br_if $label$1
     (i32.eq
      (get_local $0)
      (i32.const 1)
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (set_local $2
     (i64.const 0)
    )
    (set_local $3
     (i64.const 1)
    )
    (loop $label$2
     (set_local $3
      (i64.add
       (tee_local $1
        (get_local $3)
       )
       (get_local $2)
      )
     )
     (set_local $2
      (get_local $1)
     )
     (br_if $label$2
      (i32.gt_s
       (tee_local $0
        (i32.add
         (get_local $0)
         (i32.const -1)
        )
       )
       (i32.const 2)
      )
     )
    )
   )
   (return
    (get_local $3)
   )
  )
  (i64.const 0)
 )
 (func $factorial (; 2 ;) (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (set_local $3
   (i64.const 1)
  )
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (get_local $0)
     (i32.const 2)
    )
   )
   (set_local $1
    (i64.extend_u/i32
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
   )
   (set_local $2
    (i64.const 2)
   )
   (set_local $3
    (i64.const 1)
   )
   (loop $label$1
    (set_local $3
     (i64.mul
      (get_local $3)
      (get_local $2)
     )
    )
    (br_if $label$1
     (i64.ne
      (get_local $1)
      (tee_local $2
       (i64.add
        (get_local $2)
        (i64.const 1)
       )
      )
     )
    )
   )
  )
  (get_local $3)
 )
 (func $nthPrime (; 3 ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (get_local $0)
     (i32.const 1)
    )
   )
   (set_local $2
    (i32.const 2)
   )
   (set_local $5
    (i32.const 0)
   )
   (loop $label$1
    (set_local $4
     (i32.const 1)
    )
    (block $label$2
     (br_if $label$2
      (i32.lt_s
       (get_local $2)
       (i32.const 4)
      )
     )
     (set_local $3
      (i32.const 2)
     )
     (loop $label$3
      (set_local $4
       (i32.ne
        (tee_local $1
         (i32.rem_s
          (get_local $2)
          (get_local $3)
         )
        )
        (i32.const 0)
       )
      )
      (br_if $label$2
       (i32.eqz
        (get_local $1)
       )
      )
      (br_if $label$3
       (i32.le_s
        (i32.mul
         (tee_local $3
          (i32.add
           (get_local $3)
           (get_local $4)
          )
         )
         (get_local $3)
        )
        (get_local $2)
       )
      )
     )
    )
    (set_local $5
     (select
      (get_local $2)
      (get_local $5)
      (get_local $4)
     )
    )
    (set_local $2
     (i32.add
      (get_local $2)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (i32.gt_s
      (tee_local $0
       (i32.sub
        (get_local $0)
        (get_local $4)
       )
      )
      (i32.const 0)
     )
    )
   )
   (return
    (get_local $5)
   )
  )
  (i32.const 0)
 )
)
