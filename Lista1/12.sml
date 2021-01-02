(* considerei não ter que me preocupar com listas de tamanhos diferentes *)

fun multiPairs (n::ns, m::ms) = (n*m)::multiPairs(ns, ms) | multiPairs ([], []) = [];