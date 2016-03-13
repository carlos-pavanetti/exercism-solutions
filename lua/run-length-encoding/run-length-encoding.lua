local function decode(channel)
    local source = {}
    for times, char in channel:gmatch('(%d*)(%D)') do
        if type(tonumber(times)) ~= 'number' then times = 1 end

        for _ = 1, times do
            table.insert(source, char)
        end
    end
    return table.concat(source)
end

local function encode(source)
    local channel = {}
    local current = {}

    local function push_last_char()
        if current.count then
            if current.count > 1 then
                table.insert(channel, current.count)
            end
            table.insert(channel, current.char)
        end
    end

    for char in source:gmatch('.') do
        if current.char == char then
            current.count = current.count + 1
        else
            push_last_char()
            current = { char = char, count = 1 }
        end
    end
    push_last_char()

    return table.concat(channel)
end

return { decode = decode, encode = encode }
