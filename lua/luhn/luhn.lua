local luhn    = {}
local luhn_mt = { __index = luhn }

luhn.new = function(number)
    return setmetatable({ number = number }, luhn_mt)
end


luhn.check_digit = function(self)
    return tonumber(self.number:sub(-1))
end

luhn.checksum = function(self)
    local sum = 0
    for _, number in ipairs(self:addends()) do
        sum = sum + number
    end

    return sum
end

luhn.create = function(number)
    local checksum = luhn.new(number .. 0):checksum()
    local check_digit = 9 * checksum % 10

    return number .. check_digit
end

luhn.valid = function(self)
    return self:checksum() % 10 == 0
end

luhn.addends = function(self)
    local addends = {}
    local double = self.number:len() % 2 == 0

    for digit in self.number:gmatch('.') do
        local number = tonumber(digit) * (double and 2 or 1)
        if number >= 10 then
            number = number - 9
        end

        table.insert(addends, number)
        double = not double
    end
    return addends
end

return luhn
