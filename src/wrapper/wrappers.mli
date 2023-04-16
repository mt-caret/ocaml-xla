(* A low-level but hopefully type safe version of the API. *)
open! Base

module Shape : sig
  type t

  val dimensions : t -> int list
  val element_type : t -> Element_type.t
end

module Builder : sig
  type t

  val create : name:string -> t
  val first_error : t -> unit Or_error.t
  val current_status : t -> unit Or_error.t
end

module Literal : sig
  type t

  val create : Element_type.t -> int list -> t
  val clone : t -> t
  val reshape : t -> int list -> t
  val convert : t -> Element_type.t -> t
  val element_type : t -> Element_type.t
  val size_bytes : t -> int
  val element_count : t -> int
  val shape : t -> Shape.t
end

module Op : sig
  type t

  val constant : Builder.t -> Literal.t -> t
  val add : t -> t -> t
end

module Computation : sig
  type t

  val name : t -> string
  val build : Builder.t -> root:Op.t -> t
end

module PjRtDevice : sig
  type t

  val id : t -> int
  val process_index : t -> int
  val local_hardware_id : t -> int
  val kind : t -> string
  val debug_string : t -> string
  val to_string : t -> string
end

module PjRtClient : sig
  type t

  val cpu : unit -> t
  val gpu : memory_fraction:float -> preallocate:bool -> t
  val device_count : t -> int
  val addressable_device_count : t -> int
  val platform_name : t -> string
  val platform_version : t -> string
end

module PjRtBuffer : sig
  type t
end

module PjRtLoadedExecutable : sig
  type t

  val compile : PjRtClient.t -> Computation.t -> t
end
