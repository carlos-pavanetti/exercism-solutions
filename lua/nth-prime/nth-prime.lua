return function(n)
    assert(n > 0, 'Should be passed a positive (>0) parameter')

    local prime_list = {2, 3, 5, 7, 11, 13}

    if n <= 6 then
        return prime_list[n]
    end

    local is_prime = function(candidate)
        for _, prime in ipairs(prime_list) do
            if prime^2 > candidate then
                break
            elseif candidate % prime == 0 then
                return false
            end
        end

        table.insert(prime_list, candidate)
        return true
    end

    local generate_prime_candidate = coroutine.wrap(function()
        local k = 3
        while true do
            coroutine.yield(6*k-1)
            coroutine.yield(6*k+1)
            k = k + 1
        end
    end)

    local primes_remaining = n - 6
    while primes_remaining > 0 do
        if is_prime(generate_prime_candidate()) then
            primes_remaining = primes_remaining - 1
        end
    end

    return prime_list[n]
end
