module Combinaisons
    def Combinaisons.combinaisons_str
       return [
            "pair",
            "three",
            "four",
            "full",
            "straight",
            "yams"
        ]
    end

    def Combinaisons.pair(dice, options)
        puts("TODO")
    end

    def Combinaisons.three(dice, options)
        puts("TODO")
    end

    def Combinaisons.four(dice, options)
        puts("TODO")
    end

    def Combinaisons.full(dice, options)
        puts("TODO")
    end

    def Combinaisons.straight(dice, options)
        puts("TODO")
    end

    def Combinaisons.yams(dice, options)
        if options.length != 1 or not /^[1-6]$/ =~ options[0]
            STDERR.puts("Invalid options")
            exit(84)
        end

        roll = options[0].to_i
        nb_done = dice.count(roll)
        prob = (1.0 / 6.0) ** (5 - nb_done) * 100
        puts(sprintf("chances to get a %d yams: %.2f", roll, prob))
    end
end
