def is_triplet(triplet):
    a, b, c = triplet
    hyp = max(a, b, c)
    c_a = min(a, b, c)
    c_b = (a + b + c) - (hyp + c_a)

    return (c_a ** 2 + c_b ** 2) == hyp ** 2


def primitive_triplets(b):
    if b % 4 > 0:
        raise ValueError

    mn = b // 2
    triplets = []
    for m in range(1, mn, 2):
        if mn % m > 0:
            continue
        n = mn // m
        triplet = [abs(m**2 - n**2), b, m**2 + n**2]
        triplet.sort()
        triplets.append(tuple(triplet))
    return set(triplets)


def triplets_in_range(min, max):
    pass
