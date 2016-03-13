local function triangular(x, n)
    return n - math.abs(n-x)
end

local function periodic_triangular(period)
    return coroutine.wrap(function()
        while true do
            for i = 1, period - 1 do
                coroutine.yield(triangular(i, period//2 + 1))
            end
        end
    end)
end

local function concat_each(string_table)
    for i, v in ipairs(string_table) do
        string_table[i] = table.concat(v)
    end
end

local function encode(source, fences)
    local channel = {}
    for fence = 1, fences do
        channel[fence] = {}
    end

    local fence_index = periodic_triangular(2 * fences - 1)
    for char in source:gmatch('.') do
        table.insert(channel[fence_index()], char)
    end

    concat_each(channel)
    return table.concat(channel)
end

local function decode(channel, fences)
    local m = (channel:len() - 1) // (2 * (fences - 1))
    local source = {}

    table.insert(source, channel.sub(1, m + 1))
    channel = channel:sub(m + 2)

    for fence = 2, fences - 1 do
        table.insert(source, channel.sub(1, 2 * m))
        channel = channel:sub(2 * m + 1)
    end

    table.insert(source, channel.sub(1, m))

    return table.concat(source)
end

return { encode = encode, decode = decode }
