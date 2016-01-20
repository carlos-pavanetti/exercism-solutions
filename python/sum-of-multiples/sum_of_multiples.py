def sum_of_multiples(limit, factors=[3, 5]):
    if factors[0] == 0:
        factors = factors[1:]
    return sum(number for number in range(limit)
               if any(number % factor == 0 for factor in factors))
