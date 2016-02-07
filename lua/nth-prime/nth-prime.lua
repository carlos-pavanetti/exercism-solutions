local prime_list = {2, 3, 5, 7, 11, 13}

local is_prime = function(candidate)
    for _, prime in ipairs(prime_list) do
        if prime^2 > candidate then
            return true
        elseif candidate % prime == 0 then
            return false
        end
    end
end

local coroutine, yield = coroutine, coroutine.yield
local generate_prime_candidate = coroutine.wrap(function()
    local k = 3
    while true do
        yield(6*k-1)
        yield(6*k+1)
        k = k + 1
    end
end)

local insert = table.insert
return function(n)
    assert(n > 0, 'Should be passed a positive (>0) parameter')

    while #prime_list < n do
        local candidate = generate_prime_candidate()
        if is_prime(candidate) then
            insert(prime_list, candidate)
        end
    end

    return prime_list[n]
end
