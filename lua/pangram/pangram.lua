local byte = string.byte
local A_ASCII_VALUE, Z_ASCII_VALUE = byte('a'), byte('z')

local is_pangram = function(phrase)
    local alphabet = {}
    -- initialize char occurrences table
    for c = A_ASCII_VALUE, Z_ASCII_VALUE do
        alphabet[c] = false
    end

    -- registry char occurrences
    for c in phrase:lower():gmatch('.') do
        alphabet[byte(c)] = true
    end

    -- count chars occurrences that matters: [A-Z]
    local count = 0
    for c = A_ASCII_VALUE, Z_ASCII_VALUE do
        if alphabet[c] then
            count = count + 1
        end
    end

    return count >= 26
end

return is_pangram
