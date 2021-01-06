(* considerei não ter que me preocupar com listas de tamanhos diferentes *)

fun multiPairs (n, m) = map (fn (a,b) => (a*b)) (ListPair.zip(n,m));