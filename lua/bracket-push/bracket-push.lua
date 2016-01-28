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
        ['('] = ')',
        ['['] = ']',
        ['{'] = '}'
    }
    local closes = {
        [')'] = true,
        [']'] = true,
        ['}'] = true
    }

    local validating_stack = stack.new()

    for char in str:gmatch('.') do
        if opens[char] then
            validating_stack:push(opens[char])
        elseif closes[char] then
            if validating_stack:pop() ~= char then
                return false
            end
        end
    end

    return validating_stack:empty()
end

return {valid = valid}
