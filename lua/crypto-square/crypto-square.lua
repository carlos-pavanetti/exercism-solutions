local normalized_plaintext = function(source_text)
    return source_text:gsub('%W', ''):lower()
end

local size = function(source_text)
    local normalized_text = normalized_plaintext(source_text)

    local size = 1
    while #normalized_text > size^2 do
        size = size + 1
    end

    return size, normalized_text
end

local segments = function(source_text)
    local square_size, normalized_text = size(source_text)

    local segments = {}
    for i=1, #normalized_text, square_size do
        table.insert(segments, normalized_text:sub(i, i + square_size - 1))
    end

    return segments, square_size
end

local ciphertext = function(source_text)
    local splited_text, square_size = segments(source_text)

    local cipher = {}
    for i=1, square_size do cipher[i] = {} end

    for _, segment in ipairs(splited_text) do
        local cipher_line = 1
        for char in segment:gmatch('.') do
            table.insert(cipher[cipher_line], char)
            cipher_line = (cipher_line % square_size) + 1
        end
    end

    for i=1, square_size do cipher[i] = table.concat(cipher[i]) end
    return table.concat(cipher), cipher
end

local normalized_ciphertext = function(source_text)
    local _, segmented_cipher = ciphertext(source_text)
    return table.concat(segmented_cipher, ' ')
end

return {
    normalized_plaintext = normalized_plaintext,
    size = size,
    segments = segments,
    ciphertext = ciphertext,
    normalized_ciphertext = normalized_ciphertext
}
