from math import ceil, sqrt


def sieve(limit):
    candidates = {number: True for number in range(2, limit + 1)}

    def isUndefined(x):
        return candidates[x] is True

    def isPrime(x):
        return candidates[x] is True

    def setAsNotPrime(x):
        candidates[x] = False

    sqrt_limit = ceil(sqrt(limit))
    for i in range(2, sqrt_limit):
        if isUndefined(i):
            for j in range(i**2, limit+1, i):
                setAsNotPrime(j)

    return [x for x in range(2, limit + 1) if isPrime(x)]
