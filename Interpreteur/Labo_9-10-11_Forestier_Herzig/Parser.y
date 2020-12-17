-- Forestier Quentin, Herzig Melvyn 04/12/2020
{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

-- Liste des terminaux de la grammaire.
%token
 let    { TLet }
 in     { TIn }
 if     { TIf }
 then   { TThen }
 else   { TElse }
 define { TDefine }
 integer{ TInt $$ }     -- Le $$ indique qu'il faut retenir la valeur de l'entier.
 varName{ TVarName $$ } -- Le $$ indique qu'il faut retenir le nom de la variable.
 funName{ TFunName $$ } -- Le $$ indique qu'il faut retenir le nom de la fonction.
 '='    { TSym '=' }
 '+'    { TSym '+' }
 '-'    { TSym '-' }
 '*'    { TSym '*' }
 '/'    { TSym '/' }
 '<'    { TSym '<' }
 '#'    { TSym '#' }
 '('    { TOp }
 ')'    { TCp }


 -- Définition des priorités et associativités
%right in 
%right else 
%left '<'
%left '+' '-'
%left '*' '/'
%left '#'
%%

-- Règles de la grammaire

-- Prg : Expr   { Prg [] $1}
-- | FDef Prg  { let Prg defs expr = $2 in Prg ($1:defs) expr}

Prg : Expr   { ExprSimple $1 }
 | FDef { DefSimple $1 }

FDef : define funName Args '=' Expr {FDef $2 $3 $5}

Args : {- empty -} {[]}
 | varName Args { ($1:$2) }

Expr : let varName '=' Expr in Expr { Let $2 $4 $6 }
 | if Expr then Expr else Expr { If $2 $4 $6 }
 | Expr '+' Expr { Bin '+' $1 $3 }
 | Expr '-' Expr { Bin '-' $1 $3 }
 | Expr '*' Expr { Bin '*' $1 $3 }
 | Expr '/' Expr { Bin '/' $1 $3 }
 | Expr '<' Expr { Bin '<' $1 $3 }
 | '(' '-' Expr ')' { Una '-' $3 }
 | '(' '+' Expr ')' { Una '+' $3 }
 | '#' Expr  { Una '#' $2 }
 | integer { Cst $1 }
 | varName { Var $1 }
 | funName '(' Exprs ')' {FApp $1 $3}
 | '(' Expr ')' {$2}

Exprs: {- empty -} { [] }
 | Expr Exprs { $1:$2}

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

-- Définition du type Exp utilisé pour construire l'arbre syntaxique.
data Exp  = Let Name Exp Exp | Bin Char Exp Exp | Cst Int | Var Name | If Exp Exp Exp | Una Char Exp | FApp Name [Exp] deriving Show
data FDef = FDef Name [Name] Exp deriving Show

-- data Prg  = Prg [FDef] Exp deriving Show
data Prg  = ExprSimple Exp | DefSimple FDef deriving Show
}