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

local function encode(source, fences)
    local channel = {}
    for fence = 1, fences do
        channel[fence] = {}
    end

    local fence_index = periodic_triangular(2 * fences - 1)

    for char in source:gmatch('.') do
        table.insert(channel[fence_index()], char)
    end

    for index, fence in ipairs(channel) do
        channel[index] = table.concat(fence)
    end
    return table.concat(channel)
end

local function decode()
    return 0
end

return { encode = encode, decode = decode }
