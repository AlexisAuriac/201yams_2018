require "./utilities.rb"

PA = 1.0 / 6.0
NB_DICE = 5

def get_prob(nb_dice, nb_roll)
    prob = 0
    for i in nb_roll...(nb_dice + 1)
        nb_comb = Utilities.combinations(nb_dice, i)
        p1 = PA ** i
        p2 = (1 - PA) ** (nb_dice - i)
        prob += nb_comb * p1 * p2
    end

    return prob
end

def get_prob2(nb_dice, nb_roll)
    nb_comb = Utilities.combinations(nb_dice, nb_roll)
    p1 = PA ** nb_roll
    p2 = (1 - PA) ** (nb_dice - nb_roll)
    prob = nb_comb * p1 * p2

    return prob
end

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

    prob = get_prob(nb_dice, nb_roll) * 100

    printf("chances to get a %d %s: %.2f%%\n", roll, name_comb, prob)
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
        if options.length != 2 or
            not /^[1-6]$/ =~ options[0] or
            not /^[1-6]$/ =~ options[0]
            STDERR.puts("Invalid options")
            exit(84)
        end

        roll1 = options[0].to_i
        roll2 = options[1].to_i

        if roll1 == roll2
            STDERR.puts("The 2 options have the same value")
            exit(84)
        end

        # nb_done1 = dice.count(roll1)
        # nb_done2 = dice.count(roll2)
        # nb_kept = [nb_done1, 2].min + [nb_done2, 3].min
        # nb_dice = NB_DICE - nb_kept

        # puts("nb_done1: #{nb_done1}")
        # puts("nb_done2: #{nb_done2}")
        # puts("nb_kept: #{nb_kept}")

        # if nb_done1 >= 2
        #     prob1 = 1.0
        # else
        #     # prob1 = (1.0 / 6.0) ** (2 - nb_done1)
        #     prob1 = get_prob2(nb_dice, 2 - nb_done1)
        # end

        # if nb_done2 >= 3
        #     prob2 = 1.0
        # else
        #     # prob2 = (1.0 / 6.0) ** (3 - nb_done2)
        #     prob2 = get_prob2(nb_dice, 3 - nb_done2)
        # end

        # printf("chances to get a %d full of %d: %.2f%%\n",
        #     roll1,
        #     roll2,
        #     prob1 * prob2 * 100.0)

        printf("chances to get a %d full of %d: %.2f%%\n",
            roll1,
            roll2,
            Utilities.combinations(5, 3) / 6.0 ** 5 * 100.0)

    end

    def Combinaisons.straight(dice, options)
        puts("TODO")
    end

    def Combinaisons.yams(dice, options)
        get_n_of(dice, options, 5, "yams")
    end
end
