local trim = function (s)
    local n = s:find '%S'
    return n and s:match('.*%S', n) or ''
end

local hey = function(question)
    question = trim(question)
    if question == '' then  -- mmm...
        return 'Fine, be that way.'
    elseif question:upper() == question then  -- you yell me?
        return 'Whoa, chill out!'
    elseif question:byte(question:len()) == string.byte('?') then  -- w0t?
        return 'Sure'
    else
        return 'Whatever'
    end
end

return {hey = hey}
