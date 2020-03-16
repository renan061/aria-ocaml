%{
    open Ast
%}

%token LBRACE "{" RBRACE "}" LBRACKET "[" RBRACKET "]" LPAR "(" RPAR ")"
%token COMMA "," COLON ":"

/*
%token ACQUIRE
%token BROADCAST
%token ELSE
%token FALSE
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
%token TRUE
%token VAL
%token VAR
%token WAIT
%token WHILE
*/

%token <string> LID UID

%token <int> INT
%token <float> FLOAT
%token <string> STRING

%token <char> TK

%token EOF

%start <Ast.ast> program
%start <Ast.def> def

%%

program : d = def ds = program { d :: ds }
        | EOF                  { []      }

def : FUNCTION id = LID "{" exps = exp* "}" { Function (id, exps) }

exp : n = INT { Literal (Int n) }

/*
parameters :
    | LPAR parameter (COMMA parameter)* RPAR
    | <empty>

parameter : COLON type

return :

block :
*/

%%
