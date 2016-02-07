local default_students = {
    "alice",
    "bob",
    "charlie",
    "david",
    "eve",
    "fred",
    "ginny",
    "harriet",
    "ileana",
    "joseph",
    "kincaid",
    "larry"
}

local MAPS_INITTIAL_TO_PLANT = { V = 'violets', R = 'radishes', G = 'grass', C = 'clover' }
local toplant = function(inittial)
    return MAPS_INITTIAL_TO_PLANT[inittial:upper()]
end

local garden_mt = {
    __index = function(garden, key)
        local lower_key = key:lower()
        return garden.__cups[lower_key] or {}
    end
}

local insert, floor = table.insert, math.floor
return function(garden_string, students)
    students = students or default_students

    local garden = { __cups = {} }
    for _, student in pairs(students) do
        garden.__cups[student] = {}
    end

    for row in garden_string:gmatch('[^\n]+') do
        local kid_number = 1
        for cup in row:gmatch('.') do
            local kid = students[floor(kid_number)]

            insert(garden.__cups[kid], toplant(cup))
            kid_number = kid_number + 0.5
        end
    end

    return setmetatable(garden, garden_mt)
end
