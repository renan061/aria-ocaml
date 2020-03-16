
(* auxiliary *)

type id = string

(* main *)

type literal =
    | Int of int
    | Float of float
    | String of string

type exp =
    | Literal of literal
    (* | Binary of token * exp * exp *)

type def =
    | Function of id * exp list

type ast = def list

(*
type type_ =
type block =
type stmt =
type lhs =
*)

(*
type call =
*)
