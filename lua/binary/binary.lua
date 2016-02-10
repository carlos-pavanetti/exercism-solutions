local to_decimal = function(binary_string)
    local decimal_number = 0

    for digit in binary_string:gmatch('.') do
        decimal_number = (decimal_number << 1)
                       + (digit == '1' and 1 or 0)
    end

    return decimal_number
end

return { to_decimal = to_decimal }
