fun allTrue [] = true
    | allTrue (x::xs) = if not x then false else allTrue(xs);