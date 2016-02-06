nth = function(n)
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

    local iter = n - 2
    local param = 3
    while iter > 0 do
        if is_prime(6 * param - 1) then
            iter = iter - 1
        end

        if iter == 0 then break end

        if is_prime(6 * param + 1) then
            iter = iter - 1
        end
        param = param + 1
    end

    return prime_list[n]
end

return nth
