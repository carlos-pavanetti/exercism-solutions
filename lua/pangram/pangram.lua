local byte, char = string.byte, string.char

local is_pangram = function(phrase)
    local alphabet = {}
    for c = 97, 122 do  -- [a-z]
        alphabet[char(c)] = false
    end

    for c in phrase:lower():gmatch('.') do
        alphabet[c] = true
    end

    local count = 0
    for c = 97, 122 do
        if alphabet[char(c)] then
            count = count + 1
        end
    end
    return count >= 26
end

return is_pangram
