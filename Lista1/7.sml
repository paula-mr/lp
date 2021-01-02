fun shouldSplit #" " = true
    | shouldSplit #"," = true
    | shouldSplit #"." = true
    | shouldSplit #"-" = true
    | shouldSplit a = false;

fun split "" = []
    | split f = String.tokens shouldSplit f;