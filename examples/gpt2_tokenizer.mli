type t

val create : vocab_filename:string -> merge_filename:string -> t
val encode : t -> string -> int list
val decode : t -> int list -> string