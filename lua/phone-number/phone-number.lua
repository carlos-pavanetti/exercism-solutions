local phone_number    = {}
local phone_number_mt = { __index = phone_number }

local clear_phone_number = function(unsafe_number)
    local safe_number = unsafe_number:gsub('%D', '')

    if #safe_number == 10 then
        return safe_number
    end

    if #safe_number == 11 and safe_number:sub(1,1) == '1' then
        return safe_number:sub(2)
    end

    return '0000000000'
end

phone_number.new = function(_, phone_string)
    local self = { number = clear_phone_number(phone_string) }
    return setmetatable(self, phone_number_mt)
end

phone_number.areaCode = function(self)
    return self.number:sub(1, 3)
end

phone_number_mt.__tostring = function(self)
    local area_code    = self.number:sub(1, 3)
    local first_slice  = self.number:sub(4, 6)
    local second_slice = self.number:sub(7, 10)

    return string.format('(%s) %s-%s', area_code, first_slice, second_slice)
end

return phone_number
