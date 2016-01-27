local objects = {
    {noun = "house that Jack built"},
    {noun = "malt", verb = "lay in"},
    {noun = "rat", verb = "ate"},
    {noun = "cat", verb = "killed"},
    {noun = "dog", verb = "worried"},
    {noun = "cow with the crumpled horn", verb = "tossed"},
    {noun = "maiden all forlorn", verb = "milked"},
    {noun = "man all tattered and torn", verb = "kissed"},
    {noun = "priest all shaven and shorn", verb = "married"},
    {noun = "rooster that crowed in the morn", verb = "woke"},
    {noun = "farmer sowing his corn", verb = "kept"},
    {noun = "horse and the hound and the horn", verb = "belonged to"}
}

local house = {}

house.verse = function (number, first)
    if first ~= false then first = true end

    local next
    if number == 1 then
        next = '.'
    elseif number <= 12 then
        next = house.verse(number - 1, false)
    else
        return house.verse(12, true)
    end

    local noun = objects[number].noun

    if first then
        return "This is the " .. noun .. next
    else
        local verb = objects[number + 1].verb
        return "\nthat " .. verb .. " the " .. noun .. next
    end
end

house.recite = function ()
    local rhyme = {}
    for i=1, 12 do
        table.insert(rhyme, house.verse(i))
    end
    return table.concat(rhyme, '\n')
end

return house
