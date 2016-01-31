local tinsert, tonumber = table.insert, tonumber

local matrix_new = function (matrix_string)
    local self = {}

    for line in matrix_string:gmatch('[^\n\r]+') do
        local row = {}

        for number in line:gmatch('%d+') do
            tinsert(row, tonumber(number))
        end

        tinsert(self, row)
    end

    self.row = function(row)
        return self[row]
    end

    self.column = function(column)
        local col = {}
        for _, row in ipairs(self) do
            tinsert(col, row[column])
        end

        return col
    end

    return self
end

return matrix_new
