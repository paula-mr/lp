fun p c = 
    let
        fun q x = x + 1
        fun r a = 
        let
            val x = 1
        in
            q x
        end 
        val x = 2;
    in
        r 0
    end;

p 0;