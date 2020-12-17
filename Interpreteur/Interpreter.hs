-- Forestier Quentin, Herzig Melvyn 04/12/2020
module Interpreter
where
import Parser
import Lexer

type Var  = (String, Int)
type Func = (String, [String], Exp)
type Env  = ([Var], [Func]) 

-- Evaluation des expressions
eval (Bin c x y) env 
 | c == '+' = (eval x env) + (eval y env)
 | c == '-' = (eval x env) - (eval y env)
 | c == '*' = (eval x env) * (eval y env)
 | c == '/' = div (eval x env) (eval y env)
 | c == '<' = if (eval x env) < (eval y env) then 1 else 0

eval (Let name exp1 exp2) env@(vars,funcs) = eval exp2 ((name, eval exp1 env):vars, funcs)  

eval (Cst n) _ = n

eval (If cond x y) env = 
    if (eval cond env) /= 0  then eval x env
                            else eval y env 

eval (Una c exp) env
 | c == '-' = (-(eval exp env))
 | c == '+' = eval exp env
 | c == '#' = 10 * (eval exp env)

eval (Var name) env = value name env

eval (FApp func xs) env = 
    eval x $ expand env (if length xs /= length vars then error "Invalid arg count" else vars) xs 
    where (vars, x) = extract func env

-- Lecture d'une ligne, retourne un tuple ( "Valeur à afficher", [fonctions de l'environnement augmenté])
readProg (ExprSimple exp) env@(vars, funcs) = let val = eval exp env in (show val, funcs)
readProg (DefSimple (FDef fname args exp)) (vars, funcs) = (fname, (fname,args,exp):funcs)

-- Expansion de l'environnement des variables
expand env [] [] = env
expand env (v:vs) (x:xs) = ((v, eval x env):vars, funcs)
 where (vars, funcs) = expand env vs xs

-- Récupération d'une variable
value name (vars,_) = value' name vars
 where 
     value' name [] = error $ "Out of scope variable " ++ name
     value' name ((var,val):vars) =
        if var == name then val else value' name vars

-- Récuprération d'une fonction 
extract name (_,funcs) = extract' name funcs
 where
    extract' name [] = error $ "Undefined function : " ++ name
    extract' name ((func,vars,body):funcs) =
        if func == name then (vars,body) else extract' name funcs

repl funcs = 
    do
        putStr "SPL>"
        line <- getLine
        let tokens = lexer line -- Récupération des tokens
        putStrLn $ show tokens
        let ast = parser tokens -- Récupération de l'arbre syntaxique
        putStrLn $ show ast
        let (toPrint, funcsIncreased) = readProg ast ([],funcs) -- Evaluation
        putStrLn toPrint
        repl funcsIncreased

launchRepl = repl [("Pred", ["n"],(Bin '-' (Var "n") (Cst 1))),
                   ("Fact", ["n"],(If (Bin '<' (Var "n") (Cst 1)) (Cst 1) (Bin '*' (Var "n") (FApp "Fact" [FApp "Pred" [Var "n"]])))),
                   ("Surface", ["x","y"], (If (Bin '<' (Cst 0) (Var "x")) (If (Bin '<' (Cst 0) (Var "y")) (Bin '*' (Var "x") (Var "y")) (Una '-' (Cst 1))) (Una '-' (Cst 1))))]