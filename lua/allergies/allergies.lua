local allergenic_list = {
    'eggs', 'peanuts', 'shellfish', 'strawberries',
    'tomatoes', 'chocolate', 'pollen', 'cats',
}

local function allergic_to(score, allergenic)
    local allergenic_score = 1
    for _, value in ipairs(allergenic_list) do
        if value == allergenic then
            break
        end
        allergenic_score = allergenic_score << 1
    end
    return score & allergenic_score == allergenic_score
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
