class Luhn(object):
    def __init__(self, number):
        self.number = number

    def addends(self):
        result = []
        double = False
        number = self.number

        while number > 0:
            digit = number % 10
            if double:
                digit *= 2
                digit = digit % 10 + 1 if digit > 9 else digit
            double = not double

            result.append(digit)
            number = int(number / 10)

        return result

    def checksum(self):
        return sum(self.addends()) % 10

    def is_valid(self):
        return self.checksum() == 0

    def create(number):
        number *= 10
        luhn_number = Luhn(number)

        check_digit = 9 * luhn_number.checksum() % 10
        return number + check_digit
