{
  open Printf

  type token =
    | LID of string
    | UID of string
    | INT of int
    | EOF
}

(* -------------------------------------------------------------------------- *)

let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']
let any   = '_' | lower | upper | digit

let aint   = digit+
let afloat = digit+ "." digit+

let lid = lower any*
let uid = upper any*

(* -------------------------------------------------------------------------- *)

rule aria = parse
  | digit+ as aint { INT (int_of_string aint) }
  | lid as lid     { LID lid }
  | uid as uid     { UID uid }
  | _              { aria lexbuf }
  | eof            { EOF }

(* -------------------------------------------------------------------------- *)

{
  let rec scan lexbuf =
    match aria lexbuf with
    | LID lid  -> print_string lid; print_string "\n"
    | UID uid  -> print_string uid; print_string "\n"
    | INT aint -> print_int aint;   print_string "\n"
    | EOF      -> ()

  let main () =
    let cin =
      if Array.length Sys.argv > 1
      then open_in Sys.argv.(1)
      else stdin
    in
    let lexbuf = Lexing.from_channel cin in
    scan lexbuf

  let _ = Printexc.print main ()
}
