local beer = {}

local sprintf = string.format

beer.verse = function(verse)
    local next_verse = (verse - 1) % 100
    local firstPart = "%s of beer on the wall, %s of beer.\n"
    local lastPart
    if verse == 0 then
        lastPart =
            "Go to the store and buy some more, %s of beer on the wall.\n"
    elseif verse == 1 then
        lastPart = "Take it down and pass it around, %s of beer on the wall.\n"
    else
        lastPart = "Take one down and pass it around, %s of beer on the wall.\n"
    end

    local bottles = beer.bottles(verse)
    local capitalized_bottles = beer.bottles(verse, true)
    local next_bottles = beer.bottles(next_verse)

    return sprintf(firstPart .. lastPart,
                   capitalized_bottles, bottles, next_bottles)
end

beer.bottles = function(number, capitalize)
    local bottles
    if number == 0 then
        bottles = "no more bottles"
    elseif number == 1 then
        bottles = "1 bottle"
    else
        bottles = number .. " bottles"
    end

    if capitalize then
        bottles = bottles:gsub("^%l", string.upper)
    end

    return bottles
end

local insert, remove, concat = table.insert, table.remove, table.concat
beer.sing = function(from, to)
    to = to and to or 0

    local song = {}
    for verse = from, to, -1 do
        insert(song, beer.verse(verse))
        insert(song, '\n')
    end
    remove(song)

    return concat(song)
end

return beer
