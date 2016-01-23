from functools import reduce
import operator


def str_to_digit(string):
    return [int(digit) for digit in string]


def slices(string, size):
    if len(string) < size:
        raise ValueError("Slice size could not be bigger than string")

    str_slices = [string[i:i+size] for i in range(len(string) - size + 1)]
    num_slices = [str_to_digit(i) for i in str_slices]
    return num_slices


def largest_product(string, size):
    if size is 0:
        return 1

    slices_of_numbers = slices(string, size)
    return max(reduce(operator.mul, group) for group in slices_of_numbers)
