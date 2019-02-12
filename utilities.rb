module Utilities
    def Utilities.factorial(size_set)
        fact = 1
        size_set.times do |n|
            fact *= n + 1
        end
        return fact
    end

    def Utilities.combinations(n, k)
        return factorial(n) / (factorial(k) * factorial(n - k))
    end

    # with repetitions
    def Utilities.rcombinations(n, k)
        return factorial(k + n - 1) / (factorial(k) * factorial(n - 1))
    end
end
