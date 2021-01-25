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
      | (Op2 (Add, IConst 0, IConst b)) => (IConst b)
      | (Op2 (Add, IConst a, IConst 0)) => (IConst a)
      | (Op2 (Add, Op1 a, IConst 0)) => (simplify (Op1 a))
      | (Op2 (Add, Op2 a, IConst 0)) => (simplify (Op2 a))
      | (Op2 (Add, IConst 0, Op1 b)) => (simplify (Op1 b))
      | (Op2 (Add, IConst 0, Op2 b)) => (simplify (Op2 b))
      | (Op2 (Sub, IConst a, IConst 0)) => (IConst a)
      | (Op2 (Sub, Op1 a, IConst 0)) => (simplify (Op1 a))
      | (Op2 (Sub, Op2 a, IConst 0)) => (simplify (Op2 a))
      | (Op2 (Sub, IConst a, IConst b)) => if a = b then (IConst 0) else (Op2 (Sub, IConst a, IConst b))
      | (Op2 (Mul, IConst 1, b)) => (simplify b)
      | (Op2 (Mul, a, IConst 1)) => (simplify a)
      | (Op2 (Mul, IConst 0, _)) => (IConst 0)
      | (Op2 (Mul, _, IConst 0)) => (IConst 0)
      | (Op2 (Mul, a, b)) => (simplify (Op2 (Mul, (simplify a), (simplify b))))
      | (Op2 (Or, IConst a, IConst b)) => if a = b then (IConst a) else (Op2 (Or, IConst a, IConst b));


simplify (Op2(Mul, Op2(Add, IConst 1, IConst 0), Op2(Add, IConst 9, IConst 0)));
