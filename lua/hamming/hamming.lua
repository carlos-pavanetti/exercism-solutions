local compute = function(strandA, strandB)
    local diff = 0
    for i=1, strandA:len() do
        if strandA:byte(i) ~= strandB:byte(i) then
            diff = diff + 1
        end
    end
    return diff
end

return { compute = compute }
