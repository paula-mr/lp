datatype perimetro = RConst of real 
                | PQuadrado of perimetro 
                | PCirculo of perimetro 
                | PRetangulo of perimetro * perimetro
                | PTriangulo of perimetro * perimetro * perimetro; 

fun eval (RConst i) = i 
    | eval (PQuadrado (x)) = 
        let
            val side = (eval x)
        in
            4.0 * side
        end
    | eval (PCirculo (x)) = 
        let
            val radius = (eval x)
        in
            2.0 * radius * 3.14
        end
    | eval (PRetangulo (x, y)) = 
        let
            val side1 = (eval x)
            val side2 = (eval y)
        in
            (2.0 * side1) + (2.0 * side2)
        end
    | eval (PTriangulo (x, y, z)) =
        let
            val side1 = (eval x)
            val side2 = (eval y)
            val side3 = (eval z)
        in
            side1 + side2 + side3
        end;