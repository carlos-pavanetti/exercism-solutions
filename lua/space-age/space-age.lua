local space_age    = {}
local space_age_mt = {}

space_age.new = function(_, seconds)
    local self = { seconds = seconds }
    return setmetatable(self, space_age_mt)
end

local year_duration_at = {
    earth   = 31557600,
    mercury = 31557600 * 0.2408467,
    venus   = 31557600 * 0.61519726,
    mars    = 31557600 * 1.8808158,
    jupiter = 31557600 * 11.862615,
    saturn  = 31557600 * 29.447498,
    uranus  = 31557600 * 84.016846,
    neptune = 31557600 * 164.79132,
}

local function round(number, decimals)
  local factor = 10^(decimals or 0)
  return math.floor(number * factor + 0.5) / factor
end

local age_on = function(self, planet)
    return round(self.seconds / year_duration_at[planet], 2)
end

space_age_mt.__index = function(object, key)
    local found, _, planet = key:find('^on_(%w+)')
    if found and year_duration_at[planet] then
        -- I would create a table to validate 'planet', but this one works.
        return function() return age_on(object, planet) end
    end

    return space_age[key]
end

return space_age
