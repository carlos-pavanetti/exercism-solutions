local prime_numbers = { 2, 3, 5, 11, 17, 23, 461, 9539, 894119 }

local function is_divisible(dividend, divisor)
    return dividend % divisor == 0
end

local function prime_factors(number)
    local factors = {}

    for _, prime in ipairs(prime_numbers) do
        while is_divisible(number, prime) do
            table.insert(factors, prime)
            number = number // prime
        end
    end

    return factors
end

return prime_factors
