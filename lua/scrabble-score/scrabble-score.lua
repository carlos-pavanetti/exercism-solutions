package.path = '../?.lua;' .. package.path

local map    = require('list-ops.list-ops').map
local reduce = require('list-ops.list-ops').reduce
local string_to_list = require('list-ops.list-ops').string_to_list

local add = function(x, acc) return x + acc end

local score_map = {}
for char in ('AEIOULNRST'):gmatch('.') do score_map[char] =  1 end
for char in         ('DG'):gmatch('.') do score_map[char] =  2 end
for char in       ('BCMP'):gmatch('.') do score_map[char] =  3 end
for char in      ('FHVWY'):gmatch('.') do score_map[char] =  4 end
for char in          ('K'):gmatch('.') do score_map[char] =  5 end
for char in         ('JX'):gmatch('.') do score_map[char] =  8 end
for char in         ('QZ'):gmatch('.') do score_map[char] = 10 end

local score_letter = function(letter)
    return score_map[letter] or 0
end

return { score = function(word)
    word = string_to_list((word or ''):upper())
    return reduce(map(word, score_letter), 0, add)
end }
