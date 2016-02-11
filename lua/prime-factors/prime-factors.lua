local prime_numbers = { 2, 3 }
local function is_prime(number)
    for _, prime in ipairs(prime_numbers) do
        if prime^2 > number then
            return true
        elseif number % prime == 0 then
            return false
        end
    end
end

local yield, wrap = coroutine.yield, coroutine.wrap
local generate_prime_candidate = wrap(function()
    local seed = 1
    while true do
        yield(6 * seed - 1)
        yield(6 * seed + 1)
        seed = seed + 1
    end
end)

setmetatable(prime_numbers, {
    __index = function(pns, index)
        local candidate
        repeat
            candidate = generate_prime_candidate()
        until is_prime(candidate)
        pns[index] = candidate
        return candidate
    end
})

local function is_divisible(dividend, divisor)
    return dividend % divisor == 0
end

local insert = table.insert
local function prime_factors(number)
    local factors = {}

    local prime_index = 1
    while number > 1 do
        local prime = prime_numbers[prime_index]
        while is_divisible(number, prime) do
            insert(factors, prime)
            number = number // prime
        end
        prime_index = prime_index + 1
    end

    return factors
end

return prime_factors
