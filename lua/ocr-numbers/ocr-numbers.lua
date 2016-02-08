local convert_by_line, group_digits, split_text,
convert_digit, transpose, pavanetti_sum

local convert = function(text)
    return (convert_by_line(split_text(text)))
end

split_text = function(text)
    local lines = {}
    for line in text:gmatch('[^\n]+') do
        table.insert(lines, {line})
    end
    return lines
end

convert_by_line = function(lines)
    local converted = {}
    local digits = group_digits(lines)

    for _, digit in ipairs(digits) do
        table.insert(converted, convert_digit(digit))
    end

    return table.concat(converted)
end

group_digits = function(lines)
    local digits = {}
    for _, line in ipairs(lines) do
        local optical_digit = {}
        for chunksOf3 in table.concat(line):gmatch('...') do
            table.insert(optical_digit, chunksOf3)
        end
        table.insert(digits, optical_digit)
    end
    return transpose(digits)
end

transpose = function(original)
    local transposed = {}

    for i=1, #original[1] do
        transposed[i] = {}
        for j=1, #original do
            transposed[i][j] = original[j][i]
        end
    end

    return transposed
end

convert_digit = function(optical_digit)
    local trained_sum_pattern = pavanetti_sum(optical_digit)
    local conversor_table = {
        [13284]   = 1,
        [1628829] = 2,
        [1627533] = 3,
        [151065]  = 4,
        [1732509] = 5,
        [1733967] = 6,
        [1607607] = 7,
        [1747089] = 8,
        [1745631] = 9,
        [1727406] = 0
    }

    return conversor_table[trained_sum_pattern] or '?'
end

pavanetti_sum = function(optical_digit)
    local sum = 0
    for char in table.concat(optical_digit, '\n'):gmatch('.') do
        sum = 3 * sum + (char == '_' and 1 or 0) + (char == '|' and 2 or 0)
    end
    return sum
end

return { convert = convert }
