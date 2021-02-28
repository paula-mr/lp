signature MATH =
sig
    type math
    val fact : int -> math
    val halfPi : math
    val pow : int * int -> math
    val double : int -> math
end;

structure MyMathLib =
struct
    fun fact x = if x > 1 then x * fact(x-1) else x
    fun double x = 2*x
    val halfPi = 3.14 / 2.0
    fun pow (x, y) = if y = 0 then 1 else x * pow(x, y-1)
end;

MyMathLib.fact(5);
MyMathLib.double(2);
MyMathLib.halfPi;
MyMathLib.pow(3,3);