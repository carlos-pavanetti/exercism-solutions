local phone_number    = {}
local phone_number_mt = { __index = phone_number }

phone_number.new = function(_, phone_string)
    local self = {}
    local cleaned = phone_string:gsub('%D', '')

    if #cleaned == 11 and cleaned:sub(1,1) == '1' then
        self.number = cleaned:sub(2)
    elseif #cleaned == 10 then
        self.number = cleaned
    else
        self.number = '0000000000'
    end

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
