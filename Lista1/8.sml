fun allTrue [] = false
    | allTrue (x::[]) = x
    | allTrue (x::xs) = if x then allTrue(xs) else false;