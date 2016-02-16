local allergen_list = {
    'eggs', 'peanuts', 'shellfish', 'strawberries',
    'tomatoes', 'chocolate', 'pollen', 'cats',
}

local function allergic_to(score, allergen)
    for _, value in ipairs(allergen_list) do
        if value == allergen then
            return score & 1 ~= 0
        end

        score = score >> 1
    end
end

local function list(score)
    local allergies = {}
    for _, allergen in ipairs(allergen_list) do
        if allergic_to(score, allergen) then
            table.insert(allergies, allergen)
        end
    end

    return allergies
end

return { list = list, allergic_to = allergic_to }
