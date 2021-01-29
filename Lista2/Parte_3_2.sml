fun g x = 
    let
        val inc = 1
        fun f y = y + inc
        fun h z = 
        let
            val inc = 2 
        in
            f z
        end 
    in
        h x
    end

g 5;