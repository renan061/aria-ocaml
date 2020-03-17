%{
    open Ast
%}

%token LBRACE "{" RBRACE "}" LBRACKET "[" RBRACKET "]" LPAR "(" RPAR ")"
%token COMMA "," COLON ":" SEMICOLON ";"

%token EQUALS "="

/*
%token ACQUIRE
%token BROADCAST
%token ELSE
%token FOR
*/
%token FUNCTION
/*
%token IF
%token IMMUT
%token IN
%token INIT
%token INTERFACE
%token MONITOR
%token PRIVATE
%token RECORD
%token RELEASE
%token RETURN
%token SIGNAL
%token SPAWN
%token WAIT
%token WHILE
*/

%token VAL VAR
%token <string> LID UID

%token TRUE FALSE
%token <int> INT
%token <float> FLOAT
%token <string> STRING

%token EOF

%start <Ast.ast> program

%%

program : def program { $1 :: $2 } | EOF { [] }

def : variable_def { $1 }
    | function_def { $1 }

variable_def : val_def { $1 } | var_def { $1 }

val_def : VAL LID preceded(":", typ)? "=" exp ";" { Val ($2, $3, $5)        }
var_def : VAR LID ":" typ ";"                     { Var ($2, Some $4, None) }
        | VAR LID preceded(":", typ)? "=" exp ";" { Var ($2, $3, Some $5)   }

function_def : FUNCTION LID params preceded(":", typ)? block
    { Function ($2, $3, $4, $5) }

params : /* empty */                                 { [] }
       | "(" separated_nonempty_list(",", param) ")" { $2 }

param : LID ":" typ { Var ($1, Some $3, None) }

block : "{" block_elem* "}" { $2 }

block_elem : variable_def { Variable $1 }

typ : UID         { Id $1    }
    | "[" typ "]" { Array $2 }

exp : literal { Literal $1 }
    | lhs     { Lhs $1     }

literal : TRUE   { True      }
        | FALSE  { False     }
        | INT    { Int $1    }
        | FLOAT  { Float $1  }
        | STRING { String $1 }

lhs : LID                             { Id $1                  }
    | array = exp "[" index = exp "]" { Indexed (array, index) }

%%
