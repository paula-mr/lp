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
      | (Op1 (Not, i)) => 
      let
        val simplifiedI = (simplify i);
      in
        case simplifiedI of
          (Op2 a) => (Op1(Not, (Op2 a)))
          | (a) => (simplify a)
      end
      | (Op2 (Add, a, IConst 0)) => (simplify a)
      | (Op2 (Add, IConst 0, b)) => (simplify b)
      | (Op2 (Add, IConst a, IConst b)) => (Op2 (Add, (IConst a), (IConst b)))
      | (Op2 (Add, a, b)) => let
        val simplifiedA = (simplify a);
        val simplifiedB = (simplify b);
      in
        case (simplifiedA, simplifiedB) of
        (IConst c, d) => (simplify (Op2 (Add, (IConst c), d)))
        | (c, IConst d) => (simplify (Op2 (Add, c, (IConst d))))
        | (c, d) => (Op2 (Add, c, d))
      end 
      | (Op2 (Sub, a, IConst 0)) => (simplify a)
      | (Op2 (Sub, IConst a, IConst b)) => if a = b then (IConst 0) else (Op2 (Sub, (IConst a), (IConst b)))
      | (Op2 (Sub, a, b)) => let
        val simplifiedA = (simplify a);
        val simplifiedB = (simplify b);
      in
        case (simplifiedA, simplifiedB) of
        (c, IConst d) => (simplify (Op2 (Sub, c, (IConst d))))
        | (c, d) => (Op2 (Sub, c, d))
      end 
      | (Op2 (Mul, IConst 1, b)) => (simplify b)
      | (Op2 (Mul, a, IConst 1)) => (simplify a)
      | (Op2 (Mul, IConst 0, _)) => (IConst 0)
      | (Op2 (Mul, _, IConst 0)) => (IConst 0)
      | (Op2 (Mul, IConst a, IConst b)) => (Op2 (Mul, (IConst a), (IConst b)))
      | (Op2 (Mul, a, b)) => 
      let
        val simplifiedA = (simplify a);
        val simplifiedB = (simplify b);
      in
        case (simplifiedA, simplifiedB) of
          (IConst c, d) => (simplify (Op2 (Mul, (IConst c), d)))
        | (c, IConst d) => (simplify (Op2 (Mul, c, (IConst d))))
        | (a, b) => (Op2 (Mul, a, b))
      end 
      | (Op2 (Or, a, b)) => 
      let
        val simplifiedA = (simplify a);
        val simplifiedB = (simplify b);
      in
        if simplifiedA = simplifiedB then simplifiedA else (Op2 (Or, simplifiedA, simplifiedB))
      end
      | (Op2 (Gt, a, b)) => (Op2 (Gt, (simplify a), (simplify b)))
      | (Op2 (Eq, a, b)) => (Op2 (Eq, (simplify a), (simplify b)));

simplify (Op1 (Not, (Op2 (Add, IConst 10, IConst 2))));
simplify (Op2 (Or, (Op2 (Mul, IConst 10, IConst 12)), (Op2 (Mul, IConst 10, IConst 12))));
simplify (Op2(Mul, Op2(Add, IConst 1, IConst 0), Op2(Add, IConst 9, IConst 0)));
simplify (Op2 (Mul, Op2 (Add, IConst 1, IConst 0), Op2 (Add, Op2 (Or, IConst 10, IConst 12), IConst 0)));
simplify (Op2 (Add, Op2 (Mul, IConst 3, IConst 4), Op2 (Gt, Op2 (Or, IConst 10, IConst 12), IConst 10)));
simplify (Op2 (Mul, Op2 (Mul, IConst 3, IConst 4), Op2 (Gt, Op2 (Or, IConst 10, IConst 12), IConst 10)));
simplify (Op2 (Sub, Op2 (Mul, IConst 3, IConst 4), Op2 (Gt, Op2 (Or, IConst 10, IConst 12), IConst 10)));