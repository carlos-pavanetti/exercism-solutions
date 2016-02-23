function string.begin_with_any_of(word, patterns)
    for _, pattern in ipairs(patterns) do
        if word:find('^' .. pattern) then
            return true
        end
    end
end

function string.reverse_split_at(str, pos)
    return str:sub(pos + 1) .. str:sub(1, pos)
end

local vowel_patterns = { '[aeiou]', 'yt', 'xr' }
local three_consonants_patterns = { '[^aeiou]qu', 'thr', 'sch' }
local two_consonants_patterns = { 'qu', 'ch', 'th' }

local function process_word(word)
    if word:begin_with_any_of(vowel_patterns) then
        return word .. 'ay'
    elseif word:begin_with_any_of(three_consonants_patterns) then
        return word:reverse_split_at(3) .. 'ay'
    elseif word:begin_with_any_of(two_consonants_patterns) then
        return word:reverse_split_at(2) .. 'ay'
    else
        return word:reverse_split_at(1) .. 'ay'
    end
end

return function(phrase)
    return phrase:gsub('%a+', process_word)
end
