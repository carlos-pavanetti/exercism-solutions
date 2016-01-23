def str_to_digit(string):
    return [int(digit) for digit in string]


def slices(string, size):
    if len(string) < size:
        raise ValueError("Slice size could not be bigger than string")
    str_slices = [string[i:i+size] for i in range(len(string) - size + 1)]
    num_slices = [str_to_digit(i) for i in str_slices]
    return num_slices


def largest_product(string, size):
    num_slices = slices(string, size)
    largest_prod = 1
    for slice_group in num_slices:
        product = 1
        for number in slice_group:
            product *= number
        if product > largest_prod:
            largest_prod = product
    return largest_prod
