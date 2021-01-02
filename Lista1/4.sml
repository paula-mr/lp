fun max [] = 0
    | max (h::[]) = h
    | max (h::t) = 
    let
        val maxRest = max(t)
    in
        if h >= maxRest then h else maxRest
    end;