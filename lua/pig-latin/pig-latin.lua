local specials_consonants = { ch = true, qu = true, th = true, thr = true, sch = true}

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

local function process_word(word)
    local first_letter, tail = word:match('(.)(.+)')
    local two_first_letters, rest_two = word:match('(..)(.+)')
    if word:begin_with_any_of({ '[aeiou]', 'yt', 'xr' }) then
        return word .. 'ay'
    elseif word:begin_with_any_of({ '[^aeiou]qu', 'thr', 'sch' }) then
        return word:reverse_split_at(3) .. 'ay'
    elseif word:begin_with_any_of({ 'qu', 'ch', 'th' }) then
        return word:reverse_split_at(2) .. 'ay'
    else
        return tail .. first_letter .. 'ay'
    end
end

return function(phrase)
    return phrase:gsub('%a+', process_word)
end
