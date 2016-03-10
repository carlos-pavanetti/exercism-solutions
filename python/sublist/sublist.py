from enum import IntEnum


class SublistType(IntEnum):
    SUBLIST, SUPERLIST, EQUAL, UNEQUAL = range(4)

    def inverse(self):
        if self == SUBLIST:
            return SUPERLIST
        if self == SUPERLIST:
            return SUBLIST
        return self


SUBLIST, SUPERLIST = SublistType.SUBLIST, SublistType.SUPERLIST
EQUAL, UNEQUAL = SublistType.EQUAL, SublistType.UNEQUAL


def check_lists(A, B):
    length_a, length_b = len(A), len(B)

    if length_a > length_b:
        return check_lists(B, A).inverse()

    if A == B:
        return EQUAL

    for k in range(length_b - length_a + 1):
        if A == B[k: length_a + k]:
            return SUBLIST

    return UNEQUAL
