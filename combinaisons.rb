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
            not /^[1-6]$/ =~ options[1]
            STDERR.puts("Invalid options")
            exit(84)
        end

        roll1 = options[0].to_i
        roll2 = options[1].to_i

        if roll1 == roll2
            STDERR.puts("The 2 options have the same value")
            exit(84)
        end

        nb_done1 = [dice.count(roll1), 3].min
        nb_done2 = [dice.count(roll2), 2].min
        nb_kept = nb_done1 + nb_done2
        nb_dice = NB_DICE - nb_kept

        printf("chances to get a %d full of %d: %.2f%%\n",
            roll1,
            roll2,
            Utilities.combinations(nb_dice, 3 - nb_done1) / 6.0 ** nb_dice * 100.0)

    end

    def Combinaisons.straight(dice, options)
        if options.length != 1 or not /^[56]$/ =~ options[0]
            STDERR.puts("Invalid options")
            exit(84)
        end

        last = options[0].to_i

        nb_kept = 0
        for i in 2..5
            nb_kept += (dice.any? { |e| e == i }) ? 1 : 0
        end

        if last == 5
            nb_kept += (dice.any? { |e| e == 1 }) ? 1 : 0
        else
            nb_kept += (dice.any? { |e| e == 6 }) ? 1 : 0
        end

        nb_dice = NB_DICE - nb_kept

        printf("chances to get a %d straight: %.2f%%\n",
            last,
            Utilities.factorial(nb_dice) / 6.0 ** nb_dice * 100.0)
    end

    def Combinaisons.yams(dice, options)
        get_n_of(dice, options, 5, "yams")
    end
end
