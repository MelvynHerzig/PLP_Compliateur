-- Forestier Quentin, Herzig Melvyn 17/12/2020
module Compiler
where
import System.IO
import Parser
import Lexer
----------------------------------------
-- Constructeur des instructions SAM
----------------------------------------
data Instruction = JUMP Int | CALL Int | UNLK| EXIT Int| ADD | DOT | HALT | INT Int | JMP Int | JZR Int | LINK Int | LOAD Int | MPY | STORE Int | SUB deriving Show

----------------------------------------
-- Compilation des expressions
----------------------------------------
compileExp :: Exp -> [(Name, Int)] -> Int -> ([Instruction], Int, Int)
compileExp (Cst int) _ _ = ([INT int], 2, 0)
compileExp (Bin op xLeft xRight) map vars = (cLeft ++ cRight ++ [opCode], lLeft+lRight+1, max vLeft vRight)
    where
     opCode = case op of '+' -> ADD
                         '-' -> SUB
                         '*' -> MPY
     (cLeft, lLeft, vLeft ) = compileExp xLeft map vars
     (cRight, lRight, vRight) = compileExp xRight map vars

compileExp (If xCond xThen xElse) map vars = (code, lCond+lThen+lElse+4, max vCond $ max vThen vElse)
    where
        (cCond, lCond, vCond) = compileExp xCond map vars
        (cThen, lThen, vThen) = compileExp xThen map vars
        (cElse, lElse, vElse) = compileExp xElse map vars
        code = cCond ++ (JZR $ lThen + 2):cThen ++ (JMP $ lElse):cElse

compileExp (Let name eqExp inExp) map vars = (code, eqLength+inLength+2, max eqVars (inVars + 1))
    where
        (eqCode, eqLength, eqVars) = compileExp eqExp map vars
        (inCode, inLength, inVars) = compileExp inExp ((name,vars+1):map) (vars+1)
        code = eqCode ++ (STORE $ vars+1):inCode 

compileExp (Var name) map _ = ([LOAD $ offset name map], 2, 0) 

compileExp (FApp name seq) map vars = (sCode ++ [CALL $ offset name map], sLength+2, sVars)
    where
        (sCode, sLength, sVars) = compileSeq seq map vars

compileFDef (FDef func args body) map _ = (code, bLength+7, 0, map)
    where
        nargs = length args
        (bCode, bLength, bVars) = compileExp body (zip args [-nargs-1..] ++ map) 0
        code = LINK bVars:bCode ++ [STORE $ (-nargs)-1, UNLK, EXIT (nargs-1)] 

-- Retourne l'offset d'une variable ou l'adresse d'une fonction
offset _ [] = error "Variable/fonction inconnue."
offset name ((key,val):map)
 | name == key = val
 | otherwise = offset name map 

compileSeq [] _ _ = ([], 0, 0)
compileSeq (exp:exps) map vars = (hCode ++ tCode, hLength+tLength, max hVars tVars)
    where
        (hCode, hLength, hVars) = compileExp exp map vars
        (tCode, tLength, tVars) = compileSeq exps map vars

---------------------------------------------------
--            Compilation du programme
---------------------------------------------------
compile map code codeLen (Prg [] exp) = (JUMP codeLen):code ++ (LINK vars): cExp ++ [DOT,HALT]
    where
        (cExp, length , vars) = compileExp exp map 0

compile map code codeLen (Prg ( def@(FDef n _ _ ):defs) exp) = compile newMap (code++cfFirst) (cfLen+codeLen) (Prg defs exp)
    where
        (cfFirst, cfLen, _, newMap) = compileFDef def ((n,codeLen+2):map) 0 -- + 2 en prévision du jump Int.


startCompilation = do 
                   content <- readFile "Input.txt"
                   let code = compile [] [] 0 $ parser $ lexer $ content
                   putStrLn $ show code
                   printPrg code
               

printPrg [] = return ()
printPrg (i:is) = do
                    handle <- openFile "Prog.txt" WriteMode
                    printArray handle (i:is)
                    hClose handle

printArray handle [] = return()
printArray handle (i:is) = do 
                            hPutStr handle $ show i ++ "\n"
                            printArray handle is
                
            

