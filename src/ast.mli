
type ast =
    | Exp of exp

type exp =
    | LiteralInt of int
    | Binary of exp * exp
