return function(factor_list)
    factor_list = factor_list or { 3, 5 }
    local function is_divisible_by_one_of_list(number)
        for _, factor in ipairs(factor_list) do
            if number % factor == 0 then
                return true
            end
        end
        return false
    end

    return { to = function(upper_limit)
        local sum = 0
        for i = 1, upper_limit - 1 do
            if is_divisible_by_one_of_list(i) then
                sum = sum + i
            end
        end

        return sum
    end }
end
