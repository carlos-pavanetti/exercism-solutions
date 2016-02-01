def prime_factors(number):
    factors = []

    while number % 2 == 0:
        factors.append(2)
        number = number / 2
    while number % 3 == 0:
        factors.append(3)
        number = number / 3

    prime = 5
    while number > 1:
        while number % prime == 0:
            factors.append(prime)
            number = number / prime
        prime += 2

        while number % prime == 0:
            factors.append(prime)
            number = number / prime
        prime += 4

    return factors
