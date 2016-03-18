local robot = {}
local robot_mt = { __index = robot }

function robot.new(self)
    self = self or {}
    self.x = self.x or 0
    self.y = self.y or 0
    self.heading = self.heading or 'north'

    return setmetatable(self, robot_mt)
end

function robot:move(command)
    for movement in command:gmatch('.') do
        if movement == 'R' then
            self:turn_right()
        elseif movement == 'L' then
            self:turn_left()
        elseif movement == 'A' then
            self:advance()
        else
            error('')
        end
    end
end

local clockwise = { north = 1, east = 2, south = 3, west = 0 }
-- local counter_clockwise = { north = 1, west = 2, south = 3, west = 0 }

function robot:turn_right()
    local new_heading_value = (clockwise[self.heading] + 1) % 4
    for heading, value in pairs(clockwise) do
        if value == new_heading_value then
            self.heading = heading
            break
        end
    end
end

function robot:turn_left()
    local new_heading_value = (clockwise[self.heading] - 1) % 4
    for heading, value in pairs(clockwise) do
        if value == new_heading_value then
            self.heading = heading
            break
        end
    end
end

function robot:advance()
    local x, y = self.x, self.y
    if self.heading == 'north' then
        y = y + 1
    elseif self.heading == 'south' then
        y = y - 1
    elseif self.heading == 'east' then
        x = x + 1
    elseif self.heading == 'west' then
        x = x - 1
    end

    self.x = x
    self.y = y
end

return robot.new
