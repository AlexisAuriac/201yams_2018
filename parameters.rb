require "./combinaisons.rb"

def usage()
    puts("USAGE")
    puts("  ./201yams d1 d2 d3 d4 d5 c")
    puts("")
    puts("DESCRIPTION")
    puts("  d1  value of the first die (0 if not thrown)")
    puts("  d2  value of the second die (0 if not thrown)")
    puts("  d3  value of the third die (0 if not thrown)")
    puts("  d4  value of the fourth die (0 if not thrown)")
    puts("  d5  value of the fifth die (0 if not thrown)")
    puts("  c   expected combination")
    exit(0)
end

def getDice(argv)
    dice = []

    5.times do |i|
        if not /^[0-6]$/ =~ argv[i]
            STDERR.puts("'" + argv[i] + "': Is not a valid dice roll")
            exit(84)
        end
        dice << argv[i].to_i()
    end

    if dice.any?{|roll| roll == 0} and dice.any?{|roll| roll != 0}
        STDERR.puts("Some dice were rolled and other weren't")
        exit(84)
    end

    return dice
end

def getComb(str)
    split_str = str.split('_', 2)

    if not Combinaisons.combinaisons_str.include?(split_str[0])
        STDERR.puts("Unknown combination")
        exit(84)
    end

    return split_str[0], split_str[1]
end

module Parameters
    def Parameters.parse_parameters(argv)
        dice = []
        comb = ""
        options = ""

        if argv.length == 1 and argv[0] == "-h"
            usage()
        elsif argv.length != 6
            STDERR.puts("Invalid number of arguments")
            exit(84)
        end

        dice = getDice(argv)
        comb, options = getComb(argv[5])

        return dice, comb, options
    end
end
