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
    local open_parens = string.byte('(')
    local open_sqbrks = string.byte('[')
    local open_bracks = string.byte('{')

    local close_parens = string.byte(')')
    local close_sqbrks = string.byte(']')
    local close_bracks = string.byte('}')

    local validating_stack = stack.new()

    for index_char=1, #str do
        local char = str:byte(index_char)

        if char == open_parens then
            validating_stack:push(1)
        elseif char == open_sqbrks then
            validating_stack:push(2)
        elseif char == open_bracks then
            validating_stack:push(3)

        elseif char == close_parens then
            if validating_stack:pop() ~= 1 then return false end
        elseif char == close_sqbrks then
            if validating_stack:pop() ~= 2 then return false end
        elseif char == close_bracks then
            if validating_stack:pop() ~= 3 then return false end
        end
    end

    if not validating_stack:empty() then
        return false
    end
    return true
end

return {valid = valid}
