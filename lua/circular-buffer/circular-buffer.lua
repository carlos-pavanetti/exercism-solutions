local circular_buffer    = {}
local circular_buffer_mt = { __index = circular_buffer }

circular_buffer.new = function(_, capacity)
    local prototype = {
        _capacity = capacity,
        _content = {},
        _read_index = 1,
        _write_index = 1
    }

    return setmetatable(prototype, circular_buffer_mt)
end

circular_buffer.clear = function(self)
    self._content = {}
    self._read_index = self._write_index
end

local is_nil = function(value) return value == nil end
local is_not_nil = function(value) return value ~= nil end

local increment_index = function(buffer, index)
    local index_key = table.concat {'_', index, '_index'}
    buffer[index_key] = (buffer[index_key] + 1) % buffer._capacity
end

circular_buffer.read = function(self)
    assert(is_not_nil(self._content[self._read_index]), 'buffer is empty')

    local result = self._content[self._read_index]
    self._content[self._read_index] = nil

    increment_index(self, 'read')
    return result
end

circular_buffer.write = function(self, value)
    assert(is_nil(self._content[self._write_index]), 'buffer is full')

    if is_nil(value) then return end

    self._content[self._write_index] = value
    increment_index(self, 'write')
end

circular_buffer.forceWrite = function(self, value)
    if is_nil(value) then return end

    self._content[self._write_index] = value
    if self._read_index == self._write_index then
        increment_index(self, 'read')
    end
    increment_index(self, 'write')
end

return circular_buffer
