def sum_of_multiples(limit, factors=[3, 5]):
    total = 0
    factors = [factor for factor in factors if factor != 0]
    for number in range(limit):
        if any(map(lambda fac: number % fac == 0, factors)):
            total += number
    return total
