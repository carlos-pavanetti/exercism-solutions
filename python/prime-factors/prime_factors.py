def prime_factors(number):
    factors = []

    def append_factor(fact):
        nonlocal number
        while number % fact == 0:
            factors.append(fact)
            number /= fact

    append_factor(2)
    append_factor(3)

    add2 = True
    possible_prime = 5
    while number > 1:
        if (possible_prime ** 2) > number:
            factors.append(number)
            break

        append_factor(possible_prime)
        possible_prime += 2 if add2 else 4
        add2 = not add2

    return factors
