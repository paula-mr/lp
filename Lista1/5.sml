fun cumSum [] = []
    | cumSum (a::[]) = a::[]
    | cumSum (a::b::l) = 
        let 
            val aux = cumSum((a+b)::l)
        in
            a::aux
        end;