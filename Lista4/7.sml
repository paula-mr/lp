signature MATH =
sig
    exception Negative
    val fact : int -> int
    val halfPi : real
    val pow : int * int -> int
    val double : int -> int
end;

structure MyMathLib :> MATH =
struct
    exception Negative
    fun fact x = if x < 0 then raise Negative else if x = 0 then 1 else x * fact (x - 1)
    fun double x = if x < 0 then raise Negative else 2*x
    val halfPi = 3.14 / 2.0
    fun pow (x, 0) = 1
        | pow (x, y) = if x < 0 orelse y < 0 then raise Negative else x * pow(x, y-1)
end;

fun applyMyMathLib (x, "pow") = print(Int.toString(MyMathLib.pow(x,x)))
    | applyMyMathLib (x, "double") = print(Int.toString(MyMathLib.double(x)))
    | applyMyMathLib (x, "fact") = print(Int.toString(MyMathLib.fact(x)))
    | applyMyMathLib (x, _) = raise Match;

fun useMyMathLib (x, y) = applyMyMathLib(x, y) handle Negative => print "Nao posso lidar com valores negativos!";