(* Aria compiler *)

open Ast

let cin =
    if Array.length Sys.argv > 1
        then open_in Sys.argv.(1)
        else stdin

let lexbuf = Lexing.from_channel cin

(* parsing step *)
let parse = Parser.program Scanner.scan lexbuf

let print_exp = function
    | Literal Int n -> print_int n
    | _ -> print_string "ERROR\n"

let rec print_exps = function
    | [] -> print_string ")\n"
    | exp :: exps -> print_exp exp; print_exps exps

let print_def = function
    | Function (id, exps) -> print_string id; print_exps exps

let main () = match parse with
    | d :: ds -> print_def d (*; parse *)
    | _ -> print_string "End\n"; ()

;;

main ()
