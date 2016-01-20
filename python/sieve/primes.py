from math import ceil, sqrt


def generate_primes(limit):
    primes = [2, 3]

    def is_prime(number):
        sqrt_limit = ceil(sqrt(number))
        for prime in primes[2:]:
            if prime > sqrt_limit:
                return True
            if number % prime == 0:
                return False
        return True

    for number in range(5, limit + 1, 6):
        if is_prime(number):
            primes.append(number)
        if is_prime(number + 2):
            primes.append(number + 2)
    return primes
