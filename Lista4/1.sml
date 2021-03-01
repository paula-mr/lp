signature MATH =
sig
    val fact : int -> int
    val halfPi : real
    val pow : int * int -> int
    val double : int -> int
end;

structure MyMathLib =
struct
    fun fact x = if x > 1 then x * fact(x-1) else x
    fun double x = 2*x
    val halfPi = 3.14 / 2.0
    fun pow (x, y) = if y = 0 then 1 else x * pow(x, y-1)
end;