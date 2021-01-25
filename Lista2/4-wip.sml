datatype UnOp = Not;
datatype BinOp = Add 
                | Sub 
                | Mul 
                | Gt 
                | Eq 
                | Or;
datatype Sexpr = IConst of int 
                | Op1 of UnOp * Sexpr 
                | Op2 of BinOp * Sexpr * Sexpr;

fun simplify (e: Sexpr) : Sexpr =
    case e of
      (IConst i) => (IConst i)
      | (Op1 (Not, Op1(Not, i))) => (simplify i)
      | (Op1 (Not, i)) => Op1(Not, (simplify i))
      | (Op2 (Add, a, IConst 0)) => (simplify a)
      | (Op2 (Add, IConst 0, b)) => (simplify b)
      | (Op2 (Sub, a, IConst 0)) => (simplify a)
      | (Op2 (Sub, IConst a, IConst b)) => if a = b then (IConst 0) else (Op2 (Sub, IConst a, IConst b))
      | (Op2 (Mul, IConst 1, b)) => (simplify b)
      | (Op2 (Mul, a, IConst 1)) => (simplify a)
      | (Op2 (Mul, IConst 0, _)) => (IConst 0)
      | (Op2 (Mul, _, IConst 0)) => (IConst 0)
      | (Op2 (Mul, a, b)) => (simplify (Op2 (Mul, (simplify a), (simplify b))))
      | (Op2 (Or, IConst a, IConst b)) => if a = b then (IConst a) else (Op2 (Or, IConst a, IConst b));


simplify (Op2(Mul, Op2(Add, IConst 1, IConst 0), Op2(Add, IConst 9, IConst 0)));
