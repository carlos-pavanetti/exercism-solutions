local clock    = {}
local clock_mt = { __index = clock }

clock.at = function(hours, minutes)
    minutes = minutes or 0

    local new_clock = {
        hours = (hours + minutes // 60) % 24,
        minutes = minutes % 60
    }
    return setmetatable(new_clock, clock_mt)
end

clock.plus = function(self, minutes)
    return clock.at(self.hours, self.minutes + minutes)
end

clock.minus = function(self, minutes)
    return clock.at(self.hours, self.minutes - minutes)
end

clock.equals = function(self, other)
    return self.hours == other.hours and self.minutes == other.minutes
end

clock_mt.__tostring = function(self)
    return string.format('%02d:%02d', self.hours, self.minutes)
end

clock_mt.__add = clock.plus
clock_mt.__sub = clock.minus
clock_mt.__eq  = clock.equals

return clock
