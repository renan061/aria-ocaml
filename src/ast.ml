
(* auxiliary *)

type id = string

(* main *)

type ast = def list

and def =
    | Val of id * typ option * exp
    | Var of id * typ option * exp option
    | Function of id * def list * typ option * block

and block = block_elem list

and typ =
    | Id of id
    | Array of typ

and stmt =
    | Asg

and exp =
    | Literal of literal
    | Lhs of lhs

and literal =
    | True
    | False
    | Int of int
    | Float of float
    | String of string

and lhs =
    | Id of id
    | Indexed of exp * exp

(* TODO *)

and block_elem =
    | Variable of def
    | Stmt of stmt
