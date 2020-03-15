{
    type token =
        | LID of string
        | UID of string
        | INT of int
        | FLOAT of float
        | TK of char
        | EOF
}

(* -------------------------------------------------------------------------- *)

let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']
let any   = '_' | lower | upper | digit

let inum = digit+
let fnum = digit+ "." digit+

let lid = lower any*
let uid = upper any*

(* -------------------------------------------------------------------------- *)

rule scan = parse
    | inum as n   { INT (int_of_string n) }
    | fnum as n   { FLOAT (float_of_string n) }
    | lid  as lid { LID lid }
    | uid  as uid { UID uid }
    | _    as tk  { TK tk }
    | eof         { EOF }
