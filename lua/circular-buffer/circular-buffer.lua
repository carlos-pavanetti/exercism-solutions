local circular_buffer    = {}
local circular_buffer_mt = { __index = circular_buffer }


circular_buffer.new = function(_, capacity)
    local prototype = {
        _capacity = capacity,
        _content = {},
        _read_index = 0,
        _write_index = 0
    }

    return setmetatable(prototype, circular_buffer_mt)
end

circular_buffer.read = function(self)
    assert(self._content[self._read_index] ~= nil, 'buffer is empty')

    local result = self._content[self._read_index]
    self._content[self._read_index] = nil

    self._read_index = (self._read_index + 1) % self._capacity
    return result
end

circular_buffer.write = function(self, value)
    assert(self._content[self._write_index] == nil, 'buffer is full')

    if value == nil then return end

    self._content[self._write_index] = value
    self._write_index = (self._write_index + 1) % self._capacity
end

circular_buffer.forceWrite = function(self, value)
    if value == nil then return end

    -- if self._content[self._write_index] ~= nil then
    --     self._read_index = (self._read_index - 1) % self._capacity
    -- end

    self._content[self._write_index] = value
    if self._read_index == self._write_index then
        self._read_index = (self._read_index + 1) % self._capacity
    end
    self._write_index = (self._write_index % self._capacity) + 1
end

circular_buffer.clear = function(self)
    self._content = {
        _capacity = self.capacity,
        _content = {},
        _read_index = 1,
        _write_index = 1
    }
end

return circular_buffer
