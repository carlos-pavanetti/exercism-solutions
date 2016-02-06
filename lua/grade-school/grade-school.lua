local deep_copy

local school    = {}
local school_mt = { __index = school }

school.new = function()
    return setmetatable({ __grades = {} }, school_mt)
end

school.add = function(self, new_student_name, grade_number)
    if not self.__grades[grade_number] then
        self.__grades[grade_number] = {new_student_name}
        return
    end

    local current_grade = self.__grades[grade_number]
    local student_inserted = false

    for position, student_name in ipairs(current_grade) do
        if student_name > new_student_name then
            table.insert(current_grade, position, new_student_name)

            student_inserted = true
            break
        end
    end

    if not student_inserted then -- insert at end
        table.insert(current_grade, new_student_name)
    end

     self.__grades[grade_number] = current_grade
end


school.roster = function(self)
    return deep_copy(self.__grades)
end

school.grade = function(self, grade)
    return deep_copy(self.__grades[grade]) or {}
end

deep_copy = function(source)
    if type(source) ~= "table" then return source end

    local target = {}
    for key, value in pairs(source) do
        target[key] = deep_copy(value)
    end
    -- setmetatable(target, getmetatable(source))
    return target
end

return school
