fun sumLists ([], []) = []
    | sumLists (h1::t1, h2::t2) = (h1+h2)::sumLists(t1, t2)
    | sumLists ([], l2) = l2
    | sumLists (l1, []) = l1;