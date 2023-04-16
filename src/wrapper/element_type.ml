type t =
  | Invalid
  | Pred
  | S8
  | S16
  | S32
  | S64
  | U8
  | U16
  | U32
  | U64
  | Bf16
  | F16
  | F32
  | F64
  | C64
  | C128
  | Tuple
  | OpaqueType
  | Token
[@@deriving sexp]

let to_c_int = function
  | Invalid -> 0
  | Pred -> 1
  | S8 -> 2
  | S16 -> 3
  | S32 -> 4
  | S64 -> 5
  | U8 -> 6
  | U16 -> 7
  | U32 -> 8
  | U64 -> 9
  | Bf16 -> 16
  | F16 -> 10
  | F32 -> 11
  | F64 -> 12
  | C64 -> 15
  | C128 -> 18
  | Tuple -> 13
  | OpaqueType -> 14
  | Token -> 17

let of_c_int = function
  | 1 -> Pred
  | 2 -> S8
  | 3 -> S16
  | 4 -> S32
  | 5 -> S64
  | 6 -> U8
  | 7 -> U16
  | 8 -> U32
  | 9 -> U64
  | 16 -> Bf16
  | 10 -> F16
  | 11 -> F32
  | 12 -> F64
  | 15 -> C64
  | 18 -> C128
  | 13 -> Tuple
  | 14 -> OpaqueType
  | 17 -> Token
  | _ -> Invalid

let to_string = function
  | Invalid -> "Invalid"
  | Pred -> "Pred"
  | S8 -> "S8"
  | S16 -> "S16"
  | S32 -> "S32"
  | S64 -> "S64"
  | U8 -> "U8"
  | U16 -> "U16"
  | U32 -> "U32"
  | U64 -> "U64"
  | Bf16 -> "Bf16"
  | F16 -> "F16"
  | F32 -> "F32"
  | F64 -> "F64"
  | C64 -> "C64"
  | C128 -> "C128"
  | Tuple -> "Tuple"
  | OpaqueType -> "OpaqueType"
  | Token -> "Token"

let size_in_bytes = function
  | Invalid -> None
  | Pred -> None
  | S8 -> Some 1
  | S16 -> Some 2
  | S32 -> Some 4
  | S64 -> Some 8
  | U8 -> Some 1
  | U16 -> Some 2
  | U32 -> Some 4
  | U64 -> Some 8
  | Bf16 -> Some 2
  | F16 -> Some 2
  | F32 -> Some 4
  | F64 -> Some 8
  | C64 -> Some 8
  | C128 -> Some 16
  | Tuple -> None
  | OpaqueType -> None
  | Token -> None
