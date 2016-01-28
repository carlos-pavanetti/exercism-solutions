return {
    word_count = function(phrase)
        count = {}
        for word in phrase:lower():gmatch('[%a%d]+') do
            if count[word] then
                count[word] = count[word] + 1
            else
                count[word] = 1
            end
        end
        return count
    end
}
