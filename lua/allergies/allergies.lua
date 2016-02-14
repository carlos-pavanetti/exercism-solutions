local allergenic_list = {
    'eggs', 'peanuts', 'shellfish', 'strawberries',
    'tomatoes', 'chocolate', 'pollen', 'cats',
}

local function allergic_to(score, allergenic)
    for _, value in ipairs(allergenic_list) do
        if value == allergenic then
            return score & 1 ~= 0
        end

        score = score >> 1
    end
end

local function list(score)
    local allergies = {}
    for _, allergenic in ipairs(allergenic_list) do
        if allergic_to(score, allergenic) then
            table.insert(allergies, allergenic)
        end
    end

    return allergies
end

return { list = list, allergic_to = allergic_to }
