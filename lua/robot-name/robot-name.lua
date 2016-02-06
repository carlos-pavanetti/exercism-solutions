local random = math.random
local char, tostring = string.char, tostring
local concat, insert = table.concat, table.insert

local generate_random_digit = function()
    return tostring(random(9))
end

local generate_random_letter = function()
    return char(random(97, 122))
end

local ACTIVE_NAMES = {}
local generate_robot_name = function()
    local NUM_LETTERS = 2
    local NUM_DIGITS  = 3

    local new_name
    repeat
        local name_chars = {}
        for letter = 1, NUM_LETTERS do
            insert(name_chars, generate_random_letter())
        end
        for digit = 1, NUM_DIGITS do
            insert(name_chars, generate_random_digit())
        end
        new_name = concat(name_chars)
    until not ACTIVE_NAMES[new_name]

    ACTIVE_NAMES[new_name] = true
    return new_name
end
--------------------------------------------------------------------------------
local robot    = {}
local robot_mt = { __index = robot }

robot.new = function()
    local self = { name = generate_robot_name () }
    return setmetatable(self, robot_mt)
end

robot.reset = function(self)
    local old_name = self.name
    self.name = generate_robot_name()

    ACTIVE_NAMES[old_name] = false
end

return robot
