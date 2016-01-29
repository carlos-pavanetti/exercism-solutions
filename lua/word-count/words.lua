return {
    word_count = function(phrase)
        local count = {}
        for word in phrase:lower():gmatch('%w+') do
            count[word] = (count[word] or 0) + 1
        end
        return count
    end
}
