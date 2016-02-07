local M = {}
if setfenv then
    -- Lua 5.1
    setfenv(1, M)
else
    -- Lua 5.2 or greater =D
    _ENV = M
end

square = function(sq)
    return 1 << (sq - 1)
end

local total_until = function(sq)
    return (1 << sq) - 1
end

total = function()
    return total_until(64)
end

return M
