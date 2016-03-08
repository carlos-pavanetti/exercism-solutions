class ListResult(object):
    def inverse(self):
        if self == SUBLIST:
            return SUPERLIST
        if self == SUPERLIST:
            return SUBLIST
        return self

SUBLIST = ListResult()
SUPERLIST = ListResult()
EQUAL = ListResult()
UNEQUAL = ListResult()


def check_lists(A, B):
    if len(A) > len(B):
        return check_lists(B, A).inverse()
    if A == B:
        return EQUAL
    if A == B[:len(A)]:
        return SUBLIST
