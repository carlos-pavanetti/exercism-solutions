
local aliquot_sum = function(number)
    if number == 1 then
        return 0
    end

    local aliq_sum = 1

    local divisor = 2
    while divisor^2 < number do
        if number % divisor == 0 then
            -- n = p*q | p,q ∈ Z
            -- adds current divisor [p] and its reciprocal divisor [q]
            aliq_sum = aliq_sum + divisor + (number / divisor)
        end

        divisor = divisor + 1
    end

    -- if number is a perfect square, accumulate square root divisor only once
    if divisor^2 == number then
        aliq_sum = aliq_sum + divisor
    end

    return aliq_sum
end

local classify = function (number)
    local aliq_sum = aliquot_sum(number)

    if aliq_sum > number then
        return 'abundant'
    elseif aliq_sum < number then
        return 'deficient'
    else
        return 'perfect'
    end
end

return {aliquot_sum = aliquot_sum, classify = classify}
