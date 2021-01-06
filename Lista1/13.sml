fun add (x, y) = x + y;
fun square (x) = x*x;

fun compose (f, g) (x, y) = f(g(x,y));

compose(square, add) (5, 4);