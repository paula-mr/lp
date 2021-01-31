datatype area = RConst of real 
                | AQuadrado of area 
                | ACirculo of area 
                | ARetangulo of area * area; 

fun eval (RConst i) = i 
    | eval (AQuadrado (x)) = 
        let
            val side = (eval x)
        in
            side * side
        end
    | eval (ACirculo (x)) = 
        let
            val radius = (eval x)
        in
            radius * radius * 3.14
        end
    | eval (ARetangulo (x, y)) = 
        let
            val side1 = (eval x);
            val side2 = (eval y)
        in
            side1 * side2
        end;