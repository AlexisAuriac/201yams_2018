require "./utilities.rb"

PA = 1.0 / 6.0
NB_DICE = 5

def get_n_of(dice, options, nb_roll, name_comb)
    if options.length != 1 or not /^[1-6]$/ =~ options[0]
        STDERR.puts("Invalid options")
        exit(84)
    end

    roll = options[0].to_i
    nb_done = dice.count(roll)

    nb_dice = NB_DICE - nb_done
    nb_roll -= nb_done

    if nb_roll < 0
        nb_roll = 0
    end

    prob = 0
    for i in nb_roll...(nb_dice + 1)
        nb_comb = Utilities.combinations(nb_dice, i)
        p1 = PA ** i
        p2 = (1 - PA) ** (nb_dice - i)
        prob += nb_comb * p1 * p2
    end
    prob *= 100

    printf("chances to get a %d %s: %.2f%\n", roll, name_comb, prob)
end

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
        get_n_of(dice, options, 2, "pair")
    end

    def Combinaisons.three(dice, options)
        get_n_of(dice, options, 3, "three-of-a-kind")
    end

    def Combinaisons.four(dice, options)
        get_n_of(dice, options, 4, "four-of-a-kind")
    end

    def Combinaisons.full(dice, options)
        puts("TODO")
    end

    def Combinaisons.straight(dice, options)
        puts("TODO")
    end

    def Combinaisons.yams(dice, options)
        get_n_of(dice, options, 5, "yams")
    end
end
