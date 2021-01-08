{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,117) ([58624,65,33674,0,240,1024,20480,1052,0,0,0,0,32,19909,0,0,1940,1,8,2048,0,0,0,32815,8418,50432,65,33674,8192,240,4096,20480,1052,14496,16392,4209,57984,32,0,0,0,49152,0,384,7248,40964,2104,28992,31,16384,0,188,30720,1,0,4096,0,8,0,16384,4209,0,0,0,0,0,0,32768,480,49184,40963,2104,28992,16,7680,0,60,30720,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Prg","FDef","Args","Expr","Exprs","let","in","if","then","else","define","integer","varName","funName","'='","'+'","'-'","'*'","'/'","'('","')'","%eof"]
        bit_start = st Prelude.* 25
        bit_end = (st Prelude.+ 1) Prelude.* 25
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..24]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (9) = happyShift action_3
action_0 (11) = happyShift action_4
action_0 (14) = happyShift action_11
action_0 (15) = happyShift action_5
action_0 (16) = happyShift action_6
action_0 (17) = happyShift action_7
action_0 (23) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (5) = happyGoto action_10
action_0 (7) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (9) = happyShift action_3
action_1 (11) = happyShift action_4
action_1 (15) = happyShift action_5
action_1 (16) = happyShift action_6
action_1 (17) = happyShift action_7
action_1 (23) = happyShift action_8
action_1 (7) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (19) = happyShift action_20
action_2 (20) = happyShift action_21
action_2 (21) = happyShift action_22
action_2 (22) = happyShift action_23
action_2 _ = happyReduce_1

action_3 (16) = happyShift action_19
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (9) = happyShift action_3
action_4 (11) = happyShift action_4
action_4 (15) = happyShift action_5
action_4 (16) = happyShift action_6
action_4 (17) = happyShift action_7
action_4 (23) = happyShift action_8
action_4 (7) = happyGoto action_18
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_14

action_6 _ = happyReduce_15

action_7 (23) = happyShift action_17
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (9) = happyShift action_3
action_8 (11) = happyShift action_4
action_8 (15) = happyShift action_5
action_8 (16) = happyShift action_6
action_8 (17) = happyShift action_7
action_8 (19) = happyShift action_15
action_8 (20) = happyShift action_16
action_8 (23) = happyShift action_8
action_8 (7) = happyGoto action_14
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (25) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (9) = happyShift action_3
action_10 (11) = happyShift action_4
action_10 (14) = happyShift action_11
action_10 (15) = happyShift action_5
action_10 (16) = happyShift action_6
action_10 (17) = happyShift action_7
action_10 (23) = happyShift action_8
action_10 (4) = happyGoto action_13
action_10 (5) = happyGoto action_10
action_10 (7) = happyGoto action_2
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (17) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (16) = happyShift action_36
action_12 (6) = happyGoto action_35
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_2

action_14 (19) = happyShift action_20
action_14 (20) = happyShift action_21
action_14 (21) = happyShift action_22
action_14 (22) = happyShift action_23
action_14 (24) = happyShift action_34
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (9) = happyShift action_3
action_15 (11) = happyShift action_4
action_15 (15) = happyShift action_5
action_15 (16) = happyShift action_6
action_15 (17) = happyShift action_7
action_15 (23) = happyShift action_8
action_15 (7) = happyGoto action_33
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (9) = happyShift action_3
action_16 (11) = happyShift action_4
action_16 (15) = happyShift action_5
action_16 (16) = happyShift action_6
action_16 (17) = happyShift action_7
action_16 (23) = happyShift action_8
action_16 (7) = happyGoto action_32
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (9) = happyShift action_3
action_17 (11) = happyShift action_4
action_17 (15) = happyShift action_5
action_17 (16) = happyShift action_6
action_17 (17) = happyShift action_7
action_17 (23) = happyShift action_8
action_17 (7) = happyGoto action_30
action_17 (8) = happyGoto action_31
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (12) = happyShift action_29
action_18 (19) = happyShift action_20
action_18 (20) = happyShift action_21
action_18 (21) = happyShift action_22
action_18 (22) = happyShift action_23
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (18) = happyShift action_28
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (9) = happyShift action_3
action_20 (11) = happyShift action_4
action_20 (15) = happyShift action_5
action_20 (16) = happyShift action_6
action_20 (17) = happyShift action_7
action_20 (23) = happyShift action_8
action_20 (7) = happyGoto action_27
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (9) = happyShift action_3
action_21 (11) = happyShift action_4
action_21 (15) = happyShift action_5
action_21 (16) = happyShift action_6
action_21 (17) = happyShift action_7
action_21 (23) = happyShift action_8
action_21 (7) = happyGoto action_26
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (9) = happyShift action_3
action_22 (11) = happyShift action_4
action_22 (15) = happyShift action_5
action_22 (16) = happyShift action_6
action_22 (17) = happyShift action_7
action_22 (23) = happyShift action_8
action_22 (7) = happyGoto action_25
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (9) = happyShift action_3
action_23 (11) = happyShift action_4
action_23 (15) = happyShift action_5
action_23 (16) = happyShift action_6
action_23 (17) = happyShift action_7
action_23 (23) = happyShift action_8
action_23 (7) = happyGoto action_24
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_11

action_25 _ = happyReduce_10

action_26 (21) = happyShift action_22
action_26 (22) = happyShift action_23
action_26 _ = happyReduce_9

action_27 (21) = happyShift action_22
action_27 (22) = happyShift action_23
action_27 _ = happyReduce_8

action_28 (9) = happyShift action_3
action_28 (11) = happyShift action_4
action_28 (15) = happyShift action_5
action_28 (16) = happyShift action_6
action_28 (17) = happyShift action_7
action_28 (23) = happyShift action_8
action_28 (7) = happyGoto action_44
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (9) = happyShift action_3
action_29 (11) = happyShift action_4
action_29 (15) = happyShift action_5
action_29 (16) = happyShift action_6
action_29 (17) = happyShift action_7
action_29 (23) = happyShift action_8
action_29 (7) = happyGoto action_43
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (9) = happyShift action_3
action_30 (11) = happyShift action_4
action_30 (15) = happyShift action_5
action_30 (16) = happyShift action_6
action_30 (17) = happyShift action_7
action_30 (19) = happyShift action_20
action_30 (20) = happyShift action_21
action_30 (21) = happyShift action_22
action_30 (22) = happyShift action_23
action_30 (23) = happyShift action_8
action_30 (7) = happyGoto action_30
action_30 (8) = happyGoto action_42
action_30 _ = happyReduce_18

action_31 (24) = happyShift action_41
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (19) = happyShift action_20
action_32 (20) = happyShift action_21
action_32 (21) = happyShift action_22
action_32 (22) = happyShift action_23
action_32 (24) = happyShift action_40
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (19) = happyShift action_20
action_33 (20) = happyShift action_21
action_33 (21) = happyShift action_22
action_33 (22) = happyShift action_23
action_33 (24) = happyShift action_39
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_17

action_35 (18) = happyShift action_38
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (16) = happyShift action_36
action_36 (6) = happyGoto action_37
action_36 _ = happyReduce_4

action_37 _ = happyReduce_5

action_38 (9) = happyShift action_3
action_38 (11) = happyShift action_4
action_38 (15) = happyShift action_5
action_38 (16) = happyShift action_6
action_38 (17) = happyShift action_7
action_38 (23) = happyShift action_8
action_38 (7) = happyGoto action_47
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_13

action_40 _ = happyReduce_12

action_41 _ = happyReduce_16

action_42 _ = happyReduce_19

action_43 (13) = happyShift action_46
action_43 (19) = happyShift action_20
action_43 (20) = happyShift action_21
action_43 (21) = happyShift action_22
action_43 (22) = happyShift action_23
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (10) = happyShift action_45
action_44 (19) = happyShift action_20
action_44 (20) = happyShift action_21
action_44 (21) = happyShift action_22
action_44 (22) = happyShift action_23
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (9) = happyShift action_3
action_45 (11) = happyShift action_4
action_45 (15) = happyShift action_5
action_45 (16) = happyShift action_6
action_45 (17) = happyShift action_7
action_45 (23) = happyShift action_8
action_45 (7) = happyGoto action_49
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (9) = happyShift action_3
action_46 (11) = happyShift action_4
action_46 (15) = happyShift action_5
action_46 (16) = happyShift action_6
action_46 (17) = happyShift action_7
action_46 (23) = happyShift action_8
action_46 (7) = happyGoto action_48
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (19) = happyShift action_20
action_47 (20) = happyShift action_21
action_47 (21) = happyShift action_22
action_47 (22) = happyShift action_23
action_47 _ = happyReduce_3

action_48 (19) = happyShift action_20
action_48 (20) = happyShift action_21
action_48 (21) = happyShift action_22
action_48 (22) = happyShift action_23
action_48 _ = happyReduce_7

action_49 (19) = happyShift action_20
action_49 (20) = happyShift action_21
action_49 (21) = happyShift action_22
action_49 (22) = happyShift action_23
action_49 _ = happyReduce_6

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 (Prg [] happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (let Prg defs expr = happy_var_2 in Prg (happy_var_1:defs) expr
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 5 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	(HappyTerminal (TFunName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (FDef happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyTerminal (TVarName happy_var_1))
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_2)
	(HappyTerminal (TVarName happy_var_1))
	 =  HappyAbsSyn6
		 ((happy_var_1:happy_var_2)
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happyReduce 6 7 happyReduction_6
happyReduction_6 ((HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVarName happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 6 7 happyReduction_7
happyReduction_7 ((HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Bin '+' happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Bin '-' happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Bin '*' happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Bin '/' happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 4 7 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Una '-' happy_var_3
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 7 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Una '+' happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 (HappyTerminal (TInt happy_var_1))
	 =  HappyAbsSyn7
		 (Cst happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 (HappyTerminal (TVarName happy_var_1))
	 =  HappyAbsSyn7
		 (Var happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 7 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TFunName happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (FApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_3  7 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  8 happyReduction_18
happyReduction_18 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  8 happyReduction_19
happyReduction_19 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 25 25 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLet -> cont 9;
	TIn -> cont 10;
	TIf -> cont 11;
	TThen -> cont 12;
	TElse -> cont 13;
	TDefine -> cont 14;
	TInt happy_dollar_dollar -> cont 15;
	TVarName happy_dollar_dollar -> cont 16;
	TFunName happy_dollar_dollar -> cont 17;
	TSym '=' -> cont 18;
	TSym '+' -> cont 19;
	TSym '-' -> cont 20;
	TSym '*' -> cont 21;
	TSym '/' -> cont 22;
	TOp -> cont 23;
	TCp -> cont 24;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 25 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

-- Définition du type Exp utilisé pour construire l'arbre syntaxique.
data Exp  = Let Name Exp Exp | Bin Char Exp Exp | Cst Int | Var Name | If Exp Exp Exp | Una Char Exp | FApp Name [Exp] deriving Show
data FDef = FDef Name [Name] Exp deriving Show

data Prg  = Prg [FDef] Exp deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
