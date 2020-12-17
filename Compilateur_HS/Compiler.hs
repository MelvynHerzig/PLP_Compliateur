-- Forestier Quentin, Herzig Melvyn 17/12/2020
module Compiler
where
import System.IO
import Parser
import Lexer

data Instruction = ADD | DOT | HALT | INT Int | JMP Int | JZR Int | LINK Int | LOAD Int | MPY | STORE Int | SUB deriving Show

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

compile xExp = cExp ++ [DOT,HALT]
     where
        (cExp, _, _) = compileExp xExp [] 0

list [] = return ()
list (i:is) = do { putStrLn $ show i ; list is }

compilePrg = do 
                content <- readFile "Input.txt"
                putStr $ show content
               

printPrg [] = return ()
printPrg (i:is) = do
                    handle <- openFile "Prog.txt" WriteMode
                    printArray handle (i:is)
                    hClose handle

printArray handle [] = return()
printArray handle (i:is) = do 
                            hPutStr handle $ show i ++ "\n"
                            printArray handle is
                
            

