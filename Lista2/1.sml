datatype expr = IConst of int 
                | Plus of expr * expr 
                | Minus of expr * expr
                | Multi of expr * expr
                | Div of expr * expr
                | Max of expr * expr
                | Min of expr * expr
                | Eq of expr * expr
                | Gt of expr * expr;

fun eval (IConst i) = i
    | eval (Plus (x, y)) = (eval x) + (eval y)
    | eval (Minus (x, y)) = (eval x) - (eval y)
    | eval (Multi (x, y)) = (eval x) * (eval y)
    | eval (Div (x, y)) =
        let
            val denominator = (eval y)
        in
            if denominator = 0 then 0 else (eval x) div denominator
        end
    | eval (Max (x, y)) = 
        let
            val valX = (eval x);
            val valY = (eval y)
        in
            if valX > valY then valX else valY
        end
    | eval (Min (x, y)) = 
        let
            val valX = (eval x);
            val valY = (eval y)
        in
            if valX < valY then valX else valY
        end
    | eval (Eq (x, y)) = 
        let
            val valX = (eval x);
            val valY = (eval y)
        in
            if valX = valY then 1 else 0
        end
    | eval (Gt (x, y)) = 
        let
            val valX = (eval x);
            val valY = (eval y)
        in
            if valX <= valY then 0 else 1
        end;