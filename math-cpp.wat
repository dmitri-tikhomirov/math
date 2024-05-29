(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32) (result i64)))
 (type $2 (func))
 (type $3 (func (param i32)))
 (type $4 (func (result i32)))
 (global $global$0 (mut i32) (i32.const 66560))
 (memory $0 258 258)
 (table $0 2 2 funcref)
 (elem $0 (i32.const 1) $0)
 (export "memory" (memory $0))
 (export "nthFibonacciRecursive" (func $1))
 (export "nthFibonacci" (func $2))
 (export "factorial" (func $3))
 (export "nthPrime" (func $4))
 (export "_initialize" (func $0))
 (export "__indirect_function_table" (table $0))
 (export "_emscripten_stack_restore" (func $5))
 (export "emscripten_stack_get_current" (func $6))
 (func $0
 )
 (func $1 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (if
   (i32.lt_s
    (local.get $0)
    (i32.const 2)
   )
   (then
    (return
     (local.get $0)
    )
   )
  )
  (loop $label$2
   (local.set $1
    (i32.add
     (call $1
      (i32.sub
       (local.get $0)
       (i32.const 1)
      )
     )
     (local.get $1)
    )
   )
   (br_if $label$2
    (block (result i32)
     (local.set $3
      (i32.gt_u
       (local.get $0)
       (i32.const 3)
      )
     )
     (local.set $0
      (i32.sub
       (local.get $0)
       (i32.const 2)
      )
     )
     (local.get $3)
    )
   )
  )
  (i32.add
   (local.get $0)
   (local.get $1)
  )
 )
 (func $2 (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (if
   (i32.le_s
    (local.get $0)
    (i32.const 0)
   )
   (then
    (return
     (i64.const 0)
    )
   )
  )
  (local.set $1
   (i64.const 1)
  )
  (block $label$2
   (br_if $label$2
    (i32.eq
     (local.get $0)
     (i32.const 1)
    )
   )
   (local.set $4
    (i32.and
     (local.tee $3
      (i32.sub
       (local.get $0)
       (i32.const 1)
      )
     )
     (i32.const 7)
    )
   )
   (block $label$3
    (if
     (i32.lt_u
      (i32.sub
       (local.get $0)
       (i32.const 2)
      )
      (i32.const 7)
     )
     (then
      (br $label$3)
     )
    )
    (local.set $3
     (i32.and
      (local.get $3)
      (i32.const -8)
     )
    )
    (local.set $0
     (i32.const 0)
    )
    (loop $label$5
     (local.set $1
      (i64.add
       (local.tee $2
        (i64.add
         (local.tee $1
          (i64.add
           (local.tee $2
            (i64.add
             (local.tee $1
              (i64.add
               (local.tee $2
                (i64.add
                 (local.tee $1
                  (i64.add
                   (local.tee $2
                    (i64.add
                     (local.get $1)
                     (local.get $2)
                    )
                   )
                   (local.get $1)
                  )
                 )
                 (local.get $2)
                )
               )
               (local.get $1)
              )
             )
             (local.get $2)
            )
           )
           (local.get $1)
          )
         )
         (local.get $2)
        )
       )
       (local.get $1)
      )
     )
     (br_if $label$5
      (i32.ne
       (local.tee $0
        (i32.add
         (local.get $0)
         (i32.const 8)
        )
       )
       (local.get $3)
      )
     )
    )
   )
   (br_if $label$2
    (i32.eqz
     (local.get $4)
    )
   )
   (local.set $0
    (i32.const 0)
   )
   (loop $label$6
    (local.set $1
     (i64.add
      (local.get $2)
      (local.tee $2
       (local.get $1)
      )
     )
    )
    (br_if $label$6
     (i32.ne
      (local.tee $0
       (i32.add
        (local.get $0)
        (i32.const 1)
       )
      )
      (local.get $4)
     )
    )
   )
  )
  (local.get $1)
 )
 (func $3 (param $0 i32) (result i64)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local.set $2
   (i64.const 1)
  )
  (block $label$1
   (br_if $label$1
    (i32.lt_s
     (local.get $0)
     (i32.const 2)
    )
   )
   (local.set $4
    (i64.and
     (local.tee $2
      (i64.sub
       (local.tee $1
        (i64.extend_i32_u
         (i32.add
          (local.get $0)
          (i32.const 1)
         )
        )
       )
       (i64.const 2)
      )
     )
     (i64.const 7)
    )
   )
   (block $label$2
    (if
     (i64.lt_u
      (i64.sub
       (local.get $1)
       (i64.const 3)
      )
      (i64.const 7)
     )
     (then
      (local.set $2
       (i64.const 1)
      )
      (local.set $1
       (i64.const 2)
      )
      (br $label$2)
     )
    )
    (local.set $5
     (i64.and
      (local.get $2)
      (i64.const -8)
     )
    )
    (local.set $1
     (i64.const 2)
    )
    (local.set $2
     (i64.const 1)
    )
    (loop $label$4
     (local.set $2
      (i64.mul
       (i64.add
        (local.get $1)
        (i64.const 7)
       )
       (i64.mul
        (i64.add
         (local.get $1)
         (i64.const 6)
        )
        (i64.mul
         (i64.add
          (local.get $1)
          (i64.const 5)
         )
         (i64.mul
          (i64.add
           (local.get $1)
           (i64.const 4)
          )
          (i64.mul
           (i64.add
            (local.get $1)
            (i64.const 3)
           )
           (i64.mul
            (i64.add
             (local.get $1)
             (i64.const 2)
            )
            (i64.mul
             (i64.mul
              (local.get $1)
              (local.get $2)
             )
             (i64.or
              (local.get $1)
              (i64.const 1)
             )
            )
           )
          )
         )
        )
       )
      )
     )
     (local.set $1
      (i64.add
       (local.get $1)
       (i64.const 8)
      )
     )
     (br_if $label$4
      (i64.ne
       (local.tee $3
        (i64.add
         (local.get $3)
         (i64.const 8)
        )
       )
       (local.get $5)
      )
     )
    )
   )
   (br_if $label$1
    (i64.eqz
     (local.get $4)
    )
   )
   (local.set $3
    (i64.const 0)
   )
   (loop $label$5
    (local.set $2
     (i64.mul
      (local.get $1)
      (local.get $2)
     )
    )
    (local.set $1
     (i64.add
      (local.get $1)
      (i64.const 1)
     )
    )
    (br_if $label$5
     (i64.ne
      (local.tee $3
       (i64.add
        (local.get $3)
        (i64.const 1)
       )
      )
      (local.get $4)
     )
    )
   )
  )
  (local.get $2)
 )
 (func $4 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (if
   (i32.gt_s
    (local.get $0)
    (i32.const 0)
   )
   (then
    (local.set $1
     (i32.const 2)
    )
    (loop $label$2
     (local.set $3
      (i32.const 2)
     )
     (local.set $0
      (block $label$3 (result i32)
       (if
        (i32.le_u
         (local.get $1)
         (i32.const 3)
        )
        (then
         (local.set $2
          (local.get $1)
         )
         (br $label$3
          (i32.sub
           (local.get $0)
           (i32.const 1)
          )
         )
        )
       )
       (loop $label$5
        (if
         (i32.ge_u
          (local.get $1)
          (i32.mul
           (local.tee $3
            (i32.add
             (local.get $3)
             (local.tee $5
              (i32.ne
               (local.tee $4
                (i32.rem_u
                 (local.get $1)
                 (local.get $3)
                )
               )
               (i32.const 0)
              )
             )
            )
           )
           (local.get $3)
          )
         )
         (then
          (br_if $label$5
           (local.get $4)
          )
         )
        )
       )
       (local.set $2
        (select
         (local.get $1)
         (local.get $2)
         (local.get $4)
        )
       )
       (i32.sub
        (local.get $0)
        (local.get $5)
       )
      )
     )
     (local.set $1
      (i32.add
       (local.get $1)
       (i32.const 1)
      )
     )
     (br_if $label$2
      (i32.gt_s
       (local.get $0)
       (i32.const 0)
      )
     )
    )
   )
  )
  (local.get $2)
 )
 (func $5 (param $0 i32)
  (global.set $global$0
   (local.get $0)
  )
 )
 (func $6 (result i32)
  (global.get $global$0)
 )
)

