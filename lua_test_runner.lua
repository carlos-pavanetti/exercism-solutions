local lfs = require 'lfs'

local path_bak = package.path
for dir in lfs.dir './lua' do
    dir = './lua/' .. dir
    package.path = dir .. '/?.lua;' .. package.path
    print(dir)
    print(package.path)
    require('busted.runner')({ _all = { ROOT = { dir } }, standalone = false })
    package.path = path_bak
end
