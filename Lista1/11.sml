datatype btree = Leaf | Node of (btree * int * btree);

fun sumAll Leaf = 0
    | sumAll (Node(ln, v, lr)) = v + sumAll(ln) + sumAll(lr);