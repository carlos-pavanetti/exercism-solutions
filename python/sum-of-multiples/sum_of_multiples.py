def sum_of_multiples(limit, factors=[3, 5]):
    factors = filter(factor != 0 for factor in factors)
    return sum(number for number in range(limit)
               if any(number % factor == 0 for factor in factors))
