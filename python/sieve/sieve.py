from math import ceil, sqrt


def sieve(limit):
    Undefined = 0
    NotPrime = 1
    Prime = 2
    candidates = {number: Undefined for number in range(2, limit + 1)}

    def isUndefined(x):
        return candidates[x] == Undefined

    def isPrime(x):
        return candidates[x] == Prime

    candidates[2] = Prime
    current_prime = 2
    sqrt_limit = ceil(sqrt(limit))

    while current_prime < sqrt_limit:
        # marking
        for number in candidates:
            if isUndefined(number) and number % current_prime == 0:
                candidates[number] = NotPrime

        # find next unmarked
        for number in range(current_prime, limit + 1):
            if isUndefined(number):
                candidates[number] = Prime
                current_prime = number
                break

    # mark unmarked as prime
    for number in range(current_prime, limit + 1):
        if isUndefined(number):
            candidates[number] = Prime
    return [number for number in candidates if isPrime(number)]
