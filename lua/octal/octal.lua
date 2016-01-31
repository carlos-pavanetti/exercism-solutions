return function(octal_string)
    return {
        to_decimal = function()
            local number = 0

            for octal_digit in octal_string:gmatch('.') do
                octal_digit = tonumber(octal_digit)
                if not octal_digit or octal_digit >= 8 then
                    return 0
                end
                number = (number << 3) +  octal_digit
            end

            return number
        end
    }
end
