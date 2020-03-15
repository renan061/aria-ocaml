(* Aria compiler *)

let cin =
    if Array.length Sys.argv > 1
        then open_in Sys.argv.(1)
        else stdin

let lexbuf = Lexing.from_channel cin

;;

match Scanner.scan lexbuf with
| LID id -> print_string id
| UID id -> print_string id
| INT inum -> print_int inum
| FLOAT fnum -> print_float fnum
| TK tk -> print_char tk
| EOF -> print_string "end of file\n"
