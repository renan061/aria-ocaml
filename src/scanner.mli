
type token =
    | LID of string
    | UID of string
    | INT of int
    | FLOAT of float
    | TK of char
    | EOF

val scan : Lexing.lexbuf -> token
