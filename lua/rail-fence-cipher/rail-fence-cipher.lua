local function encode(source, fences)
    local channel = {}
    for fence = 1, fences do
        channel[fence] = {}
    end

    local fence_index = coroutine.wrap(function()
        while true do
            for i = 1, 2*fences - 2 do
                if i <= fences then
                    coroutine.yield(i)
                else
                    coroutine.yield(2*fences - i)
                end
            end
        end
    end)

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
