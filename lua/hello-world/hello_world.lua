local hello = function(name)
    name = name or "world"
    return string.format("Hello, %s!", name)
end

return { hello = hello }
