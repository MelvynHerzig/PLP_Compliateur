-- Forestier Quentin, Herzig Melvyn 04/12/2020
{
-- Définition du nom du module et des exports.
module Lexer (lexer, Name, Token(..)) where
}

-- Le wrapper définit le type de analyseur que Alex va générer.
%wrapper "basic"
$digit = 0-9            -- Macro pour définir les chiffres.
$alphaNum = [A-Za-z0-9] -- Macro pour définir les lettres.
$low      = [a-z]
$up       = [A-Z]


-- Règles, chaque règle doit spécifier une lambda expression de type [Char] -> Token
tokens :-
 $white+ ;
 let                    { \s -> TLet }
 in                     { \s -> TIn }
 if                     { \s -> TIf}
 then                   { \s -> TThen}
 else                   { \s -> TElse}
 define                 { \s -> TDefine}
 $digit+                { \s -> TInt (read s) }
 [\=\+\*\-\/\<\#]       { \s -> TSym (head s) }
 $low{1}$alphaNum*      { \s -> TVarName s }
 $up{1}$alphaNum*       { \s -> TFunName s}
 [\(]                   { \s -> TOp}
 [\)]                   { \s -> TCp}

{
-- Définition du type Token.
type Name = [Char]
data Token = TLet | TIn | TSym Char | TVarName Name | TInt Int |
             TIf | TThen | TElse | TDefine | TFunName Name |
             TOp | TCp deriving (Eq,Show)
             
-- Alias du nom de la fonction d'analyse lexicale.
lexer = alexScanTokens
}