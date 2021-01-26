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
      | (Op1 (Not, IConst a)) => (Op1(Not, (IConst a)))
      | (Op1 (Not, i)) => (simplify (Op1(Not, (simplify i))))
      | (Op2 (Add, a, IConst 0)) => (simplify a)
      | (Op2 (Add, IConst 0, b)) => (simplify b)
      | (Op2 (Add, IConst a, IConst b)) => (Op2 (Add, (IConst a), (IConst b)))
      | (Op2 (Add, a, b)) => (simplify (Op2 (Add, (simplify a), (simplify b))))
      | (Op2 (Sub, a, IConst 0)) => (simplify a)
      | (Op2 (Sub, IConst a, IConst b)) => if a = b then (IConst 0) else (Op2 (Sub, (IConst a), (IConst b)))
      | (Op2 (Sub, a, b)) => (simplify (Op2 (Sub, (simplify a), (simplify b))))
      | (Op2 (Mul, IConst 1, b)) => (simplify b)
      | (Op2 (Mul, a, IConst 1)) => (simplify a)
      | (Op2 (Mul, IConst 0, _)) => (IConst 0)
      | (Op2 (Mul, _, IConst 0)) => (IConst 0)
      | (Op2 (Mul, IConst a, IConst b)) => (Op2 (Mul, (IConst a), (IConst b)))
      | (Op2 (Mul, a, b)) => (simplify (Op2 (Mul, (simplify a), (simplify b))))
      | (Op2 (Or, IConst a, IConst b)) => if a = b then (IConst a) else (Op2 (Or, (IConst a), (IConst b)))
      | (Op2 (Or, Op2 a, b)) => (Op2 (Or, (simplify (Op2 a)), (simplify b)))
      | (Op2 (Or, Op1 a, b)) => (Op2 (Or, (simplify (Op1 a)), (simplify b)))
      | (Op2 (Or, a, (Op2 b))) => (Op2 (Or, (simplify a), (simplify (Op2 b))))
      | (Op2 (Or, a, (Op1 b))) => (Op2 (Or, (simplify a), (simplify (Op1 b))))
      | (Op2 (Gt, a, b)) => (Op2 (Gt, (simplify a), (simplify b)))
      | (Op2 (Eq, a, b)) => (Op2 (Eq, (simplify a), (simplify b)));


simplify (Op2 (Or, (Op2 (Mul, IConst 10, IConst 12)), (Op2 (Mul, IConst 10, IConst 12))));
