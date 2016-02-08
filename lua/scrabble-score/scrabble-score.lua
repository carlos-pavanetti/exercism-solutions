package.path = '../?.lua;' .. package.path

local map    = require('list-ops.list-ops').map
local reduce = require('list-ops.list-ops').reduce
local string_to_list = require('list-ops.list-ops').string_to_list

local score_map = {
    A = 1, E = 1, I = 1, O = 1, U = 1, L = 1, N = 1, R = 1, S = 1, T = 1,
    D = 2, G = 2, B = 3, C = 3, M = 3, P = 3, F = 4, H = 4, V = 4, W = 4, Y = 4,
    K = 5, J = 8, X = 8, Q = 10, Z = 10
}
local score_letter = function(letter)
    return score_map[letter] or 0
end

local add = function(x, acc) return x + acc end
local score = function(word)
    word = string_to_list((word or ""):upper())

    return reduce(map(word, score_letter), 0, add)
end

return { score = score }
