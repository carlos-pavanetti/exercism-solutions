local byte, char = string.byte, string.char
local concat, insert = table.concat, table.insert

local cipher = function(src)
    if src < 'a' or src > 'z' then return src end

    local key = byte 'z' + byte 'a'
    return char(key - byte(src))
end

local encode = function(source_text)
    local encoded_chunks, chunk = {}, {}

    local insert_chunk = function()
        insert(encoded_chunks, concat(chunk))
        chunk = {}
    end

    for character in source_text:lower():gmatch('%w') do
        insert(chunk, cipher(character))
        if #chunk == 5 then insert_chunk() end
    end
    if #chunk > 0 then insert_chunk() end

    return concat(encoded_chunks, ' ')
end

return {
    encode = encode
}
