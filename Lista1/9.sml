datatype dinheiro = 
    Centavos of int 
    | Real of real 
    | Pessoa_Dinheiro of (string * real);

fun amount (Centavos(d)) = d
    | amount (Real(d)) = floor(d*100.0)
    | amount (Pessoa_Dinheiro(_, d)) = floor(d*100.0);