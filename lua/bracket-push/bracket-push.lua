local stack = {}
local stack_mt = {__index = stack}

stack.new = function()
    return setmetatable({top=0}, stack_mt)
end

stack.push = function(self, value)
    self.top = self.top + 1
    self[self.top] = value
end

stack.get = function(self)
    return self[self.top]
end

stack.pop = function(self)
    if self.top == 0 then return end

    local top_value = self[self.top]

    self[self.top] = nil
    self.top = self.top - 1

    return top_value
end

stack.empty = function(self)
    return self.top == 0
end

local valid = function(str)
    local opens = {
        [string.byte('(')] = string.byte(')'),
        [string.byte('[')] = string.byte(']'),
        [string.byte('{')] = string.byte('}')
    }
    local closes = {
        [string.byte(')')] = true,
        [string.byte(']')] = true,
        [string.byte('}')] = true
    }

    local validating_stack = stack.new()

    for index_char=1, #str do
        local char = str:byte(index_char)
        if opens[char] then
            validating_stack:push(opens[char])
        elseif closes[char] then
            if validating_stack:pop() ~= char then
                return false
            end
        end
    end

    if not validating_stack:empty() then
        return false
    end
    return true
end

return {valid = valid}
