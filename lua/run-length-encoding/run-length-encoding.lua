local function decode(channel)
    local source = {}
    for times, char in channel:gmatch('(%d*)(%w)') do
        if type(tonumber(times)) ~= 'number' then times = 1 end

        for i = 1, times do
            table.insert(source, char)
        end
    end
    return table.concat(source)
end

local function encode(source)
    for char in source:gmatch('.') do
        --
    end
end
